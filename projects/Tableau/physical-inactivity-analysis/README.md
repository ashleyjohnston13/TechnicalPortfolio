# 🏥 Physical Inactivity & Socioeconomic Drivers in Tennessee  
**ECON 381 — Applied Econometrics Project | Economics Collateral, Business Analytics B.S., University of Tennessee**

This project is part of my Economics collateral within my Business Analytics degree at the University of Tennessee. It analyzes the socioeconomic and environmental drivers of physical inactivity across Tennessee counties using regression modeling completed in Stata and visualizations created in Tableau.

The dataset comes from the 2025 County Health Rankings and includes variables related to exercise access, income, demographics, and health behaviors. This project serves as a visualization-focused companion to my full econometric paper, where I estimated the determinants of physical inactivity using multiple regression.

---

## 📁 File Structure  
(Images stored in `/projects/Tableau/physical-inactivity-analysis/Plots/`)

```
projects/
└── Tableau/
    └── physical-inactivity-analysis/
        ├── README.md
        └── Plots/
            ├── Access Exercise vs Physical Inactivity.png
            ├── Median Household Income vs Physical Inactivity.png
            ├── Physical Inactivity by County Tennessee Map.png
```

---

## 📊 Key Visualizations

---

### **1. Access to Exercise vs Physical Inactivity (Tennessee Counties)**  
Counties with greater exercise access tend to have *slightly* lower inactivity, but the relationship is weak — consistent with the regression result showing no significant effect.

![Access to Exercise vs Physical Inactivity](Plots/Access%20Exercise%20vs%20Physical%20Inactivity.png)

---

### **2. Median Household Income vs Physical Inactivity**  
Higher-income counties have dramatically lower physical inactivity. This is the **strongest predictor** in the regression model.

![Median Household Income vs Physical Inactivity](Plots/Median%20Household%20Income%20vs%20Physical%20Inactivity.png)

---

### **3. Physical Inactivity by County (Choropleth Map)**  
A geographic view showing regional disparities in Tennessee.  
• Lowest inactivity: **Williamson County (17.1 percent)**  
• Highest inactivity: **Hancock County (37.2 percent)**

![Physical Inactivity by County](Plots/Physical%20Inactivity%20by%20County%20Tennessee%20Map.png)

---

## 📘 Summary of Findings

This Tableau dashboard accompanies my ECON 381 econometric analysis, which used county-level data to estimate:

$begin:math:display$
PhysicalInactivity\_i \= \\beta\_0 \+ \\beta\_1 AccessExercise\_i \+ \\beta\_2 Income\_i \+ \\beta\_3 Education\_i \+ \\beta\_4 Unemployment\_i \+ \\beta\_5 Age\_i \+ \\beta\_6 Population\_i \+ \\varepsilon\_i
$end:math:display$

### **Key Results (from Stata regression):**
- **Access to Exercise:** *Not statistically significant*  
- **Median Household Income:** *Strongest negative predictor* of inactivity  
- **Education & Unemployment:** Both meaningful socioeconomic correlates  
- **Population size:** Larger counties show slightly lower inactivity  
- **Age 65+:** Surprisingly slightly negative relationship with inactivity  

### **Interpretation**
The evidence suggests that while exercise infrastructure is important, **socioeconomic conditions overwhelmingly drive health behavior**. Income, education, employment, and demographic context explain inactivity better than access alone.

---

## 🎓 Academic Context  

This project was completed for **ECON 381 (Applied Econometrics)** as part of my **Economics Collateral** in the Business Analytics program at the University of Tennessee, Knoxville.

All regression modeling, Stata code, and econometric interpretation are my own. Tableau was used exclusively to visualize key relationships uncovered in the analysis.

---

## 🤖 AI Use Statement  
Portions of this README were supported by ChatGPT for formatting and clarity. All statistical analysis, Stata work, modeling decisions, and interpretations were completed independently.
