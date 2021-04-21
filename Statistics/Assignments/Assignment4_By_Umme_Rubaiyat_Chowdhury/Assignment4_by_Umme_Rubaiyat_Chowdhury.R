#Umme Rubaiyat Chowdhury
#Assignment 4

#I. Data: The World Values Survey is an ongoing worldwide survey that 
#polls the world population about perceptions of life, work, 
#family, politics, etc. The most recent phase of the survey that 
#polled 77,882 people from 57 countries estimates that 36.2% of 
#the world's population agrees with the statement "Men should have more right to a job than women." 
#The survey also estimates that 13.8% of people have a university degree or higher and 
#that 3.6% of people fit both criteria. 

#Question 1: Are agreeing with the statement "Men should have more right to a job than women" 
#and having a university degree or higher disjoint events?

Degree <- 10747
No.degree <- 67135
Agree <- 28193
Dont.Agree <- 49689
Total <- 77882
Agree.and.degree <- 2803
No.degree.and.disagree <- 41745
Agree.Unioun.Degree <- Agree + Degree - Agree.and.degree

#Probability of union of Agree and Degree
P1 <- Agree.Unioun.Degree/Total

#Probability of Agree, Degree
P2 <- (Agree/Total) + (Degree/Total)

#check if Prob(agree U degree) = Prob (Agree) + Prob(Degree)
if(P1 == P2){
  print("Yes, they are disjoin events")
}else{
  print("No, they are not disjoint events")
}


#Question 2: Draw a Venn diagram summarizing the variables and
#their associated probabilities.

#Ans:

install.packages("VennDiagram")
install.packages("grid")
install.packages("futile.logger")
library(VennDiagram)

population <- 77882
event_A <- pop*0.362
probability_event_A <- event_A/population # Probability of event A
event_B <- population*0.138
probability_event_B <- event_B/population # Probability of event B
both <- population*0.036
p_A_and_B <- both/population # Probability of A intersection B
# Plotting the Venn Diagram for both event probabilities
grid.newpage()  # Move to new plotting page
draw.pairwise.venn(area1 = probability_event_A,   # Creating a pairwise venn diagram
                   area2 = probability_event_B,
                   cross.area = p_A_and_B,
                   lty = "blank",
                   fill = c("red", "blue"),
                   category = c("A","B"))
#Question 3: What is the probability that a randomly drawn person has a 
#university degree or higher or agrees with the statement about men having 
#more right to a job than women?

#Ans:

#Probability of (Agree or Degree) = Agree + degree - intersection of Agree, Degree
Probability_A_or_B = 0.138+0.362-0.036 
View(Probability) 
#0.464


#Question 4: What percent of the world population do not have a university degree 
#and disagree with the statement about men having more right to a job than women?

#Ans:
p_not_A_and_B <- 1- Probability_A_or_B 
p_not_A_and_B * 100

##0.536

#Question 5: Does it appear that the event that someone agrees with 
#the statement is independent of the event that they have a university degree or higher?

#Ans:

#Two events are not independent if P (A and B)! = P (A)*P (B)

#Prob(A and B):
p1 <- Agree.and.degree/Total

#Prob(A):
Prob.Agree <- Agree/Total

#Prob(B):
Prob.Degree <- Degree/Total

p2 <- Prob.Agree * Prob.Degree

#If true: Prob(Agree and Degree) = Prob(Agree) x Prob(Degree)
if(p1 == p2){
  print("Yes, they are independent events")
}else{
  print("No, they are not independent events")
}
#"No, they are not independent events"

#Question 6: What is the probability that at least 1 in 5 randomly selected 
#people to agree with the statement about men having more right to a job than women?

#Ans:

# P (no one agree) <- 1 - P(agree)
                   #= 1 - 0.362 
                    #= 0.638

#P (at least one agrees) <-1- P (none agree) 
                         #= 1 - 0. 6385 
                        #= 0.894


##II. Data: As of 2009, Swaziland had the highest HIV prevalence in the world.
#25.9% of this country's population is infected with HIV. The ELISA test is 
#one of the first and most accurate tests for HIV. For those who carry HIV, 
#the ELISA test is 99.7% accurate. For those who do not carry HIV, 
#the test is 92.6% accurate. If an individual from Swaziland has tested positive,
#what is the probability that he carries HIV? Create a tree diagram to calculate the probability.


#Solution:

#Prob(HIV) = 0.259
#Prob(Not HIV) = 1-0.259 = 0.741
#Prob(Positive|HIV) = 0.997 
#Prob(Positive|Not HIV) = 0.926

#Answer: (0.259*0.997)/[(0.259*0.997)+(0.741*0.074)] = 0.824. 

#Question 1: If an individual from Swaziland has tested positive, what is the probability that he carries HIV?

#Ans:

p_HIV <- 0.259
p_not_HIV <- 1 - p_HIV
p_Positive_Given_HIV <- 0.997
p_Negative_Given_Not_HIV <- 0.926
p_Positive_Given_Not_HIV <- 1 - p_Negative_Given_Not_HIV
p_Negative_Given_HIV <- 1- p_Positive_Given_Not_HIV
p_HIV_and_Positive <- p_HIV * p_Positive_Given_HIV
p_HIV_and_Negative <- p_HIV * p_Negative_Given_HIV
p_not_HIV_and_Negative <- p_not_HIV * p_Negative_Given_Not_HIV
p_not_HIV_and_Positive <- p_not_HIV * p_Positive_Given_Not_HIV
p_Positive <- p_HIV_and_Positive + p_not_HIV_and_Positive
p_HIV_Given_Positive <- p_HIV_and_Positive / p_Positive
p_HIV_Given_Positive

#[1] 0.8248434

#Question 2: According to a 2013 Gallup poll, worldwide only 13% of employees are 
#engaged at work (psychologically committed to their jobs and likely to be making 
#positive contributions to their organizations). Among a random sample of 10 employees,
#what is the probability that 8 of them are engaged at work?

#Ans: 

# 8 is the favourable number of ppl
# 10 is total number of ppl
# 0.13 is the required probability

dbinom(8, 10, 0.13)   
#[1] 2.77842e-06

#Question 3: Recent study: "Facebook users get more than they give"

#friend requests: 40% made, 63% received at least one
#likes: liked 14 times, had their content "liked" 20 times, on average
#messages: sent 9 messages, received 12, on average
#tags:12% tagged a friend in a photo, but 35% tagged other findings:
#  25% considered power users
#average Facebook user has 245 friends
#P(70 or more power user friends) = ?
  

#Ans:
# To calculate the probability of atleast 70 or more power user friends
# we have to cover a range from 70 to 245
# dbinom (70, 245, 0.25)
# dbinom (71, 245, 0.25)
# dbinom (72, 245, 0.25)
#         :
#         :
#         :
#         :
# dbinom (245, 245, 0.25)

sum(dbinom(70:245, size = 245, p = 0.25))

#[1] 0.112763

#Question 4: According to a 2014 Gallup poll, 56% of uninsured Americans
#who plan to get health insurance say they will do so through a 
#government health insurance exchange. What is the probability that 
#in a random sample of 10 people exactly 6 plan to get health insurance 
#through a government health insurance exchange?


#Ans:

dbinom(6, size =  10, p= 0.56)
#[1] 0.2427494
 
 