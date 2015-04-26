
# server.R
#

library(shiny)
library(tm)
library(hash)
library(grDevices)
library(dplyr)  
library(devtools)

#set working directory
#setwd('C:\\Users\\lisar\\Documents\\R\\Coursera-SwiftKey\\final\\en_US\\LHR_Pub')

#function sources
source("./clean_Functions.R", local = TRUE)
source("./transformation_Functions.R", local = TRUE)
source("./nGrams_Functions.R", local = TRUE)
source("./coding_Functions.R", local = TRUE)
source("./prediction_Functions.R", local = TRUE)

#load data
data = './data.RData';          
load(data, envir = environment())

#shiny app
shinyServer(function(input, output, session) {
        
        pred <- reactiveValues(words = NULL)
        
        observeEvent(input$predButton, {
                sent <- cleanSent(input$Sentence)
                pred$words <- nextWord(sent, maxwords = 5, heart = F)
        })
        
        observeEvent(input$autoButton, {
                sent <- paste(input$Sentence, pred$words[[1]][1], sep = ' ')
                updateTextInput(session, inputId = 'Sentence', value = sent)
                sent <- cleanSent(sent)
                pred$words <- nextWord(sent, maxwords = 5, heart = F)
        })
        
        observeEvent(input$clearButton, {
                updateTextInput(session, inputId = 'Sentence', value = '')
        })
        
        output$predWords <- renderText({
                paste0(paste0(pred$words[[1]],' (', pred$words[[3]], ')')
                       , collapse = ' - ')
        })
        
        output$userInput <- renderText({
                input$pred
                input$Sentence                            
        })
})
