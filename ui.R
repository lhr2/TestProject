# ui.R
#
shinyUI(fluidPage(title = 'Word Predicting Shiny Application', 
        fluidRow(column(width = 4,
                br(),
                h3('Input'), br(),
                textInput('Sentence', 'Input Text', ''),
                actionButton('predButton', 'Next Word', icon = NULL),
                actionButton('autoButton', 'Automatically Regenerate', icon = NULL),
                actionButton('clearButton', 'Clear Text', icon = NULL),
                br(),
                br(),
                helpText(HTML('Click on the "Next Word" button to see the predicted next word.')),
                helpText(HTML('Click on the "Automatically Regenerate" button 
                                to use the previously predicted word as continuation.')),
                helpText(HTML('Click on the "Clear Text" button to delete all inputted text.')),
                offset = 1),
        
                column(width = 6, 
                h1('Prediction'),
                h4("Inputted Text:"),
                h5(textOutput('userInput')),
                br(),
                h4("Predicted Next Word"),
                h5(textOutput('predWords')),
                br(),
                helpText(HTML('Note: The number in paranethesis following the predicted word
                        is the number of words in the predicted sequence. (i.e. the(3)
                        indicates that "the" is the third word in the predicted phrase)')),
                offset = 0)
                  )
        ))