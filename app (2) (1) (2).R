library(shiny)

#UI
ui <- fluidPage(

    # Application title
    titlePanel("Zakat Calculator"),
    h4("What is Zakat?"),
    h6("Zakat is a compulsary act of giving as it is the third from the five main pillars upon of Islam. The importance of zakat payment can be clearly seen from the verses in Al-Quran, in which the obligation to perform salah (prayer) is usually followed by the obligation to pay zakat on Muslims who have the means."),
    h4("How is zakat calculated?"),
    h6("Assets to include in your Zakat calculation are cash (in hand, in bank accounts or money lent to someone), shares, pensions, and precious metals, such as gold and silver.
       Personal items (your home, furniture, cars, food, clothing) are not included in Nisaab.
       There are two measures to determine Nisaab – gold (3 ounces or 85 grams, or its cash equivalent).
       On today’s price of gold per gram of RM173.79, the nisaab is RM 14,772.00.
"),
    h4("How this web app will help you?"),
    h6("This web app uses a programmed mathematical computation to help you to count how much you need to pay the zakat easily."),
    h4("Enjoy! :D"),
    # Sidebar text input 
    sidebarLayout(
        sidebarPanel(
            numericInput("number1",
                        "Cash in RM:",
                        min = 0,
                        max = 1000000,
                        value = 0),
            numericInput("number2",
                         "Pensions in RM:",
                         min = 0,
                         max = 1000000,
                         value = 0),
            numericInput("number3",
                         "Investment Properties in RM:",
                         min = 0,
                         max = 1000000,
                         value = 0),
            numericInput("number4",
                         "Shares in RM:",
                         min = 0,
                         max = 1000000,
                         value = 0),
            numericInput("number5",
                         "Debts from Credit Cards in RM:",
                         min = 0,
                         max = 1000000,
                         value = 0),
            numericInput("number6",
                         "Debts from College Loans in RM:",
                         min = 0,
                         max = 1000000,
                         value = 0),
            numericInput("number7",
                         "Other Loans in RM:",
                         min = 0,
                         max = 1000000,
                         value = 0)
        ),

        # Show output
        
        mainPanel(
            h3("Your total wealth (RM):"),
            textOutput("text1"),
            h3("Your total debts (RM):"),
            textOutput("text2"),
            h3("Your net worth (RM):"),
            textOutput("text3"),
            h6("Notes: You are required to pay zakat only if your total wealth minus total debt is greater than RM 14,772."),
            h3("Zakat required (RM):"),
            textOutput("text4")
        )
    )
)

# Server logic
server <- function(input, output) {

    output$text1 <- renderText({input$number1+input$number2+input$number3+input$number4
    })
    output$text2 <- renderText({input$number5+input$number6+input$number7
    })
    output$text3 <- renderText({(input$number1+input$number2+input$number3+input$number4-input$number5-input$number6-input$number7)
    })
    output$text4 <- renderText({(input$number1+input$number2+input$number3+input$number4-input$number5-input$number6-input$number7)*0.025
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
