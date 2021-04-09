#Umme Rubaiyat Chowdhury

getwd()
#Step 1 -Keep rows containing country information and remove the rest of the rows
install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
install.packages("DT")
library(DT)
install.packages("moments")
library(moments)
install.packages("ggplot2")
library(ggplot2)

raw_data = read.csv("Covid19.csv")




#Step 1: Keep rows containing country information and remove the rest of the rows.
#Apart from the country, you should not be having any other row. 
#Move on to the next step only after finishing this.

#Remove first 8 rows
clean_data = slice(raw_data, 9:n())
view (clean_data)

#Remove last 8 rows
clean_data = slice (clean_data, 1:221)
view (clean_data)


#remove first and second column
clean_data2 = clean_data[-1:-2]
view (clean_data2)


# Replace nul values with 'Na'
clean_data3 = clean_data2 %>% replace (.=="", NA)


#Step 2: Calculate the missing percentage of each column using a function.
#If any column has missing data more than 5%, 
#please remove it. (Do not try this for rows) 
na_percent = function(x){
  (sum(is.na(x))/length(x))*100
}
na_percentage = apply(clean_data3, 2, na_percent)
na_percentage = which(na_percentage>10)
na_percentage

# If any column has missing data more than 5%, please remove it.

clean_data4 = clean_data3[-na_percentage]
view(clean_data4)
str(clean_data4)

#Step 3: Give a better column name after cleaning your data.

colnames(clean_data4) = c("Country", "TotalCases", "TotalDeaths", 
                          "TotalRecovered", "ActiveCases", 
                          "TotalCasesperMillionPopulation", 
                          "DeathsperMillionPopulation", 
                          "TotalTests", "TestperMillionPopulation", 
                          "Population", "Continent", "XcasepereveryXppl", 
                          "XdeathpereveryXppl", "XtestpereveryXppl")
view(clean_data4)   
str(clean_data4)

#converting variables to correct datatypes
clean_data4$Continent = as.factor(clean_data4$Continent)
# int_data = clean_data[c(2:10, 12:14)]


for (i in c(2:10, 12:14)){
  clean_data4[, i] = as.numeric(gsub(",", "", clean_data4[,i]))   
}


view(clean_data4)
str(clean_data4)
summary (clean_data4)

#STEP 3.1: Create plots for total cases, total death, 
#and total recovery. Explain with a figure for each.

boxplot(clean_data4$TotalCases)
boxplot(clean_data4$TotalDeaths)
boxplot(clean_data4$TotalRecovered)

boxplot (cbind(clean_data4$TotalCases, clean_data4$TotalDeaths, clean_data4$TotalRecovered), main = 'Cases', 
         names = c("Total cases", "Total Deaths", "Total Recover"), frame = TRUE, na.rm = TRUE)


install.packages("ggpubr")
library("ggpubr")


ggdensity(clean_data4$TotalCases, 
          main = "Density plot for Total Cases",
          xlab = "Total Cases")


ggdensity(clean_data4$TotalDeaths, 
          main = "Density plot for Total Cases",
          xlab = "Total Cases")

ggdensity(clean_data4$TotalRecovered, 
          main = "Density plot for Total Cases",
          xlab = "Total Cases")

#STEP 3.2:Create a plot to examine the correlation between total cases 
#and total population. Explain if there is any correlation between total 
#cases and total population.


plot(clean_data4$TotalCases, clean_data4$Population, type = "b")  #scatterplot
cor(clean_data4$TotalCases, clean_data4$Population, method = c("pearson"))

#STEP 3.3: Create a plot to examine the correlation between 
#Tot Cases/1M pop and total population. Explain if there 
#is any correlation between them?

plot(clean_data4$TotalCasesperMillionPopulation, clean_data4$Population, type = "b")

#STEP 3.4: Which column do you feel is better for comparison purposes, 
#total cases or TotCases/1M pop. Explain. 

#Answer: Totalcases per 1m population, as it is the average/more objective measurement. 
#Total cases is subjective, as the higher the population, the more cases there will be. 

#STEP 3.5: Create a plot to examine the correlation between total cases and total death. 
#Explain the figure.

plot(clean_data4$TotalCases, clean_data4$TotalDeaths, type = "b")
 
 
ggplot(clean_data4, aes(x = TotalCases, y = TotalDeaths ))+
  geom_point(alpha = 0.5)+ 
  stat_smooth(method = "lm", col = "black", se = FALSE)

#STEP 3.6: Create a plot to examine the correlation between total cases and Deaths/1M pop. 
#Explain the figure. Which column is more suitable to compare the result, 
#total death or Death/1Mpop?


ggplot(clean_data4, aes(x = TotalCases, y = DeathsperMillionPopulation ))+
  geom_point(alpha = 0.5)+
  stat_smooth(method = "lm", col = "red", se = FALSE)

#checking again with log values
ggplot(clean_data4, aes(y=DeathsperMillionPopulation , x=TotalCases)) +
  geom_point()  + 
  coord_fixed()+
  scale_x_log10()+
  scale_y_log10()+
  stat_smooth(method = "lm", col = "red", se = FALSE)

#Ans: There is no correlation. 
#Column of Total Death is more suitable to compare the results with Total Cases, 
#as it is a subset of it. 

#STEP 3.7: Compare Tot Cases/1M pop by continent, and explain your result. 


ggplot(clean_data4, aes(x= Continent, y= TotalCasesperMillionPopulation, fill=Continent)) +
  geom_bar(position = "dodge", stat = "identity")

#Europe has the most cases per 1m population, while Australia has the least.

#STEP 3.8: Compare Deaths/1M pop by continent, and explain your result.

ggplot(clean_data4, aes(x= Continent, y=DeathsperMillionPopulation, fill=Continent)) +
  geom_bar(position = "dodge", stat = "identity")


#Europe has the most cases per 1m population, while Australia has the least.

#STEP 3.9: Which country is best among testing the COVID19 and 
#which country is worst? There are two columns total test vs. 
#test/M. Choose appropriate column. 

sort(clean_data4$XtestpereveryXppl)
clean_data4$Country[which.max(clean_data4$XtestpereveryXppl)]
clean_data4$Country[which.min(clean_data4$XtestpereveryXppl)]

#Ans: country Yemen is the best, while UAE is the worst. 

#STEP 3.10: Compare your COVID19 test results by continent? 
#There are two columns total test vs test/M. 
#Choose appropriate column. 

ggplot(clean_data4, aes(x= Continent, y=TestperMillionPopulation, fill=Continent)) +
  geom_bar(position = "dodge", stat = "identity")

#Ans: #Europe is the best, followed by Asia, then NA, SA, Africa, and lastly Australia.

#STEP 3.11: Check if Tests/1M pop is skewed or normally distributed.

ggdensity(clean_data4$TestperMillionPopulation, 
          main = "Density plot for Test per Million Population")

summary(clean_data2$TestperMillionPopulation)
#Ans: #the mean is 448000, while the median is 191000. 

#it is skewed to the right. 
