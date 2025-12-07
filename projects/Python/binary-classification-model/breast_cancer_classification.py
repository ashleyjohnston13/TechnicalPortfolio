from pathlib import Path

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import (
    accuracy_score,
    classification_report,
    confusion_matrix,
    roc_curve,
    auc,
)

def main():
    data = load_breast_cancer(as_frame=True)
    X = data.data
    y = pd.Series(data.target, name="target")

    X_train, X_test, y_train, y_test = train_test_split(
        X,
        y,
        test_size=0.3,
        random_state=479,
        stratify=y,
    )

    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    X_test_scaled = scaler.transform(X_test)

    model = LogisticRegression(max_iter=1000, random_state=479)
    model.fit(X_train_scaled, y_train)

    y_prob = model.predict_proba(X_test_scaled)[:, 1]
    y_pred = (y_prob >= 0.5).astype(int)

    acc = accuracy_score(y_test, y_pred)
    print("Test Accuracy:", round(acc, 3))
    print("\nClassification Report:\n")
    print(classification_report(y_test, y_pred, target_names=["Malignant", "Benign"]))

    fpr, tpr, _ = roc_curve(y_test, y_prob)
    roc_auc = auc(fpr, tpr)

    cm = confusion_matrix(y_test, y_pred)

    plots_dir = Path("Plots")
    plots_dir.mkdir(exist_ok=True)

    fig, ax = plt.subplots(figsize=(6, 4))
    ax.plot(fpr, tpr, label=f"AUC = {roc_auc:.3f}")
    ax.plot([0, 1], [0, 1], linestyle="--", color="grey")
    ax.set_title("ROC Curve")
    ax.set_xlabel("False Positive Rate")
    ax.set_ylabel("True Positive Rate")
    ax.legend(loc="lower right")
    fig.tight_layout()
    fig.savefig(plots_dir / "roc_curve.png", dpi=300)
    plt.close(fig)

    fig, ax = plt.subplots(figsize=(4, 4))
    im = ax.imshow(cm, cmap="Oranges")
    ax.set_title(f"Confusion Matrix (Accuracy = {acc:.3f})")
    ax.set_xlabel("Predicted")
    ax.set_ylabel("Actual")
    ax.set_xticks([0, 1])
    ax.set_yticks([0, 1])
    ax.set_xticklabels(["Malignant", "Benign"])
    ax.set_yticklabels(["Malignant", "Benign"])

    for i in range(cm.shape[0]):
        for j in range(cm.shape[1]):
            ax.text(j, i, cm[i, j], ha="center", va="center", color="black")

    fig.colorbar(im, ax=ax, fraction=0.046, pad=0.04)
    fig.tight_layout()
    fig.savefig(plots_dir / "confusion_matrix.png", dpi=300)
    plt.close(fig)

    coef = model.coef_.flatten()
    abs_coef = np.abs(coef)
    coef_df = pd.DataFrame(
        {"feature": X.columns, "importance": abs_coef}
    ).sort_values("importance", ascending=True)

    fig, ax = plt.subplots(figsize=(6, 8))
    ax.barh(coef_df["feature"], coef_df["importance"])
    ax.set_title("Feature Importance (Absolute Coefficients)")
    ax.set_xlabel("|Coefficient|")
    fig.tight_layout()
    fig.savefig(plots_dir / "feature_importance.png", dpi=300)
    plt.close(fig)

    print("\nTop 5 features by absolute coefficient:\n")
    print(coef_df.sort_values("importance", ascending=False).head())

if __name__ == "__main__":
    main()
    
