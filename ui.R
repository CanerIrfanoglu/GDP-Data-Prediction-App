library(shiny) ; library(plotly)

shinyUI(fluidPage(
    titlePanel("Historical GDP Data 1960-2015 & Predictions 2016-2020"),
    sidebarLayout(
        sidebarPanel(
            p('Gross Domestic Product (GDP) is the total value of products produced and services offered in a country within a year.When finance people need an idea about well-being of a country, GDP is usually the first indicator they refer to.'),
            helpText(   a("Wikipedia GDP - For more information",href="https://en.wikipedia.org/wiki/Gross_domestic_product", target="_blank")
            ),  
            p('This app provides historical GDP info for the 1960-2015 period. Also, the plot includes the predictions for the following 5 years. GDP data of the desired country and the year interval can be specified via using the below slider and input box.'),
            
        sliderInput("Year",
                   "Please Set the Year Interval:",
                   min = 1960,
                   max = 2020,
                   value = c(1960,2020)),
        selectInput("Country", "Please Select a Country",selected = "United States",
                    c("Aruba", "Afghanistan", "Angola", "Albania", "Andorra", "United Arab Emirates", "Argentina", "Armenia", 
                      "American Samoa", "Antigua and Barbuda", "Australia", "Austria", "Azerbaijan", "Burundi", "Belgium",
                      "Benin", "Burkina Faso", "Bangladesh", "Bulgaria", "Bahrain", "Bosnia and Herzegovina", "Belarus", 
                      "Belize", "Bermuda", "Bolivia", "Brazil", "Barbados", "Brunei Darussalam", "Bhutan", "Botswana",
                      "Central African Republic", "Canada", "Switzerland", "Channel Islands", "Chile", "China",
                      "Cote d'Ivoire", "Cameroon", "Congo, Dem. Rep.", "Colombia", "Comoros", "Cabo Verde", "Costa Rica",
                      "Cuba", "Curacao", "Cayman Islands", "Cyprus", "Czech Republic", "Germany", "Djibouti", "Dominica", 
                      "Denmark", "Dominican Republic", "Algeria", "Ecuador", "Egypt, Arab Rep.", "Eritrea", "Spain", 
                      "Estonia", "Ethiopia", "Finland", "Fiji", "France", "Faroe Islands", "Gabon", "United Kingdom", "Georgia",
                      "Ghana", "Gibraltar", "Guinea", "Guinea-Bissau", "Equatorial Guinea", "Greece", "Grenada", "Greenland",
                      "Guatemala", "Guam", "Guyana", "Hong Kong SAR, China", "Honduras", "Croatia", "Haiti", "Hungary",
                      "Indonesia", "India", "Ireland", "Iran, Islamic Rep.", "Iraq", "Iceland", "Israel", "Italy",
                      "Jamaica", "Jordan", "Japan", "Kazakhstan", "Kenya", "Kyrgyz Republic", "Cambodia", "Kiribati",
                      "St. Kitts and Nevis", "Korea, Rep.", "Kuwait", "Lao PDR", "Lebanon", "Liberia", "Libya", "St. Lucia",
                      "Liechtenstein", "Sri Lanka", "Lesotho", "Lithuania", "Luxembourg", "Latvia", "Macao SAR, China",
                      "St. Martin (French part)", "Morocco", "Monaco", "Moldova", "Madagascar", "Maldives", "Mexico",
                      "Marshall Islands", "Macedonia, FYR", "Mali", "Malta", "Myanmar", "Montenegro", "Mongolia",
                      "Northern Mariana Islands", "Mozambique", "Mauritania", "Mauritius", "Malawi", "Malaysia",
                      "North America", "Namibia", "New Caledonia", "Niger", "Nigeria", "Nicaragua", "Netherlands",
                      "Norway", "Nepal", "Nauru", "New Zealand", "Oman", "Pakistan", "Panama", "Peru", "Philippines",
                      "Palau", "Papua New Guinea", "Poland", "Puerto Rico", "Korea, Dem. People’s Rep.", "Portugal",
                      "Paraguay", "French Polynesia", "Qatar", "Romania", "Russian Federation", "Rwanda", "Saudi Arabia",
                      "Sudan", "Senegal", "Singapore", "Solomon Islands", "Sierra Leone", "El Salvador", "San Marino",
                      "Somalia", "Serbia", "South Sudan", "Sub-Saharan Africa", "Sao Tome and Principe", "Suriname",
                      "Slovak Republic", "Slovenia", "Sweden", "Swaziland", "Sint Maarten (Dutch part)", "Seychelles",
                      "Syrian Arab Republic", "Turks and Caicos Islands", "Chad", "Togo", "Thailand", "Tajikistan",
                      "Turkmenistan", "Timor-Leste", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Tuvalu",
                      "Tanzania", "Uganda", "Ukraine", "Uruguay", "United States", "Uzbekistan", "St. Vincent and the Grenadines",
                      "Venezuela, RB", "British Virgin Islands", "Virgin Islands (U.S.)", "Vietnam", "Vanuatu", "Samoa", "Kosovo",
                      "Yemen, Rep.", "South Africa", "Zambia", "Zimbabwe")
        )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        plotlyOutput("plot"),
        verbatimTextOutput("event")
    )
  )
))
