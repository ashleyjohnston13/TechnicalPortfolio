# System Architecture Overview

This document describes the structure, logic, and workflow of the Movie Recommendation Shiny App.

---

## 1. Purpose

The app demonstrates how market basket analysis and association rules can generate 
personalized movie recommendations based on user inputs. It was built as the final project 
for BAS 479 (Business Analytics Capstone) at the University of Tennessee, Knoxville.

---

## 2. High-Level Workflow

1. **User selects one or more movies**
   The app dynamically updates input options using `selectizeInput()`.

2. **Data is filtered**
   The system identifies transactions (movie sets) that contain the selected movies.

3. **Association Rules Applied**
   Using the `arules` package:
   - Frequent itemsets are extracted.
   - Rules with high lift and confidence are prioritized.
   - Recommendations are generated based on movies that commonly appear together.

4. **Recommendations Displayed**
   Results appear in a clean UI panel, showing:
   - Suggested movies
   - Rule confidence
   - Rule lift
   - Support

---

## 3. File Structure

- `app.R` – Full application logic and UI.
- `analysis/rules-exploration.R` – Testing and tuning of association rule thresholds.
- `analysis/preprocessing.R` – Any dataset preparation steps.
- `data/` – Placeholder folders for raw and processed data.
- `docs/screenshots/` – UI example images.
- `DESCRIPTION` – Metadata following R conventions.
- `requirements.txt` – R package dependencies.

---

## 4. Technical Stack

- **R Shiny** for UI + server logic  
- **arules** for association rule mining  
- **tidyverse** for wrangling and helpers  

---

## 5. Deployment

The application is deployed using **shinyapps.io**:  
https://ashleyjohnston.shinyapps.io/case9/

---

## 6. Future Enhancements

- Add genre filters  
- Allow upload of personal movie history  
- Build visualization of rule networks  
- Improve mobile UI responsiveness  
