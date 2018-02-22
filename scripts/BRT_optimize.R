#!/bin/env Rscript

library(dismo);library(gbm)
set.seed(42)

### Script for optimising boosted regression trees

## Load response and predictor data
av.ratio<-read.csv('data/log10ratiopq_autocovariate_alldat.csv')
av.rb<-read.csv('data/reefbuilderpq_autocovariate_alldat.csv')
av.fl<-read.csv('data/fleshypq_autocovariate_alldat.csv')

pred<-read.csv(file='data/CREP_predictor_df.csv')
pred$av.ratio<-av.ratio$x
pred$av.rb<-av.rb$x
pred$av.fl<-av.fl$x

## want model with lowest cross-validation deviance (CVD): Richards et al. 2012
#--------------------#--------------------#--------------------
#-------------------- Function for BRT ---------------------------#
#--------------------#--------------------#--------------------

brt.optim<-function(data, resp.var, file.path, fam='gaussian'){

# setting parameter values
tree<-c(1,2,3,4,5)
lr<-c(0.01, 0.001, 0.0001)
bf<-c(0.25, 0.50, 0.75)


trainer<-data.frame(expand.grid(tree=tree, lr=lr, bf=bf))
trainer$mean.dev<-999
trainer$se.dev<-999

for(i in 1:dim(trainer)[1]){
	try({
		mod<-gbm.step(data=pred, gbm.x=exp.names, gbm.y=resp.var, family=fam,
						tree.complexity=trainer$tree[i], learning.rate=trainer$lr[i], bag.fraction=trainer$bf[i])})

			if(!is.null(mod))	{

			trainer$mean.dev[i]<-mod$cv.statistics$deviance.mean
			trainer$se.dev[i]<-mod$cv.statistics$deviance.se

			} else {trainer$mean.dev[i]<-NA; trainer$se.dev[i]<-NA}

	}

	tops<-trainer[which.min(trainer$mean.dev), ]

	psi<-gbm.step(data=pred, gbm.x=exp.names, gbm.y=resp.var, family=fam,
							tree.complexity=tops[1], learning.rate=tops[2], bag.fraction=tops[3], plot.main=FALSE)

## save full model and deviance estimates
save(tops,trainer, psi,file=paste(file.path,resp.var, '_brt_PQ_AC', '.Rdata', sep=''))
	
	}

#------------------#------------------#------------------#------------------
	#------------------#### reef builder ratio ######------------------#------------------
#------------------#------------------#------------------#------------------
ind.names<-c('log10ratiopq', 'reefbuilderpq', 'fleshypq',
				'total_herb', 'cropper', 'scraper.excavator', 'browser', 
				'min_SST','prod', 'wave', 'depth', 'arag', 'av.ratio')
exp.names<-ind.names[!ind.names%in%c('log10ratiopq', 'reefbuilderpq', 'fleshypq')]
brt.optim(pred, resp.var='log10ratiopq', file.path='results/' )


ind.names<-c('log10ratiopq', 'reefbuilderpq', 'fleshypq',
				'total_herb', 'cropper', 'scraper.excavator', 'browser', 
				'min_SST','prod', 'wave', 'depth', 'arag', 'av.rb')
exp.names<-ind.names[!ind.names%in%c('log10ratiopq', 'reefbuilderpq', 'fleshypq')]
brt.optim(pred, resp.var='reefbuilderpq',fam='poisson', file.path='results/' )

ind.names<-c('log10ratiopq', 'reefbuilderpq', 'fleshypq',
				'total_herb', 'cropper', 'scraper.excavator', 'browser', 
				'min_SST','prod', 'wave', 'depth', 'arag', 'av.fl')
exp.names<-ind.names[!ind.names%in%c('log10ratiopq', 'reefbuilderpq', 'fleshypq')]
brt.optim(pred, resp.var='fleshypq', fam='poisson', file.path='results/' )


