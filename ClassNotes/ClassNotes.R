######### Homework: Coding Notes Data visualization 1 - 2/5/26 ##################

install.packages("tidyverse")
library(tidyverse)

mtcars
#puts axis on the plot 
ggplot(mtcars, aes(x = wt, y = mpg))

#add points on the graph 
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point()

# adds a tend line 
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() + 
  geom_smooth()

#pot the best lienar model 
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() + 
  geom_smooth(method = lm)

# gets rid of the standred error area 
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() + 
  geom_smooth(method = lm, se = FALSE)

# moving the layers around so the line does not go over the points  
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = lm, se = FALSE) +
  geom_point()

# adding x and y labels 
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = lm, se = FALSE) +
  geom_point() + 
  xlab("Weight (tons)") + 
  ylab("Miles Per Gallon")

# change the size of the points based on the weight
# when adding the size to the top of the layer it adds the size addition to ALL of the layers 
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = lm, se = FALSE) +
  geom_point(aes(size = wt)) + 
  xlab("Weight (tons)") + 
  ylab("Miles Per Gallon") +
  scale_color_gradient(low = "green", high = "grey")

#read data into repostiory 
bull.richess <- read.csv("Bull_richness.csv")

# boxplots 
ggplot(bull.richess, aes(x = GrowthStage, y = richness, fill = Fungicide, color = Crop)) +
  geom_boxplot() + 
  geom_point(position = position_jitterdodge()) + 
  scale_fill_manual(values = c("#E87722", "#0C2340"))  

# bars with SE error bars 
ggplot(bull.richess, aes(x = GrowthStage, y = richness, fill = Fungicide)) + 
  stat_summary(fun = mean, geom = "line", position = "dodge") + 
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", position = "dodge")


ggplot(bull.richess, aes(x = GrowthStage, y = richness,group = Fungicide, color = Fungicide)) + 
  stat_summary(fun = mean, geom = "line") + 
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar")

##Facetting####
ggplot(bull.richess, aes(x = GrowthStage, y = richness,group = Fungicide, color = Fungicide)) + 
  stat_summary(fun = mean, geom = "line") + 
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar") + 
  facet_wrap(~Treatment*Crop, scales = "free")







