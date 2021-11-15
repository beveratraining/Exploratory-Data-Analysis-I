#Example 2: Descriptive Statistics

insurance <- read.csv(file.choose())
---------------
install.packages("devtools")
library(devtools)
devtools::install_github("ropensci/visdat")
library(visdat)

vis_miss(insurance)
vis_dat(insurance)
---------------

install.packages("DataExplorer")
library(DataExplorer)
DataExplorer::create_report(insurance) 
---------------

# https://www.littlemissdata.com/blog/inspectdf
#devtools::install_github("alastairrushworth/inspectdf")
install.packages("inspectdf")
library(inspectdf) 

inspect_types(insurance)

#When using packages dplyr 
library(dplyr)
inspect_types(insurance)  %>% show_plot()

head(insurance, n = 5)
str(insurance)

# Descriptive Statistics
summary(insurance)

#The respondents' gender and region of origin is evenly distributed, having age ranging from 18 to 64 years old. Non-smokers outnumber smokers 4 to 1. The average, medical cost is USD 13,270 with a median value of USD 9382.
#install.packages("psych")
library(psych)
# Per region
describeBy(insurance$charges,insurance$region)

# Create histogram
hist(insurance$age)

# Smoking status
describeBy(insurance$charges,insurance$smoker)

# By gender
describeBy(insurance$charges,insurance$sex)

# By number of children
describeBy(insurance$charges,insurance$children)


# Create new variable derived from bmi
insurance$bmi30 <- ifelse(insurance$bmi>=30,"yes","no")

# By obesity status
describeBy(insurance$charges,insurance$bmi30)


pairs.panels(insurance[c("age", "bmi", "children", "charges")])
#age has the highest correlation with charges amongst our numeric variables. Another observation we can make from this plot is that none of our numeric values is highly correlated with each other, so multicollinearity wouldn't be a problem. Another thing to note is that the relationship between age and charges might not be really linear at all.
