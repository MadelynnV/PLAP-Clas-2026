# Coding Assignment 1: Madelynn VanderHoek
  
#1.	5 pts. Explain the following things about R and Rstudio: 
  # o	Where do you type code? You type the code in the RScript in the top terminal. 
  # o	Where is the output of the code? The output of the code shows up in the console. 
  # o	Where do plots show up? Plots show up in the plot tab in the bottom right section. 
  # o	What is a global environment?  The global environment is the upper right section that contains/storages all data and package that we generate through coding. 
  # o	How do you get help for a function through R studio? You can get help with a function through R-studio through the help tab in the bottom right section. 
  # o	What is an R package? An R package is a set of code scripts/functions in an R language that can be reused by individual Rstudio users. 
  # o	What is a function? An function is an object designed to perform a specific task. 
  # o	How do you find the installed and loaded packages? You can find the installed and loaded packages  in the packages tab in the bottom right section. 
  # o	What is a working directory, and how do you find it? A working directory is the path/location you are currently saving or pulling information from.
getwd() #Can be used to get your current working directory. 
  # o	What is a relative file path and how is it different than an absolute file path? 
      # Relative file path: is based on your current working directory and is ideal for projects move from one place to another. 
      # Absolute file path: Is the full address from the root directory and is ideal for individuals. 
  
#2.	2 pts. Explain the steps to start a new R project connected to a GitHub repository.
      #1. While in R studio go to file tab on the top of your page and click "New project.."
      #2. Then go to your tools tab on the top of your page and click "Global options.."
      #3. Click on the Git/SVN tab and click apply. 

#3.	3 pts. Please explain the different data classes and how they are similar and different from each other. 
 # o	Vector: an one-dimensional collection of elements that are all the same data type. 
 # o	Dataframe: Where each vector represents a column and can hold different data types. 
 # o	Matrix:a two-dimensional collection of elements that are all the same data type. 

#4.	10 pts. Complete all tasks in an R script and push it to GitHub.

 # o	Create a vector named 'z' with the values 1 to 200
vecz <- c(1:200)
 # o	Print the mean and standard deviation of z on the console
mean(vecz)
sd(vecz)
 # o	Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise.
zlog <- vecz > 30
zlog
 # o	Make a dataframe with z and zlog as columns. Name the dataframe zdf
zdf <- data.frame(vecz, zlog)
zdf
 # o	Change the column names in your new dataframe to equal “zvec” and “zlogic”
colnames(zdf) <- c("zvec", "zlogic")
zdf
 # o	Make a new column in your dataframe equal to zvec squared (i.e., z2). Call the new column zsquared. 
zdf$zsquared = vecz^2
zdf
 # o	Subset the dataframe with and without the subset() function to only include values of zsquared greater than 10 and less than 100 
zdf_zsquared <- subset(zdf, zsquared > 10 & zsquared < 100)
zdf_zsquared <- zdf[zdf$zsquared > 10 & zdf$zsquared <100,]
 # o	Subset the zdf dataframe to only include the values on row 26
zdf_row26 <- zdf[25, ]
 # o	Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zdf$zsquared[180]

#5.	3 pts. Download the Tips.csv file from Canvas. Use the read.csv() function to read the data into R using a relative file path  and so that the missing values are properly coded. **Note the missing values are reported in the data as a period (i.e., “.”). How do you know the data were read correctly? 
setwd("/Users/madelynnvanderhoek/Desktop/PLPA Class /")
read.csv("TipsR.csv")
#6.	2 pts. Annotate your code, commit the changes and push it to your GitHub repository you created last class

