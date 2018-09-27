# Time-Series-Analysis
This repository contains codes regarding implementation of Time series implemented using MATLAB using the following methods:

1) **Gradient based Algorithm**
2) **Recursive Least Squares (RLS)**

**CASE 1 (Adaptive Prediction in the Ideal Case) :** To Compare  the  convergence  rates  and  stationary  of  the  RLS  and gradient algorithms for estimating the parameters when the input is persistently excited and the noise is stationary and white.  These conditions are referred to as “ideal” conditions. 

**CASE 2 (Adaptive prediction in the Non-Ideal Case):**   In this case, the **DOW Jones data** stored in the data file ”DOW data” is used.  The objective in this case is to develop an autanted investment strategy.  You have initially $1M to invest.  The algorithm is going to use past data to predict the DOW at closing.  The algorithm makes a decision whether to invest or not. At closing you cash in if you have invested and make a new prediction and decision whether to invest or not.The objective is to maximize the value of the portfolio.
