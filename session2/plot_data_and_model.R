## Script to plot data and model

# reading in the experiment.csv file and allocating it as the object growth_data

growth_data <- read.csv("experiment.csv")

# creating a function: inputting a specific t value will output corresponding N value using specified values of K and r

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

# defining function parameters
N0 <- 879 #obtained from experiment.csv data at time t=0
  
r <- 0.0100086 # obtained from model 1 summary output, presents the coefficient of t
  
K <- 6.00e+10 # obtained form model 2 summary output, presents the intercept 

# creating a graph using the logistic model
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')

sink(file = "package-versions.txt")
sessionInfo()
sink()

