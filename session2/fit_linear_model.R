## Script to estimate the model parameters using a linear approximation

# installing and loading dplyr package into the library

install.packages("dplyr")
library(dplyr)

# reading in the experiment.csv file and allocating it as the object growth_data

growth_data <- read.csv("experiment.csv")

## Case 1. K >> N0, t is small

# t is small - therefore looking at data points where t < 1400 (prior to start of exponential growth curve)
# using N_log (log(N)) in place of N

data_subset1 <- growth_data %>% filter(t<1400) %>% mutate(N_log = log(N))

# creating a linear model with response variable log(N) and explanatory variable t, sing data_subset1 so t<1400

model1 <- lm(N_log ~ t, data_subset1)
summary(model1) # used to obtain the parameter estimates for the slopes and intercepts of the linear model

## Case 2. N(t) = K

# creating a new object, but now with high values of t such that N is at carrying capacity (k)
# not using log(N)

data_subset2 <- growth_data %>% filter(t>2500)

# N is set to 1 as t is large and N is modeled as a constant (representing progression towards carrying capacity)
model2 <- lm(N ~ 1, data_subset2)
summary(model2)

sink(file = "package-versions.txt")
sessionInfo()
sink()
