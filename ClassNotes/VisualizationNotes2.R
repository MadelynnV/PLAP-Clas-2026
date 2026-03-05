############ Homework: Coding Notes Data Visualization Part 2 ############

library(tidyverse)
library(ggpubr)
library(ggrepel)

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = "na")
sample.data.bac

sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels = c("Soil", "Cotton", "Soybean"))
str(sample.data.bac)

### Bacterial Evenness, Firgure B #####
bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, color = Crop)) +
  geom_boxplot(position = position_dodge()) +
  geom_point(position = position_jitterdodge(0.05)) +
  ylab("Pielou's evenness") +
  xlab("Time") +
  scale_color_manual(values = cbbPalette) +
  theme_classic()
bac.even

##### Figure A ########
sample.data.bac.no.soil <- subset(sample.data.bac, Crop != "Soil")

water.imbibed <- ggplot(sample.data.bac.no.soil, aes(Time_Point, 100 * Water_Imbibed, color = Crop)) +
  geom_jitter(width = 0.5, alpha = 0.5) + # add jitter points to show individual oints with some transparency 
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  xlab("Hours post sowing") +
  ylab("Water Imbibed (mg)") +
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("", "")) +
  theme_classic() +
  theme(strip.background = element_blank(), legend.position = "none") +
  facet_wrap(~Crop, scales = "free")
water.imbibed
  
##### Figure C #####
water.imbibed.cor <- ggplot(sample.data.bac.no.soil, aes(y = even, x = 1000 * Water_Imbibed, color = Crop)) +
  geom_point(aes(shape = Time_Point)) +
  geom_smooth(se = FALSE, method = lm) +
  xlab("Water Imbibed (mg)") +
  ylab("Pielou's evenness") +
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("Cotton", "Soybean")) +
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("o hrs", "6 hrs", "12hrs", "18 hrs")) +
  theme_classic() +
  theme(strip.background = element_blank(), legend.position = "none") +
  facet_wrap(~Crop, scales = "free")
water.imbibed.cor


##### Final Figure ####

#Arrange mutiple ggplot objects into a single firgure 
firgure2 <- ggarrange(
  water.imbibed, 
  bac.even, 
  water.imbibed.cor, 
  labels = "auto", 
  nrow = 3, 
  ncol = 1, 
  legend = FALSE
)
firgure2


#### Integrate basic statistics into plots######
# usually do this first to find patterns in the data then do real statistics with linear models, 
#generalized linear model, ANOVAs, correlations, etc.

bac.even +
  stat_compare_means(method = "anova") #apply an anvoa to the group

#comparing all treatment against each other (giving p-values)
bac.even +
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.format")

#last plot but with * as signifiance levels
bac.even +
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.signif")

# combined pvalue and * to indicate signifiance
bac.even +
  geom_pwc(aes(group = Crop), method = "t_test", label = "{p.adj.format}{p.adj.signif}")


##### Display correlation data####

water.imbibed.cor +
  stat_cor()


water.imbibed.cor +
  stat_cor(label.y = 0.7) +
  stat_regline_equation()


#### Specific point labeling ####
diff_abund <- read_csv("diff_abund.csv")
str(diff_abund)

## make a volcano plot
diff_abund$log10_pvalue <- -log10(diff_abund$p_CropSoybean)
diff_abund_label <- diff_abund[diff_abund$log10_pvalue > 30,] 

## make the plot 
ggplot() +
  geom_point(data = diff_abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) +
  theme_classic() +
  geom_text_repel(data = diff_abund_label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label))

# add in with out color palette
volcano <- ggplot() +
  geom_point(data = diff_abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) +
  geom_text_repel(data = diff_abund_label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) +
  scale_color_manual(values = cbbPalette, name = "Significant") +
  theme_classic() +
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value") 
volcano

# emphasize certain points as a different shape or color 

volcano <- ggplot() +
  geom_point(data = diff_abund, aes(x = lfc_CropSoybean, y = log10_pvalue)) +
  geom_point(data = diff_abund_label, aes(x = lfc_CropSoybean, y = log10_pvalue), color = "red", shape = 17, size = 4) +
  geom_text_repel(data = diff_abund_label, aes(x = lfc_CropSoybean, y = log10_pvalue, label = Label), color = "red") +
  theme_classic() +
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value") 
volcano


