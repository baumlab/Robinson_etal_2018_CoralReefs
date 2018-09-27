

## R script for estimating autocovariates for each model
library(spdep)


pred<-read.csv(file='data/CREP_predictor_df.csv')

## Reef builder ratio
##Autologistic model - all dat
dist<-SpatialPoints(cbind(pred$lat, pred$lon))
av1<-autocov_dist(pred$log10ratiopq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/log10ratiopq_autocovariate_alldat.csv', row.names=F)

##Autologistic model - pop dat
pop<-pred[pred$STATE=='Inhabited',]
dist<-SpatialPoints(cbind(pop$lat, pop$lon))
av1<-autocov_dist(pop$log10ratiopq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/log10ratiopq_autocovariate_pop.csv', row.names=F)

##Autologistic model - nopop dat
nopop<-pred[pred$STATE=='Uninhabited',]
dist<-SpatialPoints(cbind(nopop$lat, nopop$lon))
av1<-autocov_dist(nopop$log10ratiopq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/log10ratiopq_autocovariate_nopop.csv', row.names=F)

## Calcifiers only
##Autologistic model - all dat
dist<-SpatialPoints(cbind(pred$lat, pred$lon))
av1<-autocov_dist(pred$reefbuilderpq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/reefbuilderpq_autocovariate_alldat.csv', row.names=F)

##Autologistic model - pop dat
pop<-pred[pred$STATE=='Inhabited',]
dist<-SpatialPoints(cbind(pop$lat, pop$lon))
av1<-autocov_dist(pop$reefbuilderpq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/reefbuilderpq_autocovariate_pop.csv', row.names=F)

##Autologistic model - nopop dat
nopop<-pred[pred$STATE=='Uninhabited',]
dist<-SpatialPoints(cbind(nopop$lat, nopop$lon))
av1<-autocov_dist(nopop$reefbuilderpq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/reefbuilderpq_autocovariate_nopop.csv', row.names=F)


## Algal only
##Autologistic model - all dat
dist<-SpatialPoints(cbind(pred$lat, pred$lon))
av1<-autocov_dist(pred$fleshypq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/fleshypq_autocovariate_alldat.csv', row.names=F)

##Autologistic model - pop dat
pop<-pred[pred$STATE=='Inhabited',]
dist<-SpatialPoints(cbind(pop$lat, pop$lon))
av1<-autocov_dist(pop$fleshypq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/fleshypq_autocovariate_pop.csv', row.names=F)

##Autologistic model - nopop dat
nopop<-pred[pred$STATE=='Uninhabited',]
dist<-SpatialPoints(cbind(nopop$lat, nopop$lon))
av1<-autocov_dist(nopop$fleshypq, dist, nbs=14, type='inverse')
write.csv(av1, 'data/fleshypq_autocovariate_nopop.csv', row.names=F)
