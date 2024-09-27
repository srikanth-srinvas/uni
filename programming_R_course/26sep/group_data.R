# week 1
height <- c(178, 188, 186, 171, 194, 190) # enter height data to a vector

age <- c(26,23,21,23,22,23) # enter age data to the vector age

length(height) # length of the height vector 

height[c(2,3)] # returns 2nd and 3rd value of the height vector 

# character vectors / strings
first_name <- c("Kaya", "Srikanth", "Will", "Jake", "Edward","Milo")
last_name <- c("Kupajova", "Srinivas", 'Storr', "Mulrooney", "Godfrey","Friedrich")
sex <- c("Female", "Male", "Male", "Male", "Male","Male")
country_of_birth <- c("Slovakia","India","England","England","England","England")
city_of_birth <- c("Svidnit","Bangalore","Exter","Burnley","Bristol","Bristol")
###
played_cricket <- c(FALSE,TRUE,TRUE,FALSE,TRUE,FALSE) # logical vector holds T/F

## checking vectors
is.numeric(1:5)
is.character(first_name[1:5]) # check if names are charecters


## basic calculations
1+112871873 # addition

237*9398 #multiplication

## writing functions ##
sum_height <- sum(height)
length_height <- length(height)

# mean would be sum/length of heights
sum_height/length_height

# calculate the mean of the height directly
mean(height)

# getting help with functions #
?mean()
?mode()

# NA values
##make a vector which includes an NA value:
vec <- c(1, 5, 6, 3, NA, 10, 12)

##try and calculate the mean value:
mean(vec)
# it returns NA

##try and calculate the mean value, ignoring any NA values:
mean(vec, na.rm = T) # ignores the NA value

### writing your own functions ###
se <- function(x)

?sample()
