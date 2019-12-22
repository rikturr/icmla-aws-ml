library(shiny)
library(tidyverse)
library(aws.s3)

# ************************************************************
# ********************* GET DATA *****************************
# ************************************************************
# for app to work on shinyapps.io, need to create a .Renviron file with AWS credentials
#
# it's best to make a new user with read-only access to your s3,
# rather than your normal root user (which has access to everything!)
#
# AWS_ACCESS_KEY_ID=<access key>
# AWS_SECRET_ACCESS_KEY=<secret key>
# AWS_DEFAULT_REGION=us-east-1
#
results <- get_object(bucket = 'rikturr-private', 
                      object = 'rf_trees/results.csv') %>% 
    read_csv

# ************************************************************
# *********************** UI *********************************
# ************************************************************

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Medicare ML Results"),

    sidebarLayout(
        sidebarPanel(
            sliderInput('x_limits',
                        'X-axis limits',
                        min = 1, 
                        max = 100,
                        value = c(1, 100)),
            selectInput('plot_y',
                        'Y',
                        choices = NULL),
        ),

        mainPanel(
            tabsetPanel(
                tabPanel(
                    'Plot',
                    plotOutput('results_plot')
                ),
                tabPanel(
                    'Table',
                    tableOutput('results_table')
                )
            )
        )
    )
)


# ************************************************************
# *********************** SERVER *****************************
# ************************************************************

server <- function(input, output, session) {

    output$results_plot <- renderPlot({
        filtered <- results %>% 
            filter(ntrees >= input$x_limits[1]) %>% 
            filter(ntrees <= input$x_limits[2])
        
        ggplot(filtered, aes_string(x = 'ntrees', y = input$plot_y)) +
            geom_point() +
            stat_summary(fun.y = 'mean', geom = 'line', linetype = 'dotted') +
            theme_light()
    })
    
    output$results_table <- renderTable({
        filtered <- results %>% 
            filter(ntrees >= input$x_limits[1]) %>% 
            filter(ntrees <= input$x_limits[2])
        
        filtered %>% 
            group_by(ntrees) %>% 
            summarise_at(vars(input$plot_y), funs(sum))
    })
    
    observe({
        updateSelectInput(session,
                          'plot_y',
                          choices = colnames(results),
                          selected = 'test_accuracy')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
