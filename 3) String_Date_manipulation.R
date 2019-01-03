##-----------------------------------------------------------
## Set working directory
##-----------------------------------------------------------

setwd("E:\\R Training Learnbay\\Week 3 classes")

##-----------------------------------------------------------
## Load required libraries
##-----------------------------------------------------------

library(dplyr)

#####-----------------------------------------------------------------------------
###String manipulation
#####--------------------------------------------------------------------------------

MyName <- c("Sam","Johnson")
Action <- "is learning R"

is.character(Action)
is.character(MyName)

#Element wise execution
paste(MyName,Action)

##########paste()---------------
paste(MyName[1],MyName[2],Action)
paste(MyName[1],MyName[2],Action,sep="")
paste(MyName[1],MyName[2],sep="_")
paste(MyName[1],MyName[2],sep="is weirdly")

##############print()---------
print("Hello World")
print(MyName)
print(MyName,quote=F)
print("Hello World",quote=FALSE)

####noquote()------------
noquote ("Hello World")

####cat()-------------- Concantenates and prints without quotes
cat("Result of addition","R training",sep="")
cat("Result of addition","R training")
cat("Hello World")

cat("1","5")

a <- c(1,2,3,4,5,6,7,8)
b <- as.character(a)
print(b)
cat(b)
################toString()----
#converts an R object into character string
c <- toString(b)
c

###format()---------------
format(13.7,nsmall=2) #nsmall - THe no of digits to the right side of the decimal
format(13.7,nsmall=4)
format(13.5,digits=2) 
format(13.5,digits=3)   #digits- How many significant digits to be used

#############Basic text manipulation----------------
String1<-"THiS iS a VeRy WeiRd StrInG, PlEaSe MaKe It BeTteR"
vector1<-c("THiS","iS","a","VeRy", "WeiRd StrInG", "PlEaSe MaKe","It BeTteR")

###nchar() & length()---
nchar(String1)  #Spaces and commas are also counted
length(String1)
nchar(vector1)    #Element wise operation as vector1 is a character vector.
length(vector1)

#########tolower()  & toupper()--------------
tolower(String1)  #Converting everything to lower case
toupper(String1)   #Coverting everything to upper case
toupper(vector1)

#####chartr()  
#chartr(old,new,x)
x <- "MiXeD cAsE 123"
chartr("i", "w", x)  #Replacing a particular character by a particular character
chartr("i","a",vector1)
chartr("iXs", "why", x)   

###substr()----------
vector1
substr(vector1, 2, 5)  #to keep only charaters from 2 to 5 in the vector1
String1<-"THiS iS a VeRy WeiRd StrInG, PlEaSe MaKe It BeTteR"
String1
substr(String1,2,4) <- "yo"
String1

#sub() & gsub()---------------
#sub(pattern,replacement,x)
x <- c("This is a sentence about axis","A second pattern is also listed here")

gsub("is", "XY", x)  #Performs the replacement of all matches
sub("is", "XY", x)   #Performs replacement of the first match
x <- "a'b c"
x <- gsub("'", "", x)
x <- gsub(" ", "_", x)

###------------------------------------------------------------
### Date functions in R 
###------------------------------------------------------------

date()  		# Current date and time

Sys.Date()		# Current date

Sys.time()		# Current date and time with time zone

format(Sys.time(), "%A %B %d, %X %Y")	# Date and time in user defined format

###------------------------------------------------------------
### Read in the input data
###------------------------------------------------------------

trans <- read.table(file = "TransactionMaster.csv", sep = ",",
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c("NA", ""))

str(trans)
#Service date column is being read as character

###------------------------------------------------------------
### Date manipulations in R
### Symbol          Meaning
### %d              Days as number (01-31)
### %a              Weekday - Mon
### %A              Weekday - Monday
### %m              Month as number (01-12)
### %b              Month - Jan
### %B              Month - January
### %y              Year - 2 digit (07)
### %Y              Year - 4 digit (2007)
###------------------------------------------------------------

# Check the date formats
class(trans$Invoice_Date)
class(trans$Service_Date)

# Convert to date format
trans$InvDate <- as.Date(trans$Invoice_Date, format = "%d-%b-%y")

#The default way of dates in R is %Y-%m-%d.So, as.Date converts the charater date columns in the standard format

str(trans)

head(trans)

class(trans$InvDate)   # Date Class

class(trans$Invoice_Date)  # Character Class

#Months function
months(trans$InvDate[1])      # Display months in words

#weekdays function
weekdays(trans$InvDate[1])    # Display weekdays in words

#year function is available in lubridate library
library(lubridate)
year(trans$InvDate[1])

#We can use these functions only on date format.

###------------------------------------------------------------
### Datetime manipulations in R
###------------------------------------------------------------

min(trans$InvDate)  # 5 January 2004
max(trans$InvDate)   #31 Dec 2004
mean(trans$InvDate) 

min(trans$Invoice_Date)  # 1 april 2004- Just on the basis of characters ordering
max(trans$Invoice_Date)  # 9 sept 2004 
mean(trans$Invoice_Date)  #Error/Warning 


