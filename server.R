library(shiny)



function(input, output, session) {
  

##  ------------------------

  
output$carte <- renderLeaflet({
  names(map)<-c("ept","com","iris","V","P","geometry")
  mymap<-  leaflet() %>%
    addTiles() %>%
    addProviderTiles(providers$Stamen.TonerLite) %>%
    #    addProviderTiles(providers$Stamen.Toner) %>%
    setView(lng=2.426523, lat=48.765743 , zoom=11)%>%
    
    addPolygons(data = map, fillColor = "blue",
                color = 'grey', weight = 0.4, fillOpacity = 0.6, 
                highlightOptions = highlightOptions(weight = 2, color = 'black'))%>%
  addPolygons(data =com, fill= FALSE, color = 'black',weight =2) %>%
    addPolygons(data =ept, fill= FALSE, color = 'red',weight =3)
  
  
})
  
output$carte2 <- renderLeaflet({
  #  mymeta<-listmeta[[input$var]]
   x<-as.integer(input$myvar)
   mymeta<-listmeta[[x]]
    minP<-mymeta$minP
    coefZ <-mymeta$coefZ
    nameV<-mymeta$nameV
    nameP<-mymeta$nameP
    nameZ<-mymeta$nameZ
    
#    map<-listvar[[input$var]]
    map<- listvar[[x]]
    map<-st_as_sf(map)
    map<-map[map$P>minP,]
    map$Z<-round(coefZ*map$V/map$P,1)
    
    # Choose Threshold
    
    mycut<-quantile(map$Z, c(0,1/6, 2/6, 3/6,4/6,5/6,1 ))
    
    mycut<-round(mycut,1)
    bin_pal = colorBin('Spectral', 
                       map$Z,
                       bins=mycut,
                       reverse=T)
    
    
    # Define labels
    labs <- lapply(seq(nrow(map)), function(i) {
      paste0( paste("EPT :",map$ept[i]), '<p></p>',
              paste("Commune :",map$com[i]), '<p></p>',
              paste("Iris : " ,map$iris[i]), '<p></p>', 
              paste(nameV," :  ", map$V[i]), '<p></p>',
              paste(nameP," : ", map$P[i]),'<p></p>',
              paste(nameZ," : ", map$Z[i]),'<p></p>'
      ) 
    })
    labs<-lapply(labs, htmltools::HTML)
    
    
    mymap<-  leaflet() %>%
      addTiles() %>%
      addProviderTiles(providers$Stamen.TonerLite) %>%
      #    addProviderTiles(providers$Stamen.Toner) %>%
      setView(lng=2.426523, lat=48.765743 , zoom=11)%>%
      
      #  addPolygons(data=mapdon, weight=2, col=c("red"), opacity=0.25, label = iris$NOM_IRIS)
      
      addPolygons(data = map, fillColor = ~bin_pal(Z),
                  color = 'grey', weight = 0.4, fillOpacity = 0.6, 
                  highlightOptions = highlightOptions(weight = 2, color = 'black'),
                  label = labs)%>%
      #    
      addLegend(data = map, pal = bin_pal, title = mymeta$nameZ,
                values = ~Z, position = 'bottomleft')%>%
      
      
      
      #
      addPolygons(data =com, fill= FALSE, color = 'black',weight =2) %>%
      addPolygons(data =ept, fill= FALSE, color = 'red',weight =3)
    
    if (input$cercle) {   mymap <- mymap %>% addCircleMarkers(data=st_centroid(map$geometry, quiet =T),
                                                              radius = 8*sqrt(map$V/max(map$V)),
                                                              fillColor = "gray50",
                                                              stroke = FALSE, fillOpacity = 0.5)}  
    return(mymap)
    
})  
  
  
  

  
}

