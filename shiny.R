# diamonds dataset in ggplot2
library(ggplot2)
library(shiny)

#### data tables demo ####

ui <- fluidPage(
  title = "Example of DataTable",
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.dataset === "diamonds"',
        checkboxGroupInput("show_vars", "Columns in diamonds to show:",
                           names(diamonds), selected = names(diamonds))
      )
    ),
    mainPanel = 
      tabsetPanel(
        id = "dataset",
        tabPanel("diamonds", DT::dataTableOutput("mytable"))
      )
  )
)

server <- function(input, output) {
  #choose columns to display
  diamonds2 = diamonds[sample(nrow(diamonds), 1000),]
  output$mytable <- DT :: renderDataTable({
    DT :: datatable(diamonds2[, input$show_vars, drop=FALSE])
  })
}

shinyApp(ui, server)


