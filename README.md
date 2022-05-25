# Source Codes of SA-Based Quantile Optimization

This repository contains the source codes used in the following paper:

* A Stochastic Approximation Method for Simulation-Based Quantile Optimization, Jiaqiao Hu, Yijie Peng<sup>*</sup>, Gongbo Zhang, Qi Zhang (2022) Accepted in *INFORMS Journal on Computing*.

### Disclaimer

LICENSE: Redistribution and use in source and binary forms, with or without modification, are permitted, under the terms of the [BSD license](./BSD_License.txt).

WARNING: These codes are written only for the purpose of demonstration and verification. While the correctness has been carefully checked, the quality such as standardability, clarity, generality, and efficiency has not been well considered.

## 1 Introduction

The `\quantile_codes` folder contains the MATLAB implementations of the numerical experiments in Hu et al. (2022).

* `\quantile_codes\5.1`, contains codes for numerical experiments in Hu et al. (2022, §5.1).
The function `\quantile_codes\5.1\QG.m` is a compared policy from Kibzun and Matveev (2012).
The function `\quantile_codes\5.1\signum.m` is a compared policy from Kim and Powell (2011).
* `\quantile_codes\5.2`, contains codes for numerical experiments in Hu et al. (2022, §5.2).
The function `\quantile_codes\5.2\QG.m` is a compared policy from Kibzun and Matveev (2012).
The function `\quantile_codes\5.2\signum.m` is a compared policy from Kim and Powell (2012).
* `\quantile_codes\5.3`, contains codes for numerical experiments in Hu et al. (2022, §5.3).
The function `\quantile_codes\5.3\QG.m` is a compared policy from Kibzun and Matveev (2012).
The function `\quantile_codes\5.3\quad2.m` is a function to solve quadratic programming.
* `\quantile_codes\5.4`, contains codes for numerical experiments in Hu et al. (2022, §5.4).
The function `\quantile_codes\5.4\QG3.m` is a compared policy from Kibzun and Matveev (2012).
The function `\quantile_codes\5.4\BIC1.m` is a function to solve Bayesian information criterion (BIC) value of the diffusion model for the real data experiment in HU et al. (2022, Appendix H.2).
The function `\quantile_codes\5.4\BIC2.m` is a function to solve Bayesian information criterion (BIC) value of the jump-diffusion model for the real data experiment in HU et al. (2022, Appendix H.2).

## 2 Installation

The codes were written and run in MATLAB R2021a, on Windows 10 Home 64-bit OS,
with Intel i5-11300H CPU @ 3.10 GHz, 16 GB RAM.

To install the MATLAB codes, just copy the entire folder `\quantile_codes` into your MATLAB directory, or change the path of MATLAB to the folder `\quantile_codes`

## 3 Details on Numerical Experiments

### 3.1 Numerical Experiments in Hu et al. (2022, §5.1)

Get into folder `\5.1`. Run `SA2.m` for *SQO* in Hu et al. (2022, §5.1.1). Run `SA3.m` for *SQO* in the numerical experiments in Hu et al. (2022, §5.1.2).

* Set corresponding parameters for all policies in folder `\5.1`.
* The compared policies *QG* is implemented by `QG.m`, and *SG* is implemented by`\signum.m`.

### 3.2 Numerical Experiments in Hu et al. (2022, §5.2)

Get into folder `\5.2`. Run `SA3.m` for *SQO* in Hu et al. (2022, §5.2).

* Set corresponding parameters for all policies in folder `\5.2`.
* The compared policies *QG* is implemented by `QG.m`, and *SG* is implemented by`\signum.m`.

### 3.3 Numerical Experiments in Hu et al. (2021, §5.3)

Get into folder `\5.3`. Run `SASA11.m` for *SQO* in Hu et al. (2022, §5.3).

* Run `quad2.m` for optimal value of the quadratic programming in Hu et al. (2022, §5.3).
* Set corresponding parameters and choose different gradient estimators for all policies in folder `\5.3`.
* The compared policy *QG* is implemented by `QG.m`.

### 3.4 Numerical Experiments in Hu et al. (2021, §5.4)

Get into folder `\5.4`. Run `SASA33.m` for *SQO* in Hu et al. (2022, §5.3). Run `SASA.m` for *SQO* in the real data experiment in HU et al. (2022, Appendix H.2).

* Set corresponding parameters and choose different gradient estimators for all policies in folder `\5.4`.
* The compared policies, *QG* is implemented by `QG3.m`.
* Run `BIC1.m` for Bayesian information criterion (BIC) value of the diffusion model for the real data experiment in HU et al. (2022, Appendix H.2). Run `BIC2.m` for Bayesian information criterion (BIC) value of the jump-diffusion model for the real data experiment in HU et al. (2022, Appendix H.2).
* See two datasets `^HSI.csv` and `^GSPC.csv` for the real data experiment in HU et al. (2022, Appendix H.2).

## References

* Kibzun AI, Matveev E (2012) Optimization of the quantile criterion for the convex loss function by a stochastic quasi-gradient algorithm. Annals of Operations Research 200(1):183–198.
* Kim JH, Powell WB (2011) Quantile optimization for heavy-tailed distributions using asymmetric signum functions. working paper <https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.299.9913&rep=rep1&type=pdf>.
