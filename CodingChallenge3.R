##### Coding Challenge 3 - Advanced Vis. ###############

#1. 5pts. Using ggplot, create a boxplot of DON by Treatment so that the plot looks like the image below.
   #a. Jitter points over the boxplot and fill the points and boxplots Cultivar with two colors from the cbbPallete introduced last week.
   #b. Change the transparency of the jittered points to 0.6.
   # c. The y-axis should be labeled "DON (ppm)", and the x-axis should be left blank. 
   # d. The plot should use a classic theme
   # e. The plot should also be faceted by Cultivar

library(ggplot2)
library(tidyverse)
library(ggrepel)
library(ggpubr)
Mycotoxin <- read.csv("MycotoxinData.csv", na.strings = "na")
str(Mycotoxin)

DONbyTreatment <- ggplot(Mycotoxin, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot(position = position_dodge()) +
  geom_point(position = position_jitterdodge(0.6)) +
  ylab("DON (ppm)") +
  xlab("Treatment") +
  scale_color_manual(values = c(cbbPalette[[1]], cbbPalette[[1]])) +
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]])) +
  theme_classic() +
  facet_wrap(~Cultivar)
DONbyTreatment


#2. 4pts. Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, 
#“Fg + 40”, and “Fg + 70.

Mycotoxin$Treatment <- factor(Mycotoxin$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg +40", "Fg + 70"))

DONbyTreatment <- ggplot(Mycotoxin, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot(position = position_dodge()) +
  geom_point(position = position_jitterdodge(0.6)) +
  ylab("DON (ppm)") +
  xlab("Treatment") +
  scale_color_manual(values = c(cbbPalette[[1]], cbbPalette[[1]])) +
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]])) +
  theme_classic() +
  facet_wrap(~Cultivar)
DONbyTreatment

#3. 5pts. Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label
#should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 
#into three separate R objects 

X15ADONbyTreatment <- ggplot(Mycotoxin, aes(x = Treatment, y = X15ADON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot(position = position_dodge()) +
  geom_point(position = position_jitterdodge(0.6)) +
  ylab("X15ADON (ppm)") +
  xlab("Treatment") +
  scale_color_manual(values = c(cbbPalette[[1]], cbbPalette[[1]])) +
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]])) +
  theme_classic() +
  facet_wrap(~Cultivar)
X15ADONbyTreatment

MassperSeed_mgbyTreatment <- ggplot(Mycotoxin, aes(x = Treatment, y = MassperSeed_mg, color = Cultivar, fill = Cultivar)) +
  geom_boxplot(position = position_dodge()) +
  geom_point(position = position_jitterdodge(0.6)) +
  ylab("Seed Mass (mg)") +
  xlab("Treatment") +
  scale_color_manual(values = c(cbbPalette[[1]], cbbPalette[[1]])) +
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]])) +
  theme_classic() +
  facet_wrap(~Cultivar)
MassperSeed_mgbyTreatment

#4. 5pts. Use ggarrange function to combine all three figures into one with three columns and one row. 
#Set the labels for the subplots as A, B and C. Set the option common.legend = T within ggarage function. 
#What did the common.legend option do?
#a. HINT: I didn’t specifically cover this in the tutorial, but you can go to the help page for the ggarange 
#function to figure out what the common.legend option does and how to control it.

DON_X15ADON_MassperSeed <- ggarrange(
  DONbyTreatment, 
  X15ADONbyTreatment, 
  MassperSeed_mgbyTreatment, 
  labels = "auto", 
  nrow = 3, 
  ncol = 1, 
  common.legend = T
)
DON_X15ADON_MassperSeed


#5. 5pts. Use geom_pwc() to add t.test pairwise comparisons to the three plots made above.
#Save each plot as a new R object, and combine them again with ggarange as you did in question 4
# Your final lot should look somthing like this.

DONbyTreatmentt.test <- DONbyTreatment +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
DONbyTreatmentt.test

MassperSeed_mgbyTreatmentt.test <- MassperSeed_mgbyTreatment +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
MassperSeed_mgbyTreatmentt.test

X15ADONbyTreatmentt.test <- X15ADONbyTreatment +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
X15ADONbyTreatmentt.test

DON_X15ADON_MassperSeed_t.test <- ggarrange(
  DONbyTreatmentt.test, 
  X15ADONbyTreatmentt.test, 
  MassperSeed_mgbyTreatmentt.test, 
  labels = "auto", 
  nrow = 3, 
  ncol = 1, 
  common.legend = T
)
DON_X15ADON_MassperSeed_t.test

#6. Annotate your code, push it to Guthub. Provide me a link to your GitHub. 
