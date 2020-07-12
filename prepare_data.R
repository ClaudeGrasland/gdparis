library(dplyr)
library(htmlwidgets)
library(leaflet)
library(sf)
library(htmltools)
getwd()
setwd("/Users/claudegrasland1/Documents/mygit/gdparis")
#sel<-c("T10 Paris-Est-Marne et Bois","T11 Grand Paris Sud Est Avenir", "T12 Grand-Orly Seine Bièvre")

# com
com<-st_read("_data/maps/map_com.shp", quiet=T)
plot(com$geometry)
#plot(com$geometry)
#com_sel<-com[com$CODE_EPT %in% sel,]
#plot(com_sel$geometry)

# ept
ept <-com %>% group_by(CODE_EPT) %>% summarize()
plot(ept$geometry)

# iris
qua<-st_read("_data/maps/map_iris.shp", quiet=T)
plot(qua$geometry)



# data
don <- read.csv("_data/stats/base-ic-activite-residents-2016-idf.csv",sep=";", comment.char="#", stringsAsFactors = F)
selco<-names(table(as.character(qua$CODE_COM)))
don<-don[don$COM %in% selco,]

# merge
mapdon <- merge(qua,don, by.x="CODE_IRIS",by.y="IRIS")
mapdon <- st_transform(mapdon, 4326)
saveRDS(mapdon,"mapdon.rda")
com<-st_transform(com, 4326)
saveRDS(com,"com.rda")
ept<-st_transform(ept, 4326)
saveRDS(ept,"ept.rda")


# Create variables

don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","P16_CHOM1564","P16_ACT1564","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")

saveRDS(don,"chom1564.rda")
meta <-list( "nameV" = "Nombre de chômeurs de15-64 ans",
              "nameP" = "Nombre d'actifs de 15-64 ans" ,
              "nameZ" = "Taux de chômage des 15-64 ans en %",
              "minP"  = 10,
              "coefZ" = 100)
saveRDS(meta,"chom1564_meta.rda")

don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","P16_CHOM1524","P16_ACT1524","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"chom1524.rda")
meta <-list( "nameV" = "Nombre de chômeurs de 15-24 ans",
             "nameP" = "Nombre d'actifs de 15-24 ans" ,
             "nameZ" = "Taux de chômage des 15-24 ans en %",
             "minP"  = 5,
             "coefZ" = 100)
saveRDS(meta,"chom1524_meta.rda")

don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","P16_CHOM5564","P16_ACT5564","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"chom5564.rda")
meta <-list( "nameV" = "Nombre de chômeurs de 55-64 ans",
             "nameP" = "Nombre d'actifs de 55-64 ans" ,
             "nameZ" = "Taux de chômage des 55-64 ans en %",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"chom5564_meta.rda")


don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACT1564_CS2","C16_ACT1564","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"CS2.rda")
meta <-list( "nameV" = "Artis., Comm., Chefs d'entr.",
             "nameP" = "Actifs de 15-64 ans" ,
             "nameZ" = "% Artisans, commerçants et chefs d'entreprise",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"CS2_meta.rda")


don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACT1564_CS3","C16_ACT1564","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"CS3.rda")
meta <-list( "nameV" = "Cadres et prof. int. sup.",
             "nameP" = "Actifs de 15-64 ans" ,
             "nameZ" = "% Cadres et prof. int. sup.",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"CS3_meta.rda")

don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACT1564_CS4","C16_ACT1564","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"CS4.rda")
meta <-list( "nameV" = "prof. intermédiaires",
             "nameP" = "Actifs de 15-64 ans" ,
             "nameZ" = "% prof. intermédiaires",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"CS4_meta.rda")

don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACT1564_CS5","C16_ACT1564","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"CS5.rda")
meta <-list( "nameV" = "employés",
             "nameP" = "Actifs de 15-64 ans" ,
             "nameZ" = "% employés",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"CS5_meta.rda")

don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACT1564_CS6","C16_ACT1564","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"CS6.rda")
meta <-list( "nameV" = "ouvriers",
             "nameP" = "Actifs de 15-64 ans" ,
             "nameZ" = "% ouvriers",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"CS6_meta.rda")



don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACTOCC15P_PAS","C16_ACTOCC15P","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"MOB0.rda")
meta <-list( "nameV" = "Pas de moyen de tranport",
             "nameP" = "Actifs occupés + 15 ans" ,
             "nameZ" = "% pas de moyens de transport",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"MOB0_meta.rda")



don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACTOCC15P_MAR","C16_ACTOCC15P","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"MOB1.rda")
meta <-list( "nameV" = "Marche à pieds",
             "nameP" = "Actifs occupés + 15 ans" ,
             "nameZ" = "% Marche à pieds",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"MOB1_meta.rda")


don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACTOCC15P_DROU","C16_ACTOCC15P","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"MOB2.rda")
meta <-list( "nameV" = "Deux roues",
             "nameP" = "Actifs occupés + 15 ans" ,
             "nameZ" = "% Deux roues",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"MOB2_meta.rda")


don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACTOCC15P_VOIT","C16_ACTOCC15P","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"MOB3.rda")
meta <-list( "nameV" = "Voiture",
             "nameP" = "Actifs occupés + 15 ans" ,
             "nameZ" = "% Voiture",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"MOB3_meta.rda")

don <- mapdon[,c("CODE_EPT","NOM_COM","NOM_IRIS","C16_ACTOCC15P_TCOM","C16_ACTOCC15P","geometry")]
names(don)<-c("ept","com","iris","V","P","geometry")
saveRDS(don,"MOB4.rda")
meta <-list( "nameV" = "Transports en commun",
             "nameP" = "Actifs occupés + 15 ans" ,
             "nameZ" = "% Transports en commun",
             "minP"  = 10,
             "coefZ" = 100)
saveRDS(meta,"MOB4_meta.rda")

