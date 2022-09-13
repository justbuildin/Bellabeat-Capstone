library(tidyverse) # wrangle data
library(lubridate) # wrangle date attributes
library(janitor) # for examining and cleaning dirty data
library(skimr) # get summary data
library(dplyr) # data frame manipulation
library(ggplot2) # for visualizations

activityday <- read.csv("dailyActivity_merged.csv")
calorieshr <- read.csv("hourlyCalories_merged.csv")
intensitieshr <- read.csv("hourlyIntensities_merged.csv")
sleepday <- read.csv("sleepDay_merged.csv")
weight <- read.csv("weightLogInfo_merged.csv")
stepshr <- read.csv("hourlySteps_merged.csv")
heartratesec <- read.csv("heartrate_seconds_merged.csv")

#Fix date/time formatting
intensitieshr$ActivityHour=as.POSIXct(intensitieshr$ActivityHour, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
intensitieshr$time <- format(intensitieshr$ActivityHour, format = "%H:%M:%S")
intensitieshr$date <- format(intensitieshr$ActivityHour, format = "%m/%d/%y")

calorieshr$ActivityHour=as.POSIXct(calorieshr$ActivityHour, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
calorieshr$time <- format(calorieshr$ActivityHour, format = "%H:%M:%S")
calorieshr$date <- format(calorieshr$ActivityHour, format = "%m/%d/%y")

activityday$ActivityDate=as.POSIXct(activityday$ActivityDate, format="%m/%d/%Y", tz=Sys.timezone())
activityday$date <- format(activityday$ActivityDate, format = "%m/%d/%y")
#time not necessary for activityday

sleepday$SleepDay=as.POSIXct(sleepday$SleepDay, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
sleepday$date <- format(sleepday$SleepDay, format = "%m/%d/%y")
#time not necessary for sleep day

weight$Date=as.POSIXct(weight$Date, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
weight$date <- format(weight$Date, format = "%m/%d/%y")

stepshr$ActivityHour=as.POSIXct(stepshr$ActivityHour, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
stepshr$time <- format(stepshr$ActivityHour, format = "%H:%M:%S")
stepshr$date <- format(stepshr$ActivityHour, format = "%m/%d/%y")

heartratesec$Time=as.POSIXct(heartratesec$Time, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
heartratesec$time <- format(heartratesec$Time, format = "%H:%M:%S")
heartratesec$date <- format(heartratesec$Time, format = "%m/%d/%y")

help (as.POSIXct)

#check columns for correct change to date/ time
head(activityday)
head(calorieshr)
head(intensitieshr)
head(sleepday)
head(weight)
head(stepshr)
head(heartratesec)

# count distinct value of "ID" 
n_unique(activityday$Id)
n_unique(calorieshr$Id)
n_unique(intensitieshr$Id)
n_unique(sleepday$Id)
n_unique(weight$Id)
n_unique(stepshr$Id)
n_unique(heartratesec$Id)
