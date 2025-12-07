# Breast Cancer Classification in Python  
_Logistic Regression with Scikit-Learn_

This project uses the **Breast Cancer Wisconsin dataset** to build a logistic regression model that predicts whether a tumor is **malignant** or **benign**.

It demonstrates my ability to work with Python for machine learning, including data preprocessing, scaling, model building, evaluation, and visualization.

---

## Project Overview

**Key skills demonstrated:**

- Loading and preparing real-world biomedical data  
- Splitting data into training and testing sets  
- Standardizing features  
- Training a logistic regression classifier  
- Evaluating performance using:  
  - Accuracy  
  - Classification report  
  - Confusion matrix  
  - ROC curve and AUC  
- Identifying feature importance  
- Saving visualizations programmatically

---

## Model Performance

**Test Accuracy:** ~0.97  
**AUC:** ~0.997  

The model performs extremely well on this dataset, showing strong separation between malignant and benign cases.

---

## Visualizations

### **ROC Curve**
Shows the tradeoff between sensitivity and specificity.  
Higher AUC indicates strong predictive power.

![ROC Curve](Plots/roc_curve.png)

---

### **Confusion Matrix**
Displays correct vs incorrect classifications for malignant and benign cases.

![Confusion Matrix](Plots/confusion_matrix.png)

---

### **Feature Importance (Absolute Coefficients)**
Higher absolute coefficients indicate stronger influence on the classification decision.

![Feature Importance](Plots/feature_importance.png)

---

## Top 5 Most Important Features

Based on absolute logistic regression coefficients:

1. radius error  
2. worst radius  
3. worst area  
4. compactness error  
5. worst concave points  

These features contribute most strongly to the model’s ability to distinguish malignant vs benign tumors.

---

## Code

All logic for preprocessing, modeling, and plotting is contained in: `breast_cancer_classification.py`

Running the script automatically:

- Trains the model  
- Prints performance metrics  
- Saves all plots into the `Plots/` folder  

---

## How to Run

```bash
python3 breast_cancer_classification.py
