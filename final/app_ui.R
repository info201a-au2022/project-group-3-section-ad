library(plotly)
library(dplyr)
library(tidyverse)
library(stringr)
library(shiny)
library(ggthemes)
library(ggplot2)
library(shiny)



# Loading Data

# Graph 1
    #Data and data cleansing
men_v_women_unemployment_rate <- read.csv <- read.csv("unemployment-rate-men-vs-women.csv", stringsAsFactors = FALSE)

names(men_v_women_unemployment_rate) [4] = "women_unemployment_rate"

names(men_v_women_unemployment_rate) [5] = "men_unemployment_rate"

men_v_women_unemployment_rate <- men_v_women_unemployment_rate %>% 
  group_by(Year)

year_range <- range(men_v_women_unemployment_rate$Year)

country_pick <- selectInput(inputId= "country_pick",
                            label = "Select Country", 
                            choices = men_v_women_unemployment_rate$Entity,
                            selected = c("United States", "France", "Japan", 
                                         "Chad", "India", "China", "Nigeria", 
                                         "Afghanistan", "Poland", "Russia", "Qatar", 
                                         "Brazil", "Ecuador", "Tunisha", "Tukmenistan", 
                                         "Egypt", "Bangledash"),
                            multiple = TRUE)

year_slider <- sliderInput(inputId = "Year",
                           label = "Year Range", sep="",
                           min = 1991,
                           max = 2019,
                           value = 2019)

    #Theme
blank_theme <- theme_bw() +
  theme(
    axis.ticks = element_blank(),
    plot.background = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank()
  )


# Graph 2 
long_run_perspective <- read.csv("Long run perspective on female labor force participation rates.csv")
names(long_run_perspective) [4] = "long_run_perspective_female_labor_force_participation_rate"

long_run_perspective <- long_run_perspective %>% 
  mutate(numbers = round(long_run_perspective$long_run_perspective_female_labor_force_participation_rate, digits = 2))

numbers <- round(long_run_perspective$long_run_perspective_female_labor_force_participation_rate, digits = 2)

country_unique <- unique(long_run_perspective$Entity)

country_pick2 <- selectInput(inputId = "country_pick2",
                            label = "Select Country",
                            choices = long_run_perspective$Entity,
                            selected = country_unique[1],
                            multiple = TRUE)

# Graph 3
chart_3_data_set_complete <- read.csv("female-labor-force-by-age-chart-3-v2.csv")

year_range3 <- range(chart_3_data_set_complete$Year)

year_slider3 <- sliderInput(inputId = "year_slider3",
                           label = "Year Range", sep = "",
                           min = 1991,
                           max = max(chart_3_data_set_complete$Year),
                           value = c(2030))
# Report Page
table_data <- read.csv("data_for_table.csv", stringsAsFactors = FALSE)


  # Title
intro_tab <- tabPanel(
  title = "Introduction",
  fluidPage(
    p("Throughout the course of our lives, one of the defining trends that we've experienced first-hand has been
      the monumental changes in the number of females participating in labor markets, across the world. Upon 
      brainstorming various issues to direct our research towards, we were fascinated by the prevalence and importance
      that this change has had on our society. Our team recognized that the changes in women's supply of labor have the potential
      to", tags$strong("lead to increases in household incomes, innovation, consumption of goods, in addition to helping
      families escape poverty"),"and set out to find a data set in which we could explore this realization, and become
      better informed on the matter. With the help of", tags$em("OurWorldinData"),"we planned on analyzing and reporting how
      the evolution of female labor force participation has changed over the years using variables such as time, country, age, and
      gender. Due to the data being extensive, we decided to form three research questions to serve as guidance in our 
      exploration. These questions include:", tags$em("Are there bigger discrepencies between the employment of men and women in 
      countries where unemployment is more common?, What countries have experienced the highest and lowest rates of growth in
      female labor force participation rates over the years?, and What age demographics are growing or declining their share within
      the female labor force?"),"Upon formulating these questions, we set out on a journey to become better informed on this
      topic and empower future generations to continue this trend and be the leaders of tomorrow. Three key findings we gathered
      from this report include there being a discrepancy between male and female unemployment rates, strong
      long-term growth of female labor force participation over the past 50 years, and all female age demographics having
      experienced growth in female labor force participation, with some age demographics growing faster than others. For a more
      comprehensive summary of our key findings, please refer to the 'Summary Takeaways' page. Enjoy!"),
    br(),
  )
)

summary_takeaways <- tabPanel(
  title = "Summary Takeaways",
  fluidPage(
    h4(strong(em("Unemployment Rate, Men v Women"))),
      p("For our first chart, we decided to plot the", tags$em("unemployment rate of men"), 
       "against the", tags$em("unemployment rate of women"),". A key insight from this chart is that in most countries", 
       tags$em("unemployment rates are higher for women as opposed to men"),". While this is true,", tags$em("the difference 
       between the male and female unemployment rates also depend on the overall unemployment rate of the country."), "As we 
       can see in the chart, in the lower-left side there is a high concentration of countries that fall close to an upward 
       trend line indicating that in countries with lower unemployment rates, the gender disparity in unemployment is not as 
       large. On the other hand, in the top section of the graph, you can see that the countries are more dispersed from each 
       other indicating countries with higher overall unemployment have larger gender discrepancies 
       in male and female employment."),
    br(),
    h4(strong(em("Long Run Perspective on Female Labor Force Participation Rates"))),
    p("For our second chart, we decided to plot the", tags$em("percentage of female labor force participation rates over the
      course of the period in which the data was collected"),". We provided the the 'Select Country' widget to allow the
      user to toggle which countries they would like to display. In doing so, a key insight that can be seen from
      this visualization is that in most cases", tags$em("countries have seen an increase in the female labor force participation
      rates, especially since the late 1990s until present-day."), "Another interesting insight is that certain countries,
      such as the United States, have experienced a large increase in the participation rate between 1900 and 2000, but
      has actually decreased in recent years from around 60% to 57%. Lastly, this visualization", tags$em("highlights some of the limitations
      in our data set as certain countries have data dating all the way back from 1900 on a yearly basis while others
      collected their data starting in the 2010s.")),
    br(),
    h4(strong(em("Female Labor Force by Age"))),
    p("For our third chart, we decided to plot the", tags$em("difference in the number of females within the labor force
      over the years, by age demographic."), "We incorporated the 'Year Range' widget to allow the user to toggle between
      years and get a better understanding for how the overall number of females in the labor force have increased within
      a given period of time. When manipulating this visualization, a key insight that can be made is that there have been",
      tags$em("increases in the number of females within the labor force in all age demographics, with a particular impact on females
      ages 25-34 and 35-44."), "This could primarily be due to societal changes regarding women in the workforce, in a plethora
      of different industries. Like previously mentioned, there weren't any demographics that experienced a decrease in the 
      number of females working in the labor force, but females aged 15-24 and 65+ experienced the smallest increases. Another
      insight from the visualization is that the", tags$em("number of females within the labor force increased from around 900 million
      in 1990 to a projected 1.5 billion in 2030"), "a monumental increase!"),
    ))

final_report_page <- tabPanel(
  title = "Report Page",
  fluidPage(
    h4("Code Name: Fem Force"),
    h5("Katie Braden (kbrad12@uw.edu), Jordan Kauffman (jbkauff@uw.edu)"),
    h5("INFO-201: Technical Foundations of Informatics- The Information School - University of Washington"),
    h5("Autumn 2022"),
    h4(strong(em("Abstract"))),
    p("Our main question in this project is how female participation in the labor force has evolved over time?
      This question is important because despite their being an increase in female participation in recent years, 
      there is still gender inequality in the workplace and aim to uncover the reasons why through our analysis. 
      In our analysis, we plan to compare the evolution of participation by gender, time, and age."),
    h4(strong(em("Keywords"))),
    p("Female, Gender Inequality, Labor Force Participation, Workforce, Age Inequality"),
    h4(strong(em("Introduction"))),
    p("One of the primary trends that defined the 20th century was its radical increase in the number of women participating 
    in labor markets across early-industrialized countries. Due to this fascination with women's employment, OurWorldinData set 
    out to uncover how and why these changes are taking place (Ortiz-Ospina,Tzvetkova & Roser, 2018). In their research, they worked 
    to present the key facts and drivers behind this important change in our society with leading questions such as what are the effects 
    of married women driving the increase in female labor participation in rich countries, why men continue to participate in labor markets
    more frequently than women, how female labor participation varies across age, gender, country, and more."),
    p("While our group was initially drawn to directing our focus on a climate related issue, we recognized the structural changes of the economy 
      that have come from the increase in female labor force participation rates and the importance that it plays in a societies’ productivity and 
      innovative nature. As a result, we aim to gain a better understanding of this topic through an in depth analysis of the data set and external 
      research efforts."),
    
    h4(strong(em("Problem Domain"))),
    p("It is no question that female participation in the labor force has experienced drastic levels of change over the course of the past century and
      has led to many benefits to society as a whole. For example, changes in women's supply of labor have the potential to lead to increases in household
      incomes, innovation, consumption of goods, in addition to helping families escape poverty (Molotsky, 2022). A pattern that the team brainstormed was in
      regards to the development of a given country and the rates at which females participate in the labor force. In an effort to answer some of these questions
      that we have had as well as the more defined research questions that are discussed later on in the proposal, we searched for comprehensive and accurate data
      sets on the internet."),
    p("Like previously mentioned, the subject of our project is regarding female participation in the workforce and came across the data set published by OurWorldinData.
      Within this data set, we plan to analyze and report on how the evolution of female labor force participation benchmarks to different factors including geographics, gender, time, and age.
      To do so, we will start the report with a historical perspective of the topic. We used our data sets to create a graph around how female labor force participation have increased
      over time in various countries. Next, the report will transition to exploring how different situational factors such as location, age, and gender have affected the evolution of female labor 
      force participation.To supplement these factors we will incorporate the following research papers and reports: Maternal Education, Female Labor Force Participation
      and Child Mortality (Tulasidhar, 1993), Childcare Policies: Key for Female Labor Participation (Díaz, 2016), and Economic Development, Structural Change, and Women's Labor Force Participation 
      (Gaddis & Klasen, 2013)."),
    p("At the end of the report, we have included a summary that highlights the takeaways from our findings. In this summary, we plan to include information on the evolution of females in the labor force,
      and factors such as age and gender that affect its growth or lack of growth. Finally at the very end, we will include a sub-note that conceptually defines “work” and how work has been measured from 
      survey data."),
    
    h5(tags$em("Human Values")),
    p("This topic and report are aimed around the human value of gender equality. There is a clear lag of female labor force participation in comparison to men labor force participation and through this report,
    we hope to unveil two things (Bell, 2018). The first is a good understanding of the current state of the female labor force and the second is the reasons why the female labor force is at the state it is in."),
    h5(tags$em("Direct and Indirect Stakeholders")),
    p("Direct stakeholders involved with this data and report might include individuals who are passionate about gender inequality and specifically want to learn more about female labor force participation. Indirect
    stakeholders might be legislators who are being presented this data by advocates who are passionate about increasing female labor workforce participation."),
    h5(tags$em("Potential Benefits and Harms")),
    p("Possible harms include making assumptions in our analysis about the outcomes and implications these datasets are revealing. Potential benefits include increasing the awareness around female labor force participation
    and encouraging action."),
    
    h4(strong(em("Research Questions"))),
    p(tags$em("Are there bigger discrepencies between the employment of men and women in countries where unemployment is more common?")),
    p("While there has been an increase in female participation in the labor force over time, there are still major discrepencies of 
      workforce participation based on gender. This question aims to investigate how large these discrepencies are and how they vary in 
      different regions of the world."),
    p(tags$em("What countries have experienced the highest and lowest rates of growth in female labor force participation over the years?"),
      p("Different countries of the world experience unemployment disproportionately and this is especially true for female unemployment. 
      From this question, we aim to discover the evolution of female labor force participation broken down by country."),
      p(tags$em("What age demographics are growing or declining their share within the female labor force?")),
      p("Another factor that might have an effect on female labor force participation is age. With this question, we aim to investigate the
      how age affects the rate of growth of female labor force participation"),
      h4(strong(em("The Dataset"))),
      p("Our dataset details rates of male and female participation in the workforce, a long-term perspective on female participation rates in the workforce,
      and how female labor force participation varies by age. All of these datasets help to answer our research questions specifically and ultimately answer
      how female participation in the workforce has evolved over time."),
      basicPage(
        dataTableOutput("mytable")
      ),
      p("In regard to the provenance of our dataset, it was collected by Our World in Data for the first time in 2018. Since its inception, the Our World in Data
      has kept the information up-to-date with current and updated datasets. The purpose of collecting this data was to report on the growth of female labor force
      participation which is known as one of the major economic developments of the last century. The data collection effort is funded by donations given to the Our
      World in Data organization. The Our World in Data organization is also supported by the University of Oxford and Y Combinator. The individuals that are likely 
      to benefit from the data to make money are researchers, reporters and those that are advocates of female labor force participation. These are the people that 
      might take this data and analyze it and create their own reports that they can then sell to news sources or present to governmental entities. The data is 
      validated and held secure as a lot of it comes from government sources or government sponsored sources who have quality standards and regulations. Therefore,
      we believe this data to be trustworthy. We obtained this data through the World in Data website and we credit the source of the data because World in Data is a
      reputable source backed by well-known and regarded organizations."),
      h4(strong(em("Findings"))),
      h5(em("Question #1: Are there bigger discrepencies between the employment of men and women in countries where unemployment is more common?")),
      p("A key insight we found from our research and chart analysis is that female unemployment is still lower than male unemployment on average. Although the magnitude
      of the discrepencies between the two depends on the overall unemployment in the particular country. We found that in countries with higher unemployment rates 
      overall there was a larger discrepency between there male and female unemployment rates and vice versa."),
      h5(em("Question #2: What countries have experienced the highest and lowest rates of growth in female labor force participation rates over the years?")),
      p("From our analysis, we found that most countries on average have experienced an increase in their female labor force participation rates over the last 50 years.
      Additionally, we found that certain countries, such as the United States, have experienced an especially large increase from 1990 to 2000 but since then has 
      has decreased slowly. This might be due to the increase in social awareness in our communities and advocacy to decrease gender inequality in the workforce."),
      h5(em("Question #3: What age demographics are growing or declining their share within the female labor force")),
      p("By analyzing a data set and a chart regarding the female labor force participation by age, we found that there has been an increase in the number of females in the 
      workforce in all age demographics. There has also been more substantial growth for the age groups of 25-34 and 35-44. This could be due to the structure of society today
      that puts a lot of emphasis on these age groups to participate in the workforce. While there weren't any age demographics that experienced a decrease in female labor 
      force participation, females aged 15-24 and 65+ experienced the smallest increases."),
      h4(strong(em("Discussion"))),
      p("Our findings from our research have many relevant and practical implications on society. While we have determined that female labor force participation has increased
      overtime, we know that there are still many disparities within employment and labor force participation based on certain factors such as country, gender, and age. For instance, 
      we know that labor force participation on average has increased over time but it is increasing at much faster rates in more Western countries than some third-world countries.
      Perhaps, policy makers can take this insight and dedicate more resources and funding towards prospering employment in these countries. Additonally, we saw that in most countries,
      males have lower unemployment rates than females. This should be a call to action for companies to perhaps shift their focus of their recruting efforts to place on emphasis
      on hiring more females. Finally, we saw that some age groups have experienced faster rates of growth in female labor force participation than other age groups particularly ages 15-24
      and 65+ experienced slower growth. This might spark individuals in these age groups to encourage one another or start organizations that help them increase their labor force participation.
      For instance, a high-schooler might start a business club to help students feel more prepared coming into college to land an internship."),
      h4(strong(em("Conclusion"))),
      p("If there is one thing to take away from this report, it would be that even if one societal issue looks like it is getting better overtime, that does not mean that there are still other
      societal issues or inequalities associated with that primiary socitetal issue that are going ignored. In our case, even though female labor force participation and unemployment rates are
      getting better over time, that does not mean that there are not inequalites associated with the female workforce that are left unsolved. We have discovered inequalities based on country,
      age, and gender each with their own underlying causes. This is why a lot of inequalities go ignored, because data analysts and publishers have the ability to push their biases onto the data 
      that they analyze and share with the public. This can cause the public to only hear the good sides of an issue society is dealing with while ignoring the many pitfalls. Therefore, it is super 
      important for readers to read each article and analyze each chart or information they receive from a third-party source with a critical eye. in the case of this report, we have done more granular
      analysis to reveal some of these important ineqalities that still exist when it comes to female employment and it will be vital to share this information with key primary stakeholders so we can
      collectively take action."),
      h4(strong(em("Acknowledgements"))),
      p("There are multiple parties we would like to acknowledge for the completion of this report. First, we would like to thank our professor, Thomas Winegarden, and our teaching assistant, Yubing Tian. 
      We would also like to thank eachother/all the teammates (Jordan Kauffman and Katie Braden) that collaborated to put this report together. Finally, we would like to thank the Our World in Data source
      for being the primary collector and provider of our data sets and sources."),
      h4(strong(em("References"))),
      p("Díaz, Mercedes. “Childcare Policies: Key for Female Labor Participation: Cashing in on Education: Women, Childcare, and Prosperity in Latin America and the Caribbean.” Latin American Development Forum,
    2016, https://elibrary.worldbank.org/doi/10.1596/978-1-4648-0902-6_ch2."),
      p("Gaddis, Isis, and Stephan Klasen. “Economic Development, Structural Change, and Women's Labor Force Participation: - Journal of Population Economics.” SpringerLink, Springer Berlin Heidelberg, 15 Oct. 2013,
        https://link.springer.com/article/10.1007/s00148-013-0488-2."),
      p("Molotsky, A. “Labor Force Participation Rate, Female (% of Female Population Ages 15+).” Data Catalog, https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators."),
      p("ILOSTAT. “The Leading Source of Labour Statistics.” ILOSTAT, http://www.ilo.org/ilostat/."),
      p("Oecd. “Average Weekly Hours Worked (Women 15+) (OECD Labor Force Statistics (2017).” Average Usual Weekly Hours Worked on the Main Job, 2017, http://stats.oecd.org/Index.aspx?DatasetCode=AVE_HRS."),
      p("Bell, SR. “Ratio of Female to Male Labor Force Participation Rate (%).” Data Catalog,2019 https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators."),
      p("Rosado, Pablo, et al. “Our World in Data (Female Labor Force Participation Rate).” Our World in Data, 2018, https://ourworldindata.org/."),
      p("“Social Protection - Family Benefits Public Spending - OECD Data.” TheOECD, https://data.oecd.org/socialexp/family-benefits-public-spending.htm."),
      p("Tulasidhar, Viba. Maternal Education, Female Labour Force Participation and Child - Jstor.org. 1993, https://www.jstor.org/stable/40652017."),
      p("World Bank (2016). Maternal Mortality Ratio (Gapminder (2010) and World Bank (2015)). https://www.gapminder.org/documentation/documentation/gapdoc010.pdf."),
      h4(strong(em("Appendix A"))),
      p("At this time, Jordan and I have no further questions but I just wanted to put a note here as a reminder for the adjusted grading scale we talked about with the professor and our TA
  considering we only had two group members working on this project. Thank you for a great quarter!")
    )
  ))


# Brief overview of project: what questions are we seeking to answer, what data will we use? Additional flare in image

# Introductory Page


# Define UI for application that draws a histogram
  
ui <- fluidPage(h1(em("Analyzing Female Labor Force Participation Over the Years"),
                   style = "text-align : center; color : navy"),
                
                tabsetPanel(
                  tabPanel(
                    title = "Introduction", 
                    titlePanel(strong("Introduction to Our Project")),
                    intro_tab, imageOutput("home_img"), align = "center"),
                  
                  tabPanel(
                    title = "Unemployment Rate, Men v Women",
                    titlePanel(strong("Unemployment Rate, Men v Women")),
                    titlePanel(tags$h4(em(("Are there bigger discrepencies between the 
                    employment of men and women in countries where unemployment
                    is more common?")))),
                    fluidRow(
                      column(country_pick, width = 6),
                      column(year_slider, width = 6)
                    ),
                    fluidRow(
                      column(plotlyOutput("chart1"), width = 12)
                    ),
                    p("This scatter plot", tags$em("compares male and female unemployment rates."), 
                       "The unemployment rate expresses the number of people unemployed as a percent 
                       of the labor force. Overall, we see that unemployment rates are higher for 
                       women as opposed to men."), align ="center"),
                 
                  tabPanel(
                    title = "Long Run Perspective on Female Labor Force",
                    titlePanel(strong("Long Run Perspective on Female Labor Force Participation Rates")),
                    titlePanel(tags$h4(em(("What countries have experienced the highest and 
                               lowest rates of growth in female labor force
                               participation rates over the years?")))),
                    fluidRow(
                      column(country_pick2, width = 6),
                    ),
                    fluidRow(
                      column(plotlyOutput("chart2"), width = 12)),
                    p("This line chart", tags$em("shows the changes in female labor force participation rates
                      over the years for a given country."),"The visualization expresses the participation rate as a
                      percent of the labor force. Overall, we see that many of the countries within the data set
                      have experienced increases in participation rates over the period."), align="center"),
    
                  tabPanel(
                    title = "Female Labor Force by Age",
                    titlePanel(strong("Female Labor Force by Age")),
                    titlePanel(tags$h4(em(("What age demographics are growing or declining
                               their share within the female labor force?")))),
                           fluidRow(
                             column(year_slider3, width = 6)),
                           fluidRow(
                             column(plotlyOutput("chart3"), width = 12)),
                           p("This stacked area chart", tags$em("shows the differences in the number of females
                             within the labor force over the years."), "The visualization expresses the various 
                             demographics (i.e., 15-24,25-34) as a percentage of the entirity of the female
                             labor force. Overall, we see that between the years of 1901 and 2030, there have
                             been increases in all age demographics with a particular impact on females 25-34,
                             and 35-44."), align="center"),
                  
                  tabPanel(
                    title = "Summary Takeaways",
                    titlePanel(strong("Major Findings from Research")),
                    summary_takeaways, imageOutput("summary_img"), align = "center"),
                  
                  tabPanel(
                    title = "Report",
                    titlePanel(strong("Female Participation in the Workforce")),
                    final_report_page),
                ))
