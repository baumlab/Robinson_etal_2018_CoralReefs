# pacific-reefs-benthos
R code accompanying Robinson et al. Environmental
conditions and herbivore biomass determine coral reef benthic community
composition: implications for quantitative baselines.

Authors: James P.W. Robinson, Ivor D. Williams, Lauren A. Yeager,
Jana M. McPherson, Jeanette Clark, Thomas A. Oliver,
Julia K. Baum


In revision at Coral Reefs, August 2018.

*data/*

CREP_predictor_df.csv = response and predictor covariates for all results

*scripts/*

autocovariates.R = estimation of autocovariates to reduce spatial autocorrelation

BRT_optimize.R = fit and optimise BRTs for full dataset

BRT_optimize_decoupled.R = fit and optimize BRTs for uninhabited and inhabited island datasets

*results/*

Rdata files holding optimum BRTs for each analysis. File names indicate fitted dataframes:

Response variable: log10ratiopq = reef-builder index; reefbuilderpq = calcifier cover; fleshypq = fleshy algal cover

Dataset: pop = inhabited islands; nopop = uninhabited islands
