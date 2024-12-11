## logistic_growth

## R script to plot a reproducible analysis of logistic growth

# installing and loading ggplot2 package into the library

install.packages("ggplot2") 
library(ggplot2)

# reading in experiment file in .csv format

growth_data <- read.csv("experiment.csv") 


## Plotting time against population size

ggplot(aes(t,N), data = growth_data) + # Plotting time (t) and population size (N) on the x and y axes, respectively
  
  geom_point() + # Plotting individual data points
  
  xlab("Time (min") + # adding x axis label
  
  ylab("Pop. Size (N)") + # adding y axis label
  
  theme_bw() # creating a black and white theme  

## Plotting the same data on a log scale 

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (min)") +
  
  ylab("Pop. Size (N)") +
  
  scale_y_continuous(trans='log10') + 
 
  theme_bw()

