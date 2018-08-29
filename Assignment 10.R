
Import dataset from the following link: AirQuality Data Set
Perform the following written operations:

1. Read the file in Zip format and get it into R.
2. Create Univariate for all the columns.
3. Check for missing values in all columns.
4. Impute the missing values using appropriate methods.
5. Create bi-variate analysis for all relationships.
6. Test relevant hypothesis for valid relations.
7. Create cross tabulations with derived variables.
8. Check for trends and patterns in time series.
9. Find out the most polluted time of the day and the name of the chemical compound.


library(tidyr)
library(stringr)
library(readxl)
library(tidyverse)

1. Read the file in Zip format and get it into R.
# Ans: No.1

airquality<-read_xlsx("F:/AcadGild/Files/AirQualityUCI/AirQualityUCI.xlsx")
airquality

names(airquality)

summary(airquality)

View(airquality)

sum(complete.cases(airquality))

colMeans(is.na(airquality))*100



2. Create Univariate for all the columns.
#Ans: No.2

str(airquality)

library(psych)

describe(airquality)

boxplot(airquality$`PT08.S2(NMHC)`, main="boxplot", ylab="CO(GT)",col=5)

plot(airquality$`PT08.S2(NMHC)`, col=3)

hist(airquality$`PT08.S2(NMHC)`,col = 7)



3. Check for missing values in all columns.
#Ans: No.3

is.na(airquality)

sapply(airquality, function(x)all(is.na(x)))




4. Impute the missing values using appropriate methods.
#Ans: No.4

library(mice)
library(lattice)

summary(airquality)

md.pattern(airquality)



5. Create bi-variate analysis for all relationships.
#Ans: No. 5

#Bivariate statistics
#Often, before conducting regression analysis, quantitative papers will present a series of bivariate relationships 
in order to establish unconditional relationships. Here are some common ones.

summary(airquality)

t.test(airquality$`PT08.S2(NMHC)`, airquality$RH)

t.test(airquality$`PT08.S2(NMHC)`, airquality$AH)



6. Test relevant hypothesis for valid relations.
#Ans: No.6

t.test(airquality$RH, airquality$AH)




7. Create cross tabulations with derived variables.
#Ans: No. 7
# 2-Way Cross Tabulation
library(gmodels)

mydata<-(airquality)

CrossTable(mydata$myrowvar, mydata$mycolvar)




8. Check for trends and patterns in time series.
#Ans: No.8

summary(airquality$Time)

table(airquality$Time)
#Time series
ts (airquality$Time, frequency = 4, start = c(1959, 2)) # frequency 4 => Quarterly Data
ts (1:12, frequency = 12, start = 1990) # freq 12 => Monthly data. 
ts (airquality$Time, start=c(2009), end=c(2014), frequency=1) # Yearly Data

#Trends
#The decompose() and forecast::stl() splits the time series into seasonality, trend and error components
tsData <- airquality[, 2] # ts data
decomposedRes <- decompose(tsData, type="multiplicative") # use type = "additive" for additive components
plot (decomposedRes) # see plot below
stlRes <- stl(tsData, s.window = "periodic")




9. Find out the most polluted time of the day and the name of the chemical compound.
#Ans: No.9

PT<-table(airquality$`PT08.S3(NOx)`,airquality$Date)
PT
View(PT)



