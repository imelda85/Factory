# Shiny Dashboard (No SQL). 
# by : Imelda Sianturi
# Matana University
# Notes: Please don't share this code anywhere (just for my lecturer and my friends)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# A. Libraries 
library(shiny)
library(shinydashboard)
library(dplyr)
library(readxl)
library(plotly)
library(rworldmap)

# B. Import Data
Complete <- read.csv2("Complete.csv", header = T, sep = ";")

# C. User Interface
shinyUI(
    dashboardPage(
        skin = "yellow",
        dashboardHeader(title = "Imelda's Factory",
                        dropdownMenu(type = "tasks"),
                        dropdownMenu(type = "notifications"),
                        tags$li(class = "dropdown",tags$img(src = "Matana.png",
                                                            type = "image/png",
                                                            height = 50, 
                                                            width = 50))),
        
        dashboardSidebar(
            sidebarMenu(
                sidebarSearchForm("searchText",
                                  "buttonSearch",
                                  "Search"),
                
                menuItem("Dashboard",
                         tabName = "dashboard",
                         icon = icon("dashboard")),
                
                menuItem("Table",
                         tabName = "table",
                         icon = icon("table")),
                
                menuItem("Summary",
                         tabName = "summary",
                         icon = icon("clipboard-list")),
                
                menuItem("Raw Data & Source Code",
                         icon = icon("download"),
                         href = ""),
                
                menuItem("About Me",
                         icon = icon("id-card"),
                         menuSubItem("Linked in",
                                     icon = icon("linkedin"),
                                     href = "https://www.linkedin.com/in/imelda-sianturi-331675192/"),
                         
                         menuSubItem("Twitter",
                                     icon = icon("twitter-square"),
                                     href = "https://twitter.com/melda0203"))
            )
        ),
        dashboardBody(
            tabItems(
                tabItem(
                    tabName = "dashboard",
                    fluidRow(
                        infoBox("Top Sales (Country)",
                                628,"USA",
                                width = 3,
                                icon = icon("globe-americas"),
                                color = "blue"),
                        infoBox("Top Sales (City)",
                                205, "London",
                                width = 3,
                                icon = icon("city"),
                                color = "yellow"),
                        infoBox("Top Product",
                                108, "Raclette Courdavault",
                                width = 3,
                                icon = icon("heart"),
                                color = "green"),
                        infoBox("Top Quantity",
                                130,
                                width = 3,
                                icon = icon("thumbs-up"),
                                color = "orange")
                    ),
                    fixedRow(
                        valueBoxOutput("value1", width = 4),
                        valueBoxOutput("value2", width = 4),
                        valueBoxOutput("value3", width = 4)
                    ),
                    fluidRow(
                        box(title = "Box Plot",
                            width = 12,
                            status = "success",
                            solidHeader = T,
                            plotlyOutput("box_plot"))
                    ),
                    fluidRow(
                        box(title = "Histogram",
                            status = "primary",
                            solidHeader = T,
                            plotlyOutput("histogram")),
                        box(title = "Bar Plot",
                            status = "danger",
                            solidHeader = T,
                            plotlyOutput("bar_plot")))
                   
                ),
                tabItem(tabName = "table",
                        fluidRow(
                            DT::dataTableOutput("data_table"))
                ),
                tabItem(tabName = "summary",
                        fluidRow(
                            verbatimTextOutput("summary")
                        ),
                        
                )
            )
        )
    )
)