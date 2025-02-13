# the following exercises are a test in disguise. 
# can you think of any improvements to the following code?
# go through the exercises and answer them while fixing issues and improving on code workflow
# make a Rmarkdown (or Quarto) version of this document with your responses 
# render the document in PDF and HTML formats

rm(list=ls()) 

 install.packages("tidyverse") 
 

library(tidyverse)

## PROBLEM 1 ##

visualizing your data is important!
summary statistics can be highly misleading, and simply plotting the data can reveal a lot more!
Lets look at the Anscombe’s Quartet data. There are four different data sets.
Anscombe, F. J. (1973). "Graphs in Statistical Analysis". American Statistician. 27 (1): 17–21. doi:10.1080/00031305.1973.10478966. JSTOR 2682899.

anscombe_quartet = readRDS("anscombe quartet.rds")

# let's explore the dataset 
str(anscombe_quartet)

# what does the function str() do? 
##It shows us the elements in a dataset. In this case it shows us the values under each character.

# let's check some summary statistics:

anscombe_quartet %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )

# what do the summary statistics tell us about the different datasets? 
##The four datasets have same mean values but the ranges of values are very different

# let's plot the data with ggplot:

require(ggplot2)

library(ggplot2)
p1 <- ggplot(anscombe_quartet, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)
p1

# save as plot - PNG format
# width 5 inch, height = 5 inch for paper


# what do the plots tell us about the different datasets? 
# describe the relationship between x and y in the different datasets. 

# would linear regression be an appropriate statistical model to analyse the x-y relationship in each dataset?

# what conclusions can you draw for the plots and summary statistics? 




## PROBLEM 2 ##

#(adapt code from problem 1 if encessary)

# load in the datasaurus dataset
datasaurus_dozen = readRDS("WEEK5/files_week5/datasaurus_dozen.rds")

# explore the different datasets in datasaurus_dozen 
str(datasaurus_dozen)
# print descriptive statistics and make a nicely formatted table
datasaurus_dozen %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )
# calculate the correlations for x and y (Done in the last step already though)
datasaurus_dozen %>%
  group_by(dataset) %>%
  summarise(cor(x, y))
# Plot their relationships including the line of best fit.
p2 <- ggplot(datasaurus_dozen, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)
p2
##Ohh I get it. It's the dataset showing how datasets with same means can be super different.
# save the plot 


