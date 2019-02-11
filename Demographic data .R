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

#------- Basic Operations with a DF
stats[1:10,]
stats[c(4,100),]

#how does [] work:
stats[1,] #still a dataframe!
is.data.frame(stats[1,])
stats[,1]
is.data.frame(stats[,1,drop = F])

#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users

#add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)
#if vector is less than length, vector gets recycled
stats$xyz <- 1:5
head(stats)

stats$xyz <- NULL
stats$MyCalc <- NULL
#-------------------- Filtering Data Frames
stats$Internet.users < 2 #gives a vector of true/false
filter <- stats$Internet.users < 2
stats[filter,] #only displays rows that are true

stats[stats$Birth.rate >40,]
stats[stats$Birth.rate >40 & stats$Internet.users <2,]
stats[stats$Income.Group == "High income",]

stats[stats$Country.Name == "Malta",] #just malta row

#------------------- qplot()
install.packages("ggplot2")
library(ggplot2)
?qplot

qplot(data = stats, x = Internet.users)
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(3), color = I("red"))
qplot(data = stats, x = Income.Group, y = Birth.rate, geom = "boxplot")
      
#----------------- Visualizing what we need
qplot(data = stats, x = Internet.users, y = Birth.rate)
qplot(data = stats, x = Internet.users, y = Birth.rate, size = I(4),
      color = I("blue"))
qplot(data = stats, x = Internet.users, y = Birth.rate, size = I(4),
      color = Income.Group)

#-------------- Creating Data Frames
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("country", "codes", "regions")

#aboves is same as this below
mydf <- data.frame(country = Countries_2012_Dataset, code = Codes_2012_Dataset, 
                   region = Regions_2012_Dataset)
head(mydf)
tail(mydf)

#-------------Merging dataframes
head(stats)
head(mydf)
merged.data.frame <- merge(stats, mydf, by.x = "Country.Code", by.y = "code")
merged.data.frame$country <- NULL
ncol(merged.data.frame)
merged.data.frame

#-------Visualizing With new split
#SHAPES!
qplot(data = merged.data.frame, x = Internet.users, y = Birth.rate,
      color = region, size = I(5), shape = I(23))

#Transparaency
qplot(data = merged.data.frame, x = Internet.users, y = Birth.rate,
      color = region, size = I(5), shape = I(19), alpha = I(0.6),
      main = "Birth Rate vs Internet Users")
