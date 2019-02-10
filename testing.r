install.packages("ggplot2")
library(ggplot2)
qplot(data=diamonds, carat, price, color = clarity, facets =.~clarity)
