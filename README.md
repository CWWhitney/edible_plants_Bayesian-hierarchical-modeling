# edible_plants_Bayesian-hierarchical-modeling

## Overview

Estimate the proportion and total number of edible vascular plant species using Bayesian hierarchical modeling.

## Method

1. **Simulate Data**: Generate species data with edibility factors.
2. **Fit Model**: Use `brms` for Bayesian logistic regression.
3. **Posterior Inference**: Estimate the percentage and number of edible plants.
4. **Model Validation**: Run predictive checks to assess model fit.

## Usage

1. Install required packages:
   ```r
   install.packages(c("tidyverse", "brms", "bayesplot", "HDInterval", "bookdown"))
   ```
2. Run `Index.Rmd` to execute the analysis.
3. Review output for estimated edible species and model diagnostics.

## Contact

Cory Whitney - cory.whitney@uni-bonn.de
