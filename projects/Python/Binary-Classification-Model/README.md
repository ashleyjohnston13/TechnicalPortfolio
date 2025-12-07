# Binary Classification in Python: Breast Cancer Prediction

This project is a small, self-contained example of building and evaluating a binary classification model in Python using scikit-learn. The goal is to predict whether a tumor is **malignant** or **benign** using features from the built-in `load_breast_cancer` dataset.

This assignment reflects work from my Business Analytics coursework, and is meant to show my ability to use Python for:

- Data preparation and train/test splits  
- Logistic regression modeling  
- Model evaluation with accuracy, classification reports, and ROC/AUC  
- Simple feature importance and visualization

---

## 🎯 What This Project Shows

**Core skills:**

- Working with scikit-learn’s built-in datasets  
- Building a logistic regression pipeline with standardized features  
- Evaluating a model using:
  - Accuracy
  - Confusion matrix
  - ROC curve and AUC  
- Visualizing model results

---

## 🧠 Dataset

- **Source:** `sklearn.datasets.load_breast_cancer`  
- **Target:** `0 = malignant`, `1 = benign`  
- **Features:** 30 numeric predictors describing cell nuclei (radius, texture, smoothness, etc.)

No external files are required. The script pulls the dataset directly from scikit-learn.

---

## 🛠 Tools & Libraries

- Python 3  
- `pandas`  
- `numpy`  
- `scikit-learn`  
- `matplotlib`

Install everything with:

```bash
pip install pandas numpy scikit-learn matplotlib
