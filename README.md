# Divorce Analysis - Machine Learning for Business

## Overview
This project focused on identifying key predictors of divorce using advanced machine learning techniques. By analyzing relationship dynamics and employing various analytical methods, the study aimed to provide valuable insights into factors influencing divorce, contributing to the field of predictive analytics in relationship dynamics.

## Key Features
* Analyzed predictors of divorce using visualizations, Variance Inflation Factor (VIF) analysis, and neural networks.
* Achieved a high predictive accuracy of 94.23% using neural networks based on specific attributes.
* Provided actionable insights into relationship dynamics and factors influencing divorce.

## Methodology
* **Data Source:** Divorce dataset from the University of California Irvine machine learning dataset repository.
* **Data Processing:** Conducted exploratory data analysis (EDA) and visualization to identify key patterns and relationships.
* **Modeling Techniques:** Utilized Python with libraries such as Pandas, NumPy, and scikit-learn.
    * Variance Inflation Factor (VIF): Used to identify and handle multicollinearity among predictor variables.
    * Neural Networks: Employed for classification, with a focus on achieving high accuracy.

## Key Findings
* **Predictors:**
    * VIF Analysis: Identified key attributes influencing divorce by addressing multicollinearity.
        * Questions covered various aspects of relationship dynamics such as communication, emotional distance, and conflict resolution.
* **Model Performance:**
    * Neural Networks:
        * First model based on 9 attributes from VIF analysis achieved an accuracy of 94.23%, effectively predicting divorce based on specific relationship dynamics.

## Lessons Learnt
* **Visualization:**
    * Effective for exploring and summarizing data, especially when data points can be grouped into distinct clusters.
    * Visualizations can reveal patterns, trends, and relationships that are not immediately apparent in raw data.
    * Less effective with sparse or overly complex data where patterns may not be clear.
* **Model Comparison:**
    * Neural networks outperformed other techniques, demonstrating the importance of handling multicollinearity and selecting significant predictors.
* **Alternative Techniques:**
    * Logistic regression and other classification methods could be explored for further analysis.

## Conclusion
The project highlighted the importance of understanding relationship dynamics through predictive analytics. By leveraging VIF analysis and neural networks, the study provided significant insights into the factors influencing divorce, with practical applications in counseling and relationship management.

## Reference
* Dataset: Divorce Predictors dataset from the University of California Irvine machine learning repository. Available at: https://dergipark.org.tr/en/pub/nevsosbilen/issue/46568/549416
