#############Apply family########------------------------------------------------


setwd("E:\\R Training Learnbay\\Week 3 classes")
trans <- read.table(file = "TransactionMaster.csv", sep = ",",
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c("NA", ""))
###--------------------------------------------------------------------------------------
################################lapply--------------
###------------------------------------------------------------------------------------------
#l stands for list
#The output of lapply is a list
#Syntax lapply(X,FUN)
#X A vector or an object.FUN applied to each element of X
#It doesn't need margin

library(plyr)
movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower) #The result gets returned in a list format.Using tolower() function
movies_lower
str(movies_lower)

abc <- c(1,2,3,4) 
abc_char <- lapply(abc,as.character)
abc_char
str(abc_char)
lapply(abc,is.character)
lapply(abc,is.numeric)

emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  stringsAsFactors = FALSE
)

###To check whether columns are numeric or not 
a <- lapply(emp.data,is.numeric)
a
rm(abc,abc_char,movies_lower,a)

##unlist() function- TO convert list to vector
movies_lower <- unlist(movies_lower)

x = data.frame(a=c(1,2,3),b=c(10,20,30),c=c(11,9,18),stringsAsFactors = F)
lapply (x,length)            #The result gets returned in a list format.Using length() function

lapply (x,sum)               #Using sum() function

x_1 = data.frame(a=c(1,2,3),b=c(10,20,30),c=c("a","b","c"),stringsAsFactors = F)
lapply (x_1,length)
lapply (x_1,sum)  #Throw an error.As characters can't be summed

#-----------------------------------------------------------------------------------
#####################sapply-------------
#-----------------------------------------------------------------------------------
#Sapply does the same job as lapply but returns a vector

movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-sapply(movies, tolower) #The result gets returned in a vector format.Using tolower() function

x = data.frame(a=c(1,2,3),b=c(10,20,30),c=c(11,9,18),stringsAsFactors = F)
sapply (x,length)            #The result gets returned in a vector format.Using length() function

sapply (x,sum)               #Using sum() function

x_1 = data.frame(a=c(1,2,3),b=c(10,20,30),c=c("a","b","c"),stringsAsFactors = F)
sapply (x_1,length)
sapply (x_1,sum)  #Throw an error.As characters can't be summed

#-----------------------------------------------------------------------------
############Subsetting based on column########################################
#-----------------------------------------------------------------------------
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  stringsAsFactors = FALSE
)
sapply(emp.data,is.numeric)

##### Find out only numeric columns from a data set
temp <- emp.data[,sapply(emp.data,is.numeric)]

#Finding which all columns have NA
sapply(trans,function(x)sum(is.na(x)))

#------------------------------------------------------------------------------------
###################vapply################################
#-------------------------------------------------------------------------------------
#vapply(x,FUN,FUN.VALUE,...)
#similar to sapply, but has a prespecified type of return value, so it is can be safer and faster

x <-  list(a=1,b=1:3,c=10:100) 
vapply(x,FUN=length,FUN.VALUE = 0)   #Fun value specifies that return value is a integer
vapply(x,FUN=length,FUN.VALUE = 2)
vapply(x,FUN=length,FUN.VALUE = "a")   #Error.R was told that the return type will be charcter but it was actually int

rm(x,x_1,temp)

##-----------------------------------------------------------------------------
###################apply-------------------
##-----------------------------------------------------------------------------
#apply(x,margin,FUN,...)
#MARGIN is a variable defining how the function is applied: when MARGIN=1, it applies over rows, 
#whereas with MARGIN=2, it works over columns. 
#Noticeably, with the construct MARGIN=c(1,2) it applies to both rows and columns
#FUN is the function we want to apply and can be any R function, including a User Defined Function

x = data.frame(a=c(1,2,3),b=c(10,20,30),c=c(11,9,18),stringsAsFactors = F)
x

apply(x,2,sum)
apply(x,1,sum)

#Some shortcut functions---------------------------------
rowSums(x)   #Same as apply(x,1,sum)
rowMeans(x)  #Same as apply(x,1,mean)
colSums(x)   #Same as apply(x,2,sum)
colMeans(x)  #Same as apply(x,2,mean)


###########Using apply function only on specific columns
apply(x[c(1,2)],2,sum,na.rm=T)

#Difference between sapply and apply
#1) Sapply casts the data frame to a list before operating on it, 
#2) Apply casts the data frame to a matrix.
     #Since matrices cannot have mixed types and there is at least one column with non-numeric data (Species), 
     #Then everything becomes character data


