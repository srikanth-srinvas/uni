# 10 0ct
library(vroom)
group_data <- vroom("~/data/uni/programming_R_course/10_oct/combined_group_data/group_data.csv")
group_data


##List all the files in the folder called Data
##save these file names as an object called "files"
files <- fs::dir_ls(path="~/data/uni/programming_R_course/10_oct/combined_data//")

##these are the files
files

##then load these file names using vroom
##add an ID column so we can see what files our data are coming from
all_group_data <- vroom(files, id="~/data/uni/programming_R_course/10_oct/combined_data/")
all_group_data
print(n=50, all_group_data)


# load tidyverse 
library(tidyverse)

class(all_group_data)

# describe the group data
library(Hmisc)
describe(all_group_data) # gives a summary of the group data

library(dplyr)

# Replace 'F' with 'Female' in the 'sex' column
all_group_data <- all_group_data %>%
  mutate(sex = ifelse(sex == "F", "Female", sex))

print(n=100,all_group_data)

## make a ggplot object
ggplot(data = all_group_data, aes(x = age, y = height))


## make a ggplot object
ggplot(data = all_group_data, aes(x = age, y = height)) + 
  ##add a geom to that object (in this case geom_point)
  ## notice the + after the ggplot() argument which allows us to 
  ##split this over multiple lines
  geom_point()
  
## a scatter and line plot
ggplot(data = all_group_data, aes(x = age, y = height)) + 
  ## points
  geom_point(col = "darkgrey") +
  ## and lines! 
  geom_smooth(col = "red")


## split the ggplot arguments
##make the ggplot object
p1 <- ggplot(data = all_group_data, aes(x = age, y = height))

## add the graphic (in this case lines)
p1 <- p1 + geom_point()
##plot it
p1

#p1 with lines
p1 + geom_line()

###
##make the ggplot object
p1 <- ggplot(data = all_group_data, aes(x = age, y = height))

## add the graphic (in this case points, and change the colors of the points according to the data in the sex column)
p1 <- p1 + geom_point(aes(col=sex))

## view the plot
p1


#facet the data by country:
ggplot(data = all_group_data, aes(x = age, y = height)) + 
  ##add points
  geom_point() + 
  ##split across facets
  facet_wrap(. ~ sex)

## object to filter data for people who are from the UK
filtered_data <- all_group_data %>%
  filter(country_of_birth == "UK")
filtered_data

##make a ggplot histogram
ggplot(all_group_data, aes(x=height))+
  ##add a histogram geom
  geom_histogram()

##make a ggplot
ggplot(all_group_data, aes(x=height, fill=sex))+
  ##add a histogram geom
  geom_histogram(alpha=0.5, position="identity")

## ggplot with a minimal theme
ggplot(all_group_data, aes(x=height, fill=sex))+
  ##add a histogram geom
  geom_histogram(alpha=0.6, position="identity") +
  ##add minimal theme
  theme_minimal()

?mean()


#### plot ####
