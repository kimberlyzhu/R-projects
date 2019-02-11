?read.csv()

#Mthod 1: Select the File Manually
stats <- read.csv(file.choose())
stats

#Method 2: Set Workind Directory (WD) and read data
getwd()
setwd("/Users/kimberlyzhu/documents/R Programming")
getwd()
rm(stats) #remove stats
stats <- read.csv("DemographicData.csv")

#----- Explore data
stats
nrow(stats) #numbr of rows
ncol(stats) #number of cols
head(stats) #gives you top 6 rows
tail(stats, n = 10) #set n for how many from bottom

str(stats) #str = structure
#runif = random varaible distributed uniformly
summary(stats)

#--- using the $sign
stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users # $ works for data sets -= NOT matrices
# returns a vector of the given column
#above is same as below
stats[,"Internet.users"]

stats$Internet.users[2]

levels(stats$Income.Group)
levels(stats[,"Income.Group"])
