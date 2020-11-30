
# Hello World
# -----------------------------
# Chapter 8 Matrices and Dataframes
# -----------------------------

# -----------------------------
# Yarrr Tutorial'ski Nov'20
# -----------------------------

# -----------------------------
# Basic dataframe operations
# -----------------------------


# -----------------------------
# 8.0.a Creating the Data Frame
# -----------------------------

# Create a dataframe of boat sale data called bsale
bsale <- data.frame(name = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j"),
                    color = c("black", "green", "pink", "blue", "blue", 
                              "green", "green", "yellow", "black", "black"),
                    age = c(143, 53, 356, 23, 647, 24, 532, 43, 66, 86),
                    price = c(53, 87, 54, 66, 264, 32, 532, 58, 99, 132),
                    cost = c(52, 80, 20, 100, 189, 12, 520, 68, 80, 100),
                    stringsAsFactors = FALSE)   # Don't convert strings to factors!


# -----------------------------
# 8.0.b Exploring dataset aspects
# -----------------------------

# Explore the bsale dataset:

## head function
# Return the First or Last Part of an Object
head(bsale)     # Show me the first few rows


## 'Structure' dataframe utility function
# Compactly Display the Structure of an Arbitrary R Object
# gives a small preview simular to the environment window inside R studio
str(bsale)      # Show me the structure of the data


## View Tool
# Invoke a Data Viewer
# Spreadsheet style data viewer on a matrix like r object
View(bsale)     # Open the data in a new window


## Names of an object function
# straight forward tool 
# names (x) would be the r object
# the names function itself displays a character vector of up to the same length as x, or null
names(bsale)    # What are the names of the columns?
# [1] "name"        "color"       "age"         "price"       "cost"        "id"          "age.decades" "profit"  


## The Number of Rows/Columns of an Array 
nrow(bsale)     # How many rows are there in the data?
# [1] 10



# -----------------------------
# 8.0.c Statistics with Column Vectors
# -----------------------------
# Calculating statistics from column vectors


mean(bsale$age)       # What was the mean age?
table(bsale$color)    # How many boats were there of each color?
max(bsale$price)      # What was the maximum price?
## Results QA check
# > mean(bsale$age)       # What was the mean age?
# [1] 197.3
# > table(bsale$color)    # How many boats were there of each color?
# 
# black   blue  green   pink yellow 
# 3      2      3      1      1 
# > max(bsale$price)      # What was the maximum price?
# [1] 532


# Adding new columns
# Creating ID, ages inside decades, and profit
bsale$id <- 1:nrow(bsale)
bsale$age.decades <- bsale$age / 10
bsale$profit <- bsale$price - bsale$cost


### 8.1.c.1 Evaluate an Expression in a Data Environment 
# Evaluate an R expression in an environment constructed from data, possibly modifying (making a copy of) the original data. 

# What was the mean price of green boats?
with(bsale, mean(price[color == "green"]))
# [1] 217

# What were the names of boats older than 100 years?
with(bsale, name[age > 100])
# [1] "a" "c" "e" "g"


# What percent of black boats had a positive profit?
with(subset(bsale, color == "black"), mean(profit > 0))
# [1] 1


# Save only the price and cost columns in a new dataframe
bsale.2 <- bsale[c("price", "cost")]
# 10 observations
# 2 variables


# Change the names of the columns to "p" and "c"
names(bsale.2) <- c("p", "c")

# Create a dataframe called old.black.bsale containing only data 
#                           from black boats older than 50 years
old.black.bsale <- subset(bsale, color == "black" & age > 50)
# 3 observations
# 8 variables




# -----------------------------
# 8.1 What are matrices and dataframes?
# -----------------------------
# 
# By now, you should be comfortable with scalar and vector objects. 
# However, you may have noticed that neither object types are appropriate
# for storing lots of data – such as the results of a survey or experiment. 
# Thankfully, R has two object types that represent large data structures much better:
#                                                 matrices and dataframes.

# Matrices and dataframes are very similar to spreadsheets in Excel or data files in SPSS. 
# Every matrix or dataframe contains rows (call that number m) and columns (n). 
# Thus, wile a vector has 1 dimension (its length), 
#                              matrices and dataframes both have 2-dimensions – 
#                             representing their width and height. 
# You can think of a matrix or dataframe as a combination of n vectors, 
#                             where each vector has a length of m.


# While matrices and dataframes look very similar, they aren’t exactly the same. 
# While a matrix can contain either character or numeric columns, 
# a dataframe can contain both numeric and character columns. 
# Because dataframes are more flexible, most real-world datasets, 
# such as surveys containing both numeric (e.g.; age, response times) and 
# character (e.g.; sex, favorite movie) data, will be stored as dataframes in R.
# 
# WTF – If dataframes are more flexible than matrices, why do we use matrices at all? 
# The answer is that, because they are simpler, matrices take up less computational space than dataframes. 
# Additionally, some functions require matrices as inputs to ensure that they work correctly.
# 
# In the next section, we’ll cover the most common functions for creating matrix and dataframe objects. 
# We’ll then move on to functions that take matrices and dataframes as inputs.



# -----------------------------
# 8.2 Creating matrices and dataframes
# -----------------------------



# There are a number of ways to create your own matrix and dataframe objects in R. 
# The most common functions are presented in Table 8.1. 
# Because matrices and dataframes are just combinations of vectors, 
#     each function takes one or more vectors as inputs, 
#     and returns a matrix or a dataframe.


# Table 8.1

# Function	              Description	                      Example

##  Combine R Objects by Rows or Columns

# cbind(a, b, c)          Combine vectors as                cbind(1:5, 6:10, 11:15)
#                         columns in a matrix

# rbind(a, b, c)          Combine vectors                   rbind(1:5, 6:10, 11:15)
#                         as rows in a matrix  


# matrix(x,               Create a matrix                   matrix(x = 1:12, nrow = 3, ncol = 4)
#        nrow,            from a vector x
#        ncol, 
#        byrow)


# data.frame()            Create a dataframe                data.frame("age" = c(19, 21), sex = c("m", "f"))
#                         from named columns




# Table 8.1- cbind in action
# - - - - - - - - - - - - - -

# Function	              Description	              Example

##  Combine R Objects by Rows or Columns

# cbind(a, b, c)          Combine vectors as        cbind(1:5, 6:10, 11:15)
#                         columns in a matrix

a81 <- (1:5)
b81 <- (6:10)
c81 <- (11:15)
cbind(a81, b81, c81) 
#      a81 b81 c81
# [1,]   1   6  11
# [2,]   2   7  12
# [3,]   3   8  13
# [4,]   4   9  14
# [5,]   5  10  15



# Table 8.1- rbind in action
# - - - - - - - - - - - - - -


# rbind(a, b, c)          Combine vectors                   rbind(1:5, 6:10, 11:15)
#                         as rows in a matrix  

a81 <- (1:5)
b81 <- (6:10)
c81 <- (11:15)
rbind(a81, b81, c81) 
#      [,1] [,2] [,3] [,4] [,5]
# a81    1    2    3    4    5
# b81    6    7    8    9   10
# c81   11   12   13   14   15


# Table 8.1- matrix examples
# - - - - - - - - - - - - - -

# matrix(x,               Create a matrix                   matrix(x = 1:12, nrow = 3, ncol = 4)
#        nrow,            from a vector x
#        ncol, 
#        byrow)

x <- (1:12)
matrix((x = (1:12)), nrow = 3, ncol = 4)
# > matrix((x = (1:12)), nrow = 3, ncol = 4)
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12






















#**************E*N*D*************# 
#*********************************
## END OF SCRIPT | END OF DOCUMENT 
#*********************************





