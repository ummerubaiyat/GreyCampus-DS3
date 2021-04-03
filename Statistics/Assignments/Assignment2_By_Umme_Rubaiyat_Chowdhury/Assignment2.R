#Question 1: The final score of the World Cup finals of football is France  4 
#and Croatia 2. Please use a control structure to print the results as 
#Team ---- Wins -----.


France  = 4 
Croatia = 2

if(France > Croatia)
{
  print(paste("Team France Wins"))
} else{
  print(paste("Team Croatia Wins"))
}

#Question 2: The mtcars data set has several factor variables. 
#However, R is reading them as numeric. 
#Please convert them into factors using a for loop. 
#Please use column 8 to 11 for the loop.

library(readr)
data(mtcars)
mtcarsfactor <- c(8:11)
for (mtcarsfactor  in mtcarsfactor ) {
  mtcars[, mtcarsfactor ] <- as.factor(mtcars[, mtcarsfactor ])
}
str(mtcars)

#You will receive a data set (Dataset 2.1). 
#This data set is a subset of a real data set.


library(readxl)
dataset<-read_excel("Dataset - 2.1.xlsx")
View(dataset) 
#Question 3: Write a function to get the percentage of NAs in each column.
library(tidyverse)
colMeans(is.na(dataset))
#means <- dataset%>% summarize_all(funs(sum(is.na(.)) / length(.)))


#Question 4: Write a function to get the percentage of NAs in each row.
rowMeans(is.na(dataset))

#Question 5: Write a function to get a summary of numeric columns (use the summary function)
#such as THC, CO, CO2, and so on in the data set. With the same function, 
#try to generate box plot using base R.

boxplot(dataset$THC)
boxplot(dataset$CO)
boxplot(dataset$CO2)

#Question 6: Write a function to create histograms of numeric columns, 
#such as THC, CO, CO2, and so on in the data set. Use ggpot2 to generate figures.

library(ggplot2)
ggplot(dataset, aes(x=THC)) + geom_histogram()
ggplot(dataset, aes(x=CO)) + geom_histogram()                                  


#Question 7: The data set contains date columns. 
#All of these date columns are untidy. 
#Please create a better formatted data set. 
#The date should be dd/mm/yyyy in the final format. 
#Use columns 2, 3, and 5 only.

dataset2.2 <- read_csv("Data set - 2.2.csv")
dates <- c(2,3,5,8)
for (dates  in dates ) {
  dataset2.2[, dates ] <- as.Date(dataset2.2[dates ],format, tryFormats = ( "%d/%m/%Y"))
}
?as.Date

#Question 8: The date of birth column contains months in string format.
#Please create a tidy data column with months in numeric format.
#Now your data should be similar to the previous question.


#Question 9: Convert all dates into date format; 
#they are currently in character variable format.

dates <- as.Date(dataset2.2, "%m/%d/%Y")
