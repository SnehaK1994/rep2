##-----------------------------------------------------------
## Set working directory
##-----------------------------------------------------------

setwd("E:\\R Training Learnbay\\Week 3 classes")

##-----------------------------------------------------------
## Load required libraries
##-----------------------------------------------------------

library(MASS)              # for stepAIC()
library(Hmisc)             # for describe(), rcorr(), ggplot2
library(pastecs)           # for stat.desc()
library(gmodels)           # for CrossTable()

###------------------------------------------------------------
### Data Read
###------------------------------------------------------------

world <- read.csv("worldbank.csv",stringsAsFactors = F)

###------------------------------------------------------------
### Check the variables 
###------------------------------------------------------------

str(world)

###------------------------------------------------------------
### Univariate Analysis:
###------------------------------------------------------------

# Generate summary statistics
summary(world)

summary(world$energy_use_percapita)

###------------------------------------------------------------
### Frequency distribution for categorical data
###------------------------------------------------------------

table(world$deathCat)

table(world$birthCat, world$deathCat)

######---------------------------------------------------------
###### Generate histograms to check distributions
#########-----------------------------------------------

hist(world$gni_per_capita, col = "brown",         #col is the colour to fill the bars 
     main = "Histogram on GNI Per Capita",        #To set the title of the histogram
     xlab = "Gross National Income Per Capita",   #x axis name(x label)
     ylab = "Frequency",                          #y axis name (y label)
     breaks=10                                   #To specify the bin width.So,the x axis is getting broken in 10 points
     #plot=FALSE                         
     #freq=F                                    #Freq=F turns it into a probability density function
     #prob=T                                    #prob=T is same as freq=F
     #xlim=                                     #To set limit on x axis
     #ylim=                                    #To set limit on y axis
     )  

hist(world$gni_per_capita)                      #Takes the by default values

###################-----------------------------------------
##############Stem and leaf plot
#########---------------------------------------------------

#A Stem and Leaf Plot is a special table where each data value is split into 
#a "stem" (the first digit or digits) and a "leaf" (usually the last digit)
#The "stem" is used to group the scores and each "leaf" shows the individual scores within each group

stem(world$death_rate
     #scale = 2      #Scale parameter can be used to increase the scale.Hence no os stem increases
     )
############################-------------------
# BoxPlot 
#########---------------------------------------

#Function for finding the quartile values...25th ,50th (median) , 75th and 100th percentile
quantile(world$birth_rate,probs=c(0,.25,.5,.75,1))

#Function to find interquartile range(75th percentile - 25th percentile)
IQR(world$birth_rate)    

#Range - Min and maximum value
range(world$birth_rate)

boxplot(world$birth_rate, 
        ylab="Birth Rate",
        col = "darkred",
        #plot=F
        main = "Box Plot on Birth Rate")

#Plotting multiple box plots by a categorical variable
boxplot(world$birth_rate ~ world$birthCat, 
        ylab="Birth Rate",
        col = "darkred",
        main = "Box Plot on Birth Rate",
        xlab = "Birth Rate Category")

boxplot(world$birth_rate[world$birthCat=="High"], world$birth_rate[world$birthCat=="Low"],
        ylab="Birth Rate",
        col = "darkred",
        main = "Box Plot on Birth Rate",
        xlab = "Birth Rate Category"
        )

########------------------------------------------------
#### Bar chart and pie chart----------------------
######----------------------------------------------
count_1 <- table(world$birthCat)

#Bar chart
barplot(count_1,
        main="TITLE",
        xlab="Birth_Cat",
        ylab="Number"
        #las=1                      #las parameter is used for letting the y axis labels appear horizantally
        )

#Pie chart
pie(count_1,main="TItle here")

#Stacked bar chart
count_2 <-table(world$birthCat,world$gni_hi_ind)
count_2

#R's default is to produce stacked bar chart
barplot(count_2)

#We can change to clustered bar chart
barplot(count_2,beside = T)
barplot(count_2,beside = T,
        main="birth Cat & gni",
        xlab="gni",
        ylab="birth Cat",
        legend.text = c("High","Low"),
        las=1)


###------------------------------------------------------------
###  Using plot function
###------------------------------------------------------------

library(Hmisc)
# Check relationships- Calculating correlation factor-Pearson's correlation factor
cor(world$birth_rate, 
     world$gni_per_capita)

#Graphically examine relationship between birth rate nad gni_per_capita
plot(world$birth_rate,         #1st variable will be on x axis
     world$gni_per_capita)     #2nd variable will be on y axis

plot(world$birth_rate, 
     world$gni_per_capita, 
     main = "Correlation",
     xlab = "Birth Rate", 
     ylab = "GNI Per Capita", 
     col = "brown",                       #Colour of the dots
     cex=1,                               #Size of the plotting character
     pch=20                               #TYpe of plotting character
     )

plot(world$birth_rate[world$birthCat=="High"], 
     world$gni_per_capita[world$birthCat=="High"], 
     main = "Correlation",
     xlab = "Birth Rate", 
     ylab = "GNI Per Capita", 
     col = "brown",                       
     cex=1,                               
     pch=20                             
)

#Further modifications that can be added 
#cex.main=1.5                    #Changing size of main title
#cex.lab=1.5                      #Changing size of x & y labels
#cex.axis=.7                      #chaning size of x & y values
#font.main=3                      #Changing font type of main
#col.main                         #Changing the colours
#col.lab
#col.axis
#pch="w"                          #w will be used as plotting character

#Adding text into the plot 
text( x= 30,                  #X co-ordinate
      y= 100000,              #Y co-ordinate
      label="Adding text",    #Text
      cex=1,                  #Size of text
      col="brown",            #Colour of text
      font=4                  #Font of text
)

###------------------------------------------------------------
###  Plotting with qplot(quick plot)- comes under ggplot2
###------------------------------------------------------------

data(diamonds)
dsmall <- diamonds[sample(nrow(diamonds), 100), ] #Randomly sampling 100 rows

###------------------------------------------------------------
### Scatterplots
###------------------------------------------------------------

qplot(x=carat, y=price, data=dsmall)

# Plots with colors
qplot(carat, price, data = dsmall, colour = "brown")


# geom - describes the type of object that is used to 
# display the data
# 'point' - produce scatter plot
# 'boxplot' - produce box and whiskers plot
# 'bar' - bar chart

qplot(carat, price, data = dsmall, geom = c("point"))

###------------------------------------------------------------
### Boxplots using qplot
###------------------------------------------------------------

qplot(x = birthCat, y = birth_rate, data = world, 
      geom = "boxplot", 
      main="Box Plot on Birth Rate",
      xlab="Birth Rate Category", ylab="Birth Rate")

###------------------------------------------------------------
### Histograms
###------------------------------------------------------------


qplot(gni_per_capita, data = world, geom = "histogram", binwidth = 10000,
      colour="brown")


###------------------------------------------------------------
### Bar plots
###------------------------------------------------------------

qplot(birthCat, data = world, geom = "bar", fill = I('brown'),
      main = "TITLE")


