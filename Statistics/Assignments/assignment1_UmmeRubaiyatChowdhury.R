#3. Create a vector using (15, TRUE, "World"). What happened to your result?

speed_vector <- c(15, TRUE, "World")
speed_vector
class(speed_vector)
#4. John's scores in the final semester for the three subjects are 95, 91, and 88. The subjects are Statistics,
#Linear Algebra, and Calculus. Using these create a vector and give names to all elements of the vector based on their subjects.


subjects_vector <- c("Statistics", "Linear Algebra", "Calculus")
score_vector <- c(95, 91, 88)
names(score_vector) <- subjects_vector
score_vector
#5. Please check the types (character or numeric) of the vector you created.
typeof(subjects_vector)
typeof(score_vector)
#6. You have three students in your class (choose any name you want).
#You must create a matrix using their score in the above mentioned subjects 
#(question 4) Student 1 (95, 91, and 88), Student 2(96, 94, and 97), 
#Student 3(88, 98, and 85). Create a matrix and label column and row names.


student_names <- c("Umme", "Rubaiyat", "Chowdhury")
alex_scores <- c(95, 91,88)
nia_scores <- c(96, 94,97)
robin_scores <- c(88, 98, 85)
student_scores <- c(alex_scores, nia_scores, robin_scores)
student_matrix <- matrix(student_scores, nrow=3, byrow=TRUE, dimnames = list(
  student_names, subjects_vector))
student_matrix

#7. Convert the created matrix into a data frame.

dframe <- data.frame(student_matrix)
dframe
#8. Create three vectors using five countries (your choice) from the following website. 
#The first vector should be country names, the second vector should be the total number of cases, 
#and the third vector should contain the total number of deaths. Create a data frame using these vectors. 
#https://www.worldometers.info/coronavirus/ 
countryNames <-  c("Bangladesh", "USA", "India", "Russia", "France")
totalCases <- c(588132,30639264,  11734058, 4483471, 4313073)
totalDeath <- c(8830,556891, 160477, 96219, 92908)
cov_dframe <- data.frame(countryNames, totalCases, totalDeath )
cov_dframe

#9. Please read the mtcars data set from R. It is an built-in data set.
#Please check the structure of the data set. If required, 
#please convert the data into their appropriate data types (character, 
#logical, factor, etc). Save your results as a new data frame using a new name.

data(mtcars)
str(mtcars)
sapply(mtcars, class)
newCars <- within(mtcars,{vs <- as.logical(vs)
am <- as.logical(am)
hp <- as.factor(hp) })
newCars
