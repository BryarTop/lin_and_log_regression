#first, load the data
path <- '/home/bryart/Documents/R/R/R_Udemy/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine Learning with R/'
fullpath <- paste(path, "student-mat.csv",sep = "")
dFrame <- read.csv2(fullpath, sep = ";")


#second, inspect the data
View(dFrame) #view the df in a separate window
head(dFrame) #look at the first few rows
summary(dFrame) #statistically summarize the df
any(is.na(dFrame)) #check for null values
str(dFrame) #check structure


#third, load applicable libraries
library(dplyr)
library(ggplot2)
library(GGally)
library(ggthemes)
library(corrgram)
library(corrplot)


#fourth,extract indeces of numberic columns into vector
numCols <- sapply(dFrame, is.numeric)


#fifth, look for correlations
corData <- cor(dFrame[,numCols])

##plot the data
corData %>% corrplot(, method = 'color' )  %>%  print()

##look for other correlations with corrgram
dFrame %>% corrgram()

###add additional components to corrgram
dFrame %>% corrgram(,order = TRUE, lower.panel = panel.shade, 
										upper.panel = panel.pie, text.panel = panel.txt)


#sixth, plot the datafram in a histogram
ggplot(dFrame, aes(x=G3)) + geom_histogram(bins = 20, alpha=0.5, fill = 'blue')
