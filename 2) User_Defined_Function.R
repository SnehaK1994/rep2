############################### Functions ##################################################
#Syntax:
#function_name <- function(arg_1, arg_2, ...) {
#  Function body 
#}

#Defining a function 
#First the function body needs to be executed.Then only , we can call that function.
my_fun <- function(arg1,arg2)
{
  new_var <- max(arg1,arg2)
  return(new_var)
}

#Calling the function
my_fun(27,41)
my_fun(27,10)

##-----------------------------------------------------------
## Write a function in R to count the number of odd integers
##-----------------------------------------------------------

#Passing a numeric vector as the argument

oddcount <- function(x) {
  k <- 0  ## Assign the value 0 to k
  for (n in x) {  ## Start a FOR loop for every element in x
    
    if (n %% 2 == 1) k <- k + 1  ## %% is a modulo operator
  }
  return(k)
}

#Calling a function
oddcount(c(1,2,3,5,7,9,14))

##-----------------------------------------------------------
## A different way of writing the above function
##-----------------------------------------------------------

oddcount2 <- function(x) {
  k <- 0  ## Assign the value 0 to k
  for (i in 1:length(x)) {  ## The length function gives number of elements in x
    if (x[i] %% 2 == 1) k <- k + 1  ## %% is a modulo operator
  }
  return(k)
}
oddcount2(c(1,2,3,5,7,9,14))

# Create a function to print squares of numbers in sequence.
new.function <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}	
# Call the function new.function supplying 6 as an argument.
new.function(6)

#################################-----------------------
# Create a function without an argument.
new.function <- function() {
  for(i in 1:5) {
    print(i^2)
  }
}	

# Call the function without supplying an argument.
new.function()

#################################################################################################

# Create a function with arguments.
new.function <- function(a,b,c) {
  result <- a * b + c
  print(result)
}

# Call the function by position of arguments.
new.function(5,3,11)

# Call the function by names of the arguments.
new.function(a = 11, b = 5, c = 3)


#-----------------------------------------------------------------
#########Create a function with default values in arguments
#------------------------------------------------------------------
new.function <- function(a = 3, b = 6) {
  result <- a * b
  print(result)
}

# Call the function without giving any argument.
new.function()

# Call the function with giving new values of the argument.The parametric values in function gets overwritten.
new.function(9,5)

#Alternate way of declaring function with default paratmeters
new.function_1 <- function(a = 3, b = NULL) {
  if(is.null(b))
    b <- 1
  result <- a * b
  print(result)
}

new.function_1(5,3)
new.function_1(10)

###############Returning multiple values from a function using return##########
####
my_fun <- function(arg1,arg2)
{
  new_var <- max(arg1,arg2)
  new_var_1 <- arg1+arg2
  return(list(new_var,new_var_1))
}

a <- my_fun(10,20)

###
my_fun <- function(arg1,arg2)
{
  new_var <- max(arg1,arg2)
  new_var_1 <- arg1+arg2
  return(c(new_var,new_var_1))
}

b <- my_fun(10,20)


