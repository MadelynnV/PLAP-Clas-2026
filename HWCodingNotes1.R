# PLAP-Clas-2026

######## Homework 1: Coding Notes ########

# make sure when you are in putting your data into excel that you are particular 
# on the case-sensitive for titles and data entry. 

## Exercise 1 ##
# R is a big calculator 
2 + 2
2 - 2
2 / 2
2 * 2

## Exercise 2 ##
# objects 
# you can store objects/vaules/characters in R by using <- or = 
# <- is the peffered symbol
# = are usually used in functions 

x <- 2
y = 3
x + y

name <- "Madelynn"
seven <- "7"

x + seven #error when there is " " around 7 

#functions 
class(seven)
class(x)

#concatenate function: string of things 
vec <- c(1, 2, 3, 4, 5, 6, 7) 
vec <- c(1:7) # same as above
vec2 <- C("madelynn", "jill", "will")

# Built in functions 
mean(vec)
sd(vec) # standard deviation 
sum(vec)
median(vec)
min(vec)
max(vec)
summary(vec) #IQR -output depends on the data class
abs(vec) #absolute value 
sqrt(vec)
log(vec)
log10(vec)
exp(vec) # power of e 

## Logical Operators ##
# R understands: 
# >
# <
# | #or
# &
# =
# == #(exactly equal)
# >== #(greater than or equal)
# != #not equal to 

# using logical operators to fin things in objects
t <- 1:10
t[(t > 8) | (t < 5)]
t[(t > 8) & (t < 5)]
t[t != 2] 
t[!t == 2] #same thing as above
1 %in% t # asking R if a number exists within a string of numbers 

## Data Types ##

# Matrices
# is an atomic object, meaning it can only contain one data class like numeric, character, or logical 

mat1 <- matrix(data = c(1, 2, 3), nrow = 3, ncol = 3)
mat1 # output mat1 to the console 

#character matrix 
mat2 <- matrix(data = c("madelynn", "will", "jill"), nrow = 3, ncol =3)
mat2

mat1[1] # should give you 1 the first number in col 1

# dataframes 
df <- data.frame(mat1[,1], mat2[,1]) # created a dataframe with the first col of mat 1 and mat2 and all rows 
df 

#to change the colum headers of the dataframe
colnames(df) <- c("value", "name")
df

df$value[1] # use $ to access colums 
#indexing - subsetting 

df$value[df$name == "jill" ] # returns with 2 

df[df$name == "jill", ] # all returns all rows 
subset (df, name == "jill") # same thing as above

#create new column with the name "log_value" and this colum is the log of the value column
df$log_value <- log(df$value)


## istalling packages ##

install.packages("ggplot2")
install.packages("tidyverse")
install.packages("lme4")

Library(tidyverse)

## Reading data into R ##

#we can read in a .csv file with the read.csv() function by specifiying the path to the file 
getwd() #find out your working directory you are in
csv <- read.csv("pathway to your file")
view(csv)
str(csv)

git add HWCodingNotes1.R .gitignore PLAP-Class-2026.Rproj
git commit -m "Update HWCodingNotes1"
git push