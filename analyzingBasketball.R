#uses the s4-BasketballData.R
Salary
Games

my.data <- 1:20

A <- matrix(my.data, 4, 5)
A
A[2,3]

#forming a matrix
B <- matrix(my.data, 4, 5, byrow = 1)
#changing column names from the default
colnames(B) <- c('hi', 'bye', 'lie', 'sigh', 'why')
B

#rbind() and cbind() combine vectors into matrix
row1 <- c('apple','ape', 'artist')
row2 <- c('banana', 'bus', 'berry')
row3 <- c('cat', 'candy', 'color')

abc <- rbind(row1,row2,row3)
abc

#forming a matrix
C <-matrix()

matplot(t(FieldGoals/FieldGoalAttempts), pch = 15:18, type = "b", col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4, 6), pch = 15:18, horiz = F)

#getInfoOnMatplot
?matplot

FieldGoals

#use drop = F so that even when calling one vector,
#it is still a matrix
Games[1,5, drop = F]
Games[1:4,4, drop = F]

Data <- MinutesPlayed[1:3,]
matplot(t(Data), pch = 15:18, type = "b", col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players[1:3], col = c(1:4, 6), pch = 15:18, horiz = F)

#create function
my.plot <- function(data, rows=1:10) {
  Data <- data[rows,,drop = F]
  matplot(t(Data), pch = 15:18, type = "b", col = c(1:4,6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], col = c(1:4, 6), pch = 15:18, horiz = F)
}

#using function on default parameter
my.plot(Salary)

my.plot(MinutesPlayed/Games, 1:5)
