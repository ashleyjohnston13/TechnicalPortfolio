# Physical Inactivity & Socioeconomic Drivers in Tennessee  
**ECON 381 — Applied Econometrics Project | Economics Collateral, Business Analytics B.S., University of Tennessee**

This project was completed as part of my *Economics collateral* within the Business Analytics program at UTK.  
It investigates the socioeconomic and environmental determinants of physical inactivity across Tennessee counties using:

- Regression modeling in **Stata**  
- Visual analytics in **Tableau**  
- Data from the **2025 County Health Rankings**

This dashboard complements my full econometric paper, where I estimated predictors of physical inactivity using multiple regression.

---

## File Structure  
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

## Key Visualizations

---

## **Access to Exercise vs Physical Inactivity**  
Counties with more exercise access tend to have slightly lower inactivity, but the relationship is weak.

![Access to Exercise](Plots/Access%20to%20Exercise%20vs%20Physical%20Inactivity%20(Tennessee%20Counties).png)

---

## **Median Household Income vs Physical Inactivity**  
Higher-income counties consistently have lower physical inactivity, showing a strong negative relationship.

![Income vs Inactivity](Plots/Median%20Household%20Income%20vs%20Physical%20Inactivity.png)

---

## **Physical Inactivity by County (Choropleth Map)**  
A geographic breakdown of physical inactivity across Tennessee.

- **Lowest:** Williamson County — *17.1%*  
- **Highest:** Hancock County — *37.2%*

![TN Map](Plots/Physical%20Inactivity%20by%20County,%20Tennessee.png)

---

## Summary of Findings  

Regression model estimated in Stata:

```text
PhysicalInactivity_i = β0 
    + β1 * AccessExercise_i 
    + β2 * Income_i 
    + β3 * Education_i 
    + β4 * Unemployment_i 
    + β5 * Age65Plus_i 
    + β6 * Population_i 
    + ε_i
```

### Key Results  
- **Access to Exercise:** Not statistically significant  
- **Income:** Strongest negative predictor of inactivity  
- **Education:** Higher education correlates with lower inactivity  
- **Unemployment:** Positive association with inactivity  
- **Population:** Slightly negative relationship  
- **Age 65+:** Mild negative effect  

# Interpretation  

Socioeconomic factors — especially income and education — drive the majority of variation in physical inactivity across Tennessee counties.  
Access to exercise facilities, while intuitively important, does **not** show a statistically significant effect once controlling for income and regional demographics.

This suggests that addressing **structural economic inequalities** may be more effective than focusing solely on physical infrastructure.

---

# Data Availability  

**Important:**  
The dataset used in this project comes from restricted ECON 381 course materials and the 2025 County Health Rankings.  
Because it is educational and proprietary, **the raw data cannot be published online**.

This README provides all allowable outputs: findings, code structure, and visualizations.
