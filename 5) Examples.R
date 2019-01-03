############################## Factorial ################################################################

# take input from the user
num = as.integer(readline(prompt="Enter a number: "))
factorial = 1

# check is the number is negative, positive or zero
if(num < 0) {
  print("Sorry, factorial does not exist for negative numbers")
} else if(num == 0) {
  print("The factorial of 0 is 1")
} else {
  for(i in 1:num) {
    factorial = factorial * i
  }
  print(paste("The factorial of", num ,"is",factorial))
}

# Program to find the multiplication table (from 1 to 10) of a number input by the user

# take input from the user
num = as.integer(readline(prompt = "Enter a number: "))

# use for loop to iterate 10 times
for(i in 1:10) {
  print(paste(num,'x', i, '=', num*i))
}

# Program to check if the input number is odd or even. A number is even if division
# by 2 give a remainder of 0. If remainder is 1, it is odd.

num = as.integer(readline(prompt="Enter a number: "))
if((num %% 2) == 0) {
  print(paste(num,"is Even"))
} else {
  print(paste(num,"is Odd"))
}

# In this program, we input a number check if the number is positive or negative or zero and display
# an appropriate message



num = as.double(readline(prompt="Enter a number: "))
if(num > 0) {
  print("Positive number")
} else {
  if(num == 0) {
    print("Zero")
  } else {
    print("Negative number")
  }
}

############# Sum of Natural Numbers ###############################################################


# take input from the user
num = as.integer(readline(prompt = "Enter a number: "))

if(num < 0) {
  print("Enter a positive number")
} else {
  sum = 0
  
  # use while loop to iterate until zero
  while(num > 0) {
    sum = sum + num
    num = num - 1
  }
  
  print(paste("The sum is", sum))
}

