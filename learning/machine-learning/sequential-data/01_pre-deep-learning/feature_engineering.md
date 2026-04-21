---
title: Feature Engineering for Sequential Data Before Deep Learning
slug: feature_engineering
filename: feature_engineering.md
path: /machine-learning/sequential-data/01_pre-deep-learning/
tags:
  - machine-learning
  - sequential-data
  - feature-engineering
  - time-series
  - signal-processing
keywords:
  - sequential data
  - feature engineering
  - time series
  - lag features
  - rolling statistics
  - autoregressive modeling
  - hidden markov models
  - signal features
  - manual representation learning
summary: Before deep learning became dominant, sequential data problems were usually solved by converting sequences into carefully designed features. This note explains the main ideas, common feature families, and practical tradeoffs of feature engineering for time-dependent data.
status: evergreen
related:
  - /machine-learning/sequential-data/01_pre-deep-learning/sequence_modeling_before_neural_networks.md
  - /machine-learning/sequential-data/01_pre-deep-learning/hidden_markov_models.md
  - /machine-learning/sequential-data/01_pre-deep-learning/dynamic_time_warping.md
  - /machine-learning/sequential-data/02_classical_models/autoregressive_models.md
  - /machine-learning/sequential-data/03_deep-learning/representation_learning_for_sequences.md
assets:
  - /machine-learning/sequential-data/assets/feature-engineering-pipeline.png
---

# Feature Engineering for Sequential Data Before Deep Learning

## Summary

Before neural networks learned representations directly from raw sequences, practitioners usually had to design those representations by hand. The central task was not only choosing a model, but deciding how to turn a variable-length, temporally ordered signal into fixed, informative features that classical algorithms could use.

This approach shaped much of early work in time series analysis, speech processing, finance, industrial monitoring, and sensor-based classification. In many domains, the quality of the handcrafted features mattered more than the choice of downstream model.

## Why sequential data was hard

Sequential data is different from ordinary tabular data because order matters. A sequence contains dependencies across time, local patterns, recurring motifs, trends, seasonality, bursts, and irregular intervals. Two sequences may contain the same values in different orders and mean very different things.

Classical machine learning methods such as logistic regression, support vector machines, decision trees, and linear models usually expected fixed-length feature vectors. That created a practical problem:

- real-world sequences often have different lengths
- important information may appear at different positions
- local changes may matter more than global averages
- long-range dependencies are difficult to summarize compactly

Feature engineering was the bridge between raw sequential structure and models that could not directly consume sequences.

## Core idea

The pre-deep-learning workflow was usually:

1. collect a sequence
2. clean and normalize it
3. transform it into a set of handcrafted features
4. train a classical model on those features
5. evaluate whether the chosen representation captured the relevant dynamics

In effect, feature engineering was a form of manual representation learning.

## Common feature families

### 1. Lag features

A simple but powerful idea is to use earlier values as predictors for later outcomes.

Examples:

- value at time `t-1`
- value at time `t-2`
- difference between `t` and `t-1`
- percent change over the last `k` steps

These features were especially common in forecasting and autoregressive models.

Example:

```text
x_t = current observation
features = [x_(t-1), x_(t-2), x_(t-3), x_(t-7)]
```