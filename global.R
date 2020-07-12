library(dplyr)
library(htmlwidgets)
library(leaflet)
library(sf)
library(htmltools)


com<-readRDS("com.rda")
ept<-readRDS("ept.rda")
var1<-readRDS("chom1564.rda")
var2<-readRDS("chom1524.rda")
var3<-readRDS("chom5564.rda")
var4<-readRDS("CS2.rda")
var5<-readRDS("CS3.rda")
var6<-readRDS("CS4.rda")
var7<-readRDS("CS5.rda")
var8<-readRDS("CS6.rda")
var9<-readRDS("MOB0.rda")
var10<-readRDS("MOB1.rda")
var11<-readRDS("MOB2.rda")
var12<-readRDS("MOB3.rda")
var13<-readRDS("MOB4.rda")

listvar<-list(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12,var13)


meta1<-readRDS("chom1564_meta.rda")
meta2<-readRDS("chom1524_meta.rda")
meta3<-readRDS("chom5564_meta.rda")
meta4<-readRDS("CS2_meta.rda")
meta5<-readRDS("CS3_meta.rda")
meta6<-readRDS("CS4_meta.rda")
meta7<-readRDS("CS5_meta.rda")
meta8<-readRDS("CS6_meta.rda")
meta9<-readRDS("MOB0_meta.rda")
meta10<-readRDS("MOB1_meta.rda")
meta11<-readRDS("MOB2_meta.rda")
meta12<-readRDS("MOB3_meta.rda")
meta13<-readRDS("MOB4_meta.rda")
listmeta<-list(meta1,meta2,meta3,meta4,meta5,meta6,meta7,meta8,meta9,meta10,meta11,meta12,meta13)



