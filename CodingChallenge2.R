########## Coding Challenge 2: Data Visualization 1 ##############

#####PLEASE READ THIS BEFORE CONTINUING#####
#This assignment is designed to help you visualize data in R and practice your R coding skills. You
#may collaborate with a partner to enhance your learning experience. Please ensure the following:
  # • Code Submission: Submit your R code in an .R or .Rmd file by sharing a link to your GitHub repository.

#####Data description#####
# Here, we will analyze mycotoxin data collected from wheat heads grown in the greenhouse
# inoculated with Fusarium graminearum (Fg) with or without fungal endophytes to protect against Fg. 
# The experiment was performed by inoculating the heads with Fg (positive control), Fg + 1 of
#3 endophytes (Fg + 40, Fg + 70, or Fg + 37), and the non-treated control (NTC). Therefore, the
#experiment was five treatments with 6-10 technical replicates and three experimental replicates.
#The authors quantified the parts per million (ppm) of mycotoxins Deoxynivalenol (DON) and the
#variant 15ADON from the wheat grain, and this is your primary response variable. In other words,
#we are interested in knowing if the fungal endophytes could reduce the concentration of DON on
#wheat heads. This was done across two wheat cultivars, a winter wheat variety, Ambassador,
#and a spring wheat variety, Wheaton. These data are published here:
#   • Noel, Z.A., Roze, L.V., Breunig, M., Trail, F. 2022. Endophytic fungi as promising
#.   biocontrol agent to protect wheat from Fusarium graminearum head blight. Plant
#   Disease. https://doi.org/10.1094/PDIS-06-21-1253-RE
#   • The following github repository is associated with this paper: https://github.com/noelzach/EndophyteBiocontrol

############### Questions ######################
#1. 5 pts. Explain the following concepts about ggplot
     #a. What three elements do you need to produce a ggplot? 
       # You need data, aesthetices (aes()), and gemetry (geom_) that represent differnet kindds of graphs like geom_line(), geom_bar(), and geom_point(). 
     #b. What is a geom? 
       # Is a visual layer that define the type of graph for example: geom_point(), geom_line(), and geom_bar(). 
     #c. What is a facet?
       # Facet is an function that splits a single plot into multiple subplots, where each plot displays a different subset of the data.
     #d. Explain the concept of layering.
       # Layering is stacking different independent functions on top of each other to create a display of an plot.  
     #e. Where do you add x and y variables and map different shapes, colors, and other attributes to the data?
       # You add x and y varibale and may different shapes, colors, and other atteibutes to the plot in the aesthetic function (aes())
      ggplot(data = my_data, aes(x = variable_x, y = variable_y)) +
        deom_point(aes(color = variable_z)) #add color here

# 2. 4 pts. Make a boxplot using ggplot with DON as the y variable, treatment as the x
#variable, and color mapped to the wheat cultivar. Change the y label to “DON (ppm)” and make the x label blank.
Mycotoxin <- read.csv("MycotoxinData.csv")

ggplot(data = Mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(color = "black") +
  ylab("DON (ppm)") +
  xlab("")

#3. 4 pts. Now convert this data into a bar chart with standard-error error bars using the
#stat_summary() command. (hint: use position = dodge)
ggplot(Mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  stat_summary(fun = mean, geom = "col", position = position_dodge(0.9)) + 
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2, position = position_dodge(0.9)) +
  xlab("Treatment") +
  ylab("DON (ppm)")

#4. 3 pts. Add points to the foreground of the boxplot and bar chart you made in questions 2
#& 3 that show the distribution of points. Set the shape = 21 and the outline color black (hint: use jitter_dodge).
###Boxplot #####
ggplot(Mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(color = "black") +
  geom_point(aes(fill = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), shape = 21, color = "black") +
  ylab("DON (ppm)") +
  xlab("")

##### Bar chart ######
ggplot(Mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  stat_summary(fun = mean, geom = "col", position = position_dodge(0.9)) + 
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2, position = position_dodge(0.9)) +
  geom_point(aes(fill = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.9), shape = 21, color = "black") +
  xlab("Treatment") +
  ylab("DON (ppm)")

#5. 2 pts. Add a facet to the plots based on cultivar.
###### Box plot #####
  ggplot(Mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) +
    geom_boxplot(color = "black") +
    geom_point(aes(fill = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), shape = 21, color = "black") +
    facet_wrap(~Cultivar)+
    ylab("DON (ppm)") +
    xlab("")

##### Bar chart #######
  ggplot(Mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) + 
    stat_summary(fun = mean, geom = "col", position = position_dodge(0.9)) + 
    stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2, position = position_dodge(0.9)) +
    geom_point(aes(fill = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.9), shape = 21, color = "black") +
    facet_wrap(~Cultivar)
    xlab("Treatment") +
    ylab("DON (ppm)")
  
#6. 3 pts. Add transparency to the points so you can still see the boxplot or bar in the background.
#(there is an example of the final plot to check with in the assignment on canvas)

 ##### Blox Plot###
    ggplot(Mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) +
      geom_boxplot(color = "black") +
      geom_point(aes(fill = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), shape = 21, color = "black") +
      geom_point(aes(fill = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), shape = 21, color = "black", alpha = 0.6)
      facet_wrap(~Cultivar)+
      ylab("DON (ppm)") +
      xlab("") +
      theme_bw()
    
##### Bar plot #####
      ggplot(Mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) + 
        stat_summary(fun = mean, geom = "col", position = position_dodge(0.9)) + 
        stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2, position = position_dodge(0.9)) +
        geom_point(aes(fill = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.9), shape = 21, color = "black") +
        geom_point(aes(fill = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.9), shape = 21, color = "black", alpha = 0.5)
        facet_wrap(~Cultivar)
        xlab("Treatment") +
        ylab("DON (ppm)") +
        theme_bw()


#7. 4 pts. Annotate your code and push it to github.

###############################################
