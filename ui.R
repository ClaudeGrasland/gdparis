

hdv_remerciements <- list(
  tags$p("Cette interface est ..."),
  tags$p(""),
  tags$p(""))



css_string <- "
@import url(https://fonts.googleapis.com/css?family=Open+Sans);
@import url(https://fonts.googleapis.com/css?family=Roboto);
* {font-family: 'Roboto', 'Open Sans', 'Helvetica', sans-serif;}
body {padding-bottom: 6em;}
.container-fluid {max-width: 1170px;}
.nav-tabs {margin-bottom: 25px;}
table td {text-align: right;}
table tbody tr:hover {background-color: #F0F0F0;}
table.data td[align=right] {font-family: 'Roboto', 'Open Sans', 'Helvetica', sans-serif;}
h1 { margin-bottom: 1em; font-size: 2.2em;}
.form-inline .form-control {width: 7em !important;}
span.khid_tab, span.indep_tab {width: 7em; display:inline-block; text-align: right;}
span.sim1_tab {width: 4em; display:inline-block; text-align: right;}
.echantillon {
  background-color: #F0F0F0;
  padding: 1em;
  border-radius: 1em;
  width: 100%; height: 15em;
  overflow-y: scroll;
}
.echantillon-small {
  height: 11em;
}

"

show_alert <- function(texte) {
  column(12,
    tags$div(class="alert alert-info alert-dismissable",
      HTML('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'),
      HTML(texte)
    )
  )
} 




ui_pq <- fluidRow(
#    headerPanel(HTML("Carte")),
#   show_alert("Cette page permet de visualiser les données par quartier IRIS."),
    column(3,
           wellPanel(
              radioButtons("myvar","LES ACTIFS EN 2014-2018",
                          choices=c("Chômage : Total (15-64 ans)" = 1,
                                    "Chômage : Jeunes (15-24 ans)"= 2,
                                    "Chômage : Seniors (55-64 ans)" = 3,
                                    "CSP : Artis., Comm., chefs. entr." = 4,
                                    "CSP : Cadres et prof.int. sup." = 5,
                                    "CSP : Prof. intermédiaires" = 6,
                                    "CSP : Employés" = 7,
                                    "CSP : Ouvriers" = 8,
                                    "Mobilité : aucune" =9,
                                    "Mobilité : à pieds" = 10,
                                    "Mobilité : deux roues" = 11,
                                    "Mobilité : voiture" = 12,
                                    "Mobilité : transports en commun"=13),
                          selected=1),
 
               radioButtons("cercle","Visualiser les effectifs ?",
                            choices=c("Oui"=TRUE,"Non"=FALSE),
                            selected=FALSE),
           )),
    column(8,
           tabsetPanel(

               tabPanel("Map",leafletOutput("carte2")),
               tabPanel("Sources", 
                        hdv_remerciements)
               
               )

               
    )
    
)


navbarPage("Pour une démocratie de quatier - (c) C. Grasland - EELV 94 - 2020",
            header=tags$head(tags$style(HTML(css_string))),
            tabPanel("Carte", ui_pq)
)





