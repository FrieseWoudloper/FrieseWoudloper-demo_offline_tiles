library(shiny)
library(leaflet)

ui <- fluidPage(
    leafletOutput("mymap")
)

server <- function(input, output, session) {
    output$mymap <- renderLeaflet({
        leaflet() %>%
            addTiles(urlTemplate = "map/brtachtergrond/{z}/{x}/{y}.png",
                     attribution = "Kaartgegevens &copy; Kadaster",
                     options = tileOptions(minZoom = 11, maxZoom = 14)) %>%
            setView(5.7896822, 53.2029833, 11)
         
    })
}

shinyApp(ui, server)
