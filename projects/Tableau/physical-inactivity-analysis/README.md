# 🏃‍♀️ Physical Inactivity & Socioeconomic Drivers in Tennessee  
**ECON 381 — Applied Econometrics Project | Economics Collateral, Business Analytics B.S., University of Tennessee**

This project was completed as part of my *Economics collateral* within the Business Analytics program at UTK.  
It investigates the socioeconomic and environmental determinants of physical inactivity across Tennessee counties using:

- 📊 Regression modeling in **Stata**  
- 🎨 Visual analytics in **Tableau**  
- 🏛 Data from the **2025 County Health Rankings**

This dashboard complements my full econometric paper, where I estimated predictors of physical inactivity using multiple regression.

---

## 📁 File Structure  
*(Images stored in `/projects/Tableau/physical-inactivity-analysis/Plots/`)*

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

### 🏃‍♀️ 1. Access to Exercise vs Physical Inactivity  
Counties with more exercise access tend to have *slightly* lower inactivity, but the relationship is weak.

![Access to Exercise vs Physical Inactivity](Plots/Access%20Exercise%20vs%20Physical%20Inactivity.png)

---

### 💰 2. Median Household Income vs Physical Inactivity  
Income is the **strongest predictor** of inactivity. Higher-income counties consistently show lower inactivity rates.

![Median Household Income vs Physical Inactivity](Plots/Median%20Household%20Income%20vs%20Physical%20Inactivity.png)

---

### 🗺️ 3. Physical Inactivity by County (Choropleth Map)  
A geographic view of inactivity trends across Tennessee.

- 🌟 **Lowest:** Williamson County — *17.1 percent*  
- ⚠️ **Highest:** Hancock County — *37.2 percent*

![Physical Inactivity by County Tennessee Map](Plots/Physical%20Inactivity%20by%20County%20Tennessee%20Map.png)

---

## 📘 Summary of Findings  

Regression model estimated in Stata:

$begin:math:display$
PhysicalInactivity\_i \= \\beta\_0 \+ \\beta\_1 AccessExercise\_i 
\+ \\beta\_2 Income\_i \+ \\beta\_3 Education\_i \+ \\beta\_4 Unemployment\_i 
\+ \\beta\_5 Age\_i \+ \\beta\_6 Population\_i \+ \\varepsilon\_i
$end:math:display$

### 🔍 Key Results  
- **Access to Exercise:** Not statistically significant  
- **Income:** Strongest negative predictor of inactivity  
- **Education:** Higher education correlates with lower inactivity  
- **Unemployment:** Positive association with inactivity  
- **Population:** Slightly negative relationship  
- **Age 65+:** Mild negative effect  

### 🧩 Interpretation  
Socioeconomic conditions — not exercise access — drive the majority of health behavior differences across counties.  
Income, education, and employment explain far more variation in inactivity than infrastructure alone.

---

## 🎓 Academic Context  

This Tableau project accompanies my ECON 381 final regression paper. All data cleaning, Stata regression modeling, econometric interpretation, and conclusions were completed independently. Tableau was used solely for visualization.
