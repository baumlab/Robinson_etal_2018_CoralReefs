

****

Data, R code, and analysis supplement to:

Title: **Environmental conditions and herbivore biomass determine coral reef benthic community composition: implications for quantitative baselines.**

Authors: James P.W. Robinson, Ivor D. Williams, Lauren A. Yeager,
Jana M. McPherson, Jeanette Clark, Thomas A. Oliver,
Julia K. Baum

Accepted in Coral Reefs, September 2018.

****

The following R packages were used to analyse data:

```
install.packages(c("brt", "gbm", "spdep"))
```
****

**[data/CREP_predictor_df.csv](data/CREP_predictor_df.csv )** are the response and predictor covariates for all results

**[scripts/autocovariates.R](scripts/autocovariates.R)** estimates autocovariates to reduce spatial autocorrelation

**[scripts/BRT_optimize.R](scripts/BRT_optimize.R)** fits and optimises BRTs for the full dataset

**[scripts/BRT_optimize_decoupled.R](scripts/BRT_optimize_decoupled.R)** fits and optimizes BRTs for uninhabited and inhabited island datasets (decoupling analysis)

*Be aware that BRT optimization functions are essentially loops of boosted models. These can be computationally intensive and will eat your computer if you aren't careful. Please refer to [Elith and Leathwick (2017)](https://cran.r-project.org/web/packages/dismo/vignettes/brt.pdf) for details on BRT approaches used here.*

****

In the **[results](results/)** folder, Rdata files contain optimum BRTs for each analysis. File names indicate the response variable and fitted dataset:

* Response variable
  * log10ratiopq = reef-builder index
  * reefbuilderpq = calcifier cover
  * fleshypq = fleshy algal cover
* Dataset
  * pop = inhabited islands
  * nopop = uninhabited islands
  
****

In the **[data/](data/)** folder,  [CREP_predictor_df.csv](data/CREP_predictor_df.csv) contains all response and explanatory covariates analyzed. Autocovariate csvs contain all estimate autocovariates fitted in BRTs. Predictor dataframe column names are:

* ```site.id``` = site name by island (letters) and site (numbers)
* ```lat = latitude```
* ```lon = longitude```
* ```source``` = dataset
* ```unique```.site = unique survey in space and time
* ```ISLAND``` = island 
* ```STATE =``` uninhabited or inhabited island
* ```COUNTRY``` = island archipelago
* ```min_SST``` = minimum SST (celsius)
* ```prod =``` net primary productivity (mg C m-2 day-1)
* ```complexity``` = structural complexity
* ```IslType``` = island type (atoll, low or high island)
* ```wave =``` wave energy (KWhr m-1)
* ```arag =``` aragonite saturation state
* ```depth =``` site depth (metres)
* ```cropper``` = cropper biomass (kg/ha)
* ```browser``` = browser biomass (kg/ha)
* ```scraper```.excavator = scraper and excavator biomass (kg/ha)
* ```total_herb``` = total herbivore biomass (kg/ha)
* ```ratiopq``` = untransformed reef-builder index
* ```fleshypq``` = fleshy algal cover (proportion of 1)
* ```reefbuilderpq``` = reef-builder cover (proportion of 1)
* ```log10ratiopq``` = log10 reef-builder index (main response variable)



