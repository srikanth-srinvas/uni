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


## create a dataframe

group_data <- data.frame(first_name, 
                         last_name,
                         age,
                         height,
                         sex,
                         country_of_birth,
                         city_of_birth)
group_data # check the object group data

group_data$cricket_player <- played_cricket #creates a new column


vroom::vroom_write(group_data, file.path(path.expand('~'), 'Desktop', 'group_data.csv'))
