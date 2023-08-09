#import the data
path <- paste("/home/bryart/Documents/R/R/R_Udemy/R-Course-HTML-Notes/",
							"R-for-Data-Science-and-Machine-Learning/",
							"Machine_Learning_with_R/", sep = "")
testPath <- paste(path,'titanic_test.csv',sep = '')
trainPath <- paste(path,'titanic_train.csv', sep = '')
testDF <- read.csv(testPath)
trainDF <- read.csv(trainPath)

#load libraries
library(Amelia)
library(ggplot2)


#check for missing data
missmap(trainDF,main = 'Missing Map', col=c('yellow','black'),legend = FALSE)
pl <- ggplot(trainDF, aes(Pclass, Age))
pl <- pl+geom_boxplot(aes(group=Pclass, fill=factor(Pclass),alpha=0.4))
pl + scale_y_continuous(breaks = seq(min(0),max(80),by=2))


#####imputation of age based on class
imputeAge <- function(age,class) {
  out <- age ##assign vect to variable to be returned
	
  for (i in seq_along(age)){

    if (is.na(age[i])) {

      if (class[i] == 1) {
        out[i] <- 37
      }else if (class[i] == 2) {
        out[i] <- 29
      }else {
        out[i] <- 24
      }
    } else {
     out[i] <- age[i]
    }
  }
	return(out)
}

trainDF$fixedAge <- imputeAge(trainDF$Age, trainDF$Pclass)
trainDF$fixedAge

