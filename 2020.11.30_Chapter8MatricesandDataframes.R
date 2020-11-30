
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
# 8.1a Creating the Data Frame
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
# 8.1b Exploring dataset aspects
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
# 8.1c Statistics with Column Vectors
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

# Create a dataframe called old.black.bsale containing only data from black boats older than 50 years
old.black.bsale <- subset(bsale, color == "black" & age > 50)
# 3 observations
# 8 variables


