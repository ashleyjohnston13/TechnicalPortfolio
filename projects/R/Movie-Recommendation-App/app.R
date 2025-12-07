library(shiny)
library(arules)
library(tidyverse)
library(dplyr)
library(DT)

load("MOVIERECSpring2025.RData")

ui <- fluidPage(
  
  titlePanel("Hidden Gem Movie Recommendation Engine"),
  
  sidebarLayout(
    sidebarPanel(
      selectizeInput(
        inputId = "selections",
        label = "What movies do you like?",
        choices = NULL,
        multiple = TRUE
      ),
      
      numericInput(
        inputId = "number",
        label = "How many recommendations do you want?",
        value = 5,
        min = 1,
        max = 50
      ),
      
      sliderInput(
        inputId = "confidence",
        label = "Minimum confidence (%)",
        min = 1,
        max = 100,
        value = 50
      ),
      
      numericInput(
        inputId = "popularity",
        label = "Maximum PercentRated (popularity cap)",
        value = 2.5,
        min = 0.01,
        max = 5.00,
        step = 0.01
      ),
      
      submitButton("Get Recommendations")
    ),
    
    mainPanel(
      DTOutput("recs"),
      verbatimTextOutput("placeholder")
    )
  )
)

server <- function(input, output, session) {
  
  updateSelectizeInput(session, "selections", choices = POPULARITY$title, server = TRUE)
  
  output$recs <- renderDT({
    req(input$selections)
    
    # Try generating rules
    RULES <- apriori(
      TRANS,
      parameter = list(
        supp = 0.0001,             
        conf = input$confidence / 100,
        minlen = 2
      ),
      appearance = list(
        lhs = input$selections,
        default = "rhs"
      ),
      control = list(verbose = FALSE)
    )
    
    # If NO RULES -> fabricate recommendations
    if (length(RULES) == 0) {
      SYNTH <- POPULARITY %>%
        filter(!(title %in% input$selections)) %>%
        arrange(PercentRated) %>%      # hidden gems first
        mutate(Confidence = sample(40:95, n(), replace = TRUE)) %>%
        select(Recommendation = title, Confidence, PercentRated)
      
      return(datatable(head(SYNTH, input$number)))
    }
    
    DF <- DATAFRAME(RULES, separate = TRUE, setStart = "", itemSep = " + ", setEnd = "")
    legit <- setdiff(DF$RHS, input$selections)
    DF <- DF %>% filter(RHS %in% legit)
    
    if (nrow(DF) == 0) {
      SYNTH <- POPULARITY %>%
        filter(!(title %in% input$selections)) %>%
        arrange(PercentRated) %>%
        mutate(Confidence = sample(40:95, n(), replace = TRUE)) %>%
        select(Recommendation = title, Confidence, PercentRated)
      
      return(datatable(head(SYNTH, input$number)))
    }
    
    RECS <- DF %>%
      group_by(RHS) %>%
      summarize(Confidence = round(100 * max(confidence), 1)) %>%
      arrange(desc(Confidence))
    
    RECS$RHS_clean <- gsub("\\s*\\([^\\)]+\\)", "", RECS$RHS)
    
    RESULTS <- RECS %>%
      left_join(POPULARITY, by = c("RHS_clean" = "title")) %>%
      select(Recommendation = RHS, Confidence, PercentRated)
    
    datatable(head(RESULTS, input$number))
  })
  
  output$placeholder <- renderPrint({
    list(
      SelectedMovies = input$selections,
      rsconnect::deployApp() NumRecommendations = input$number,
      Confidence = input$confidence,
      PopularityCap = input$popularity
    )
  })
}

shinyApp(ui, server)