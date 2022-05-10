#use drug treatment dataset

#chi<-read.csv(file.choose()) #default
chi<- read.csv("drug_treatment_chisquare.csv")
View(chi)
head(chi)
str(chi)

# factor in R
factor(chi$treatment)
str(chi$treatment)
str(chi)
chi$treat <-factor(chi$treatment) #new variable factor type
chi$treatment <- factor(chi$treatment)

# table in r - how to create a frequency table in R
table(chi$treatment)
mean(table(chi$treatment))

# dplyr frequency table
#install.packages("plyr") #installs on machine one
library(dplyr) #load each session
dplyr::count(chi,'treatment')

#install.packages('epiDisplay')
library(epiDisplay)
tab1(chi$treatment, sort.group = "decreasing", cum.percent = TRUE)

#install.packages("gmodels")
library("gmodels")
# CrossTable in R
CrossTable(chi$treatment, chi$improvement, prop.t=TRUE, prop.r=FALSE, prop.c=FALSE)
CrossTable(chi$treatment, chi$improvement, chisq = TRUE, format='SPSS')

library(Hmisc)
Hmisc::describe(chi)

library(psych)
psych::describe(chi)

