#install.packages("ggplot2")
library(ggplot2)
data = read.table("/Users/zoltanctoth/src/my/bigdata-training/spark/data/logreg2.txt", sep=" ", header=FALSE, col.names = c("label", "x", "y"))
qplot(x=x, y=y, colour=label, data=data)
