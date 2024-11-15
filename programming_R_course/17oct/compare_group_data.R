
## combined group data
all_group_data


# Use ggplot to check if the group data is normally distributed
ggplot(all_group_data, aes(x = height)) +
  ##tell it we want ao histogram, and to colour the histogram by the different groups
  geom_histogram(aes(fill=sex)) +
  ##make it on two different facets
  facet_wrap(~ sex) +
  ##set the theme to a simple background
  theme_bw() +
  ##tidy up by surpressing the legend
  theme(legend.position = "none")

## calculate some summary stats and mean of the group data
d_summary <-
  ##our data
  all_group_data %>% 
  ##split by sex
  group_by(sex) %>% 
  ##calculate the mean and sd of the groups
  summarise(height_m = mean(height, na.rm = T),
            height_sd = sd(height, na.rm = T))
##create a second data set to use as the "full" distribution of data, where sex is dropped
d2<-
  ##our data
  all_group_data %>% 
  ##drop the sex column
  dplyr::select(-sex)

all_group_data %>% 
  ##use ggplot
  ggplot() +
  ##great a blank aesthetic
  aes() +
  ##produce ahistogram of our all_group_data data
  geom_histogram(aes(y = ..density.., x = height, fill = sex)) +
  ##split the plot by sex
  facet_wrap(~ sex) +
  ##great the histogram of the full data (d2) where sex is removed
  geom_histogram(data = d2, aes(y = ..density.., x = height), 
                 alpha = .5) +
  ##calcualte the normal distrubution of females and overlay it
  stat_function(data = d_summary %>% filter(sex == "Female"),
                fun = dnorm,
                #color = "red",
                args = list(mean = filter(d_summary, 
                                          sex == "Female")$height_m,
                            sd = filter(d_summary, 
                                        sex == "Female")$height_sd)) +
  ##calculate tthe normal distribution of males and overlay it
  stat_function(data = d_summary %>% filter(sex == "Male"),
                fun = dnorm,
                #color = "red",
                args = list(mean = filter(d_summary, 
                                          sex == "Male")$height_m,
                            sd = filter(d_summary, 
                                        sex == "Male")$height_sd)) +
  ##some tweaks to the look
  theme(legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()) +
  ##add a title
  labs(title = "Facetted histograms with overlaid normal curves",
       ##and caption
       caption = "The grey histograms shows the whole distribution (over) both groups, i.e. males and females") +
  ##set our colours
  
  scale_fill_brewer(type = "qual", palette = "Set1")

# make. a qq plot of the group data
library(ggpubr)
ggqqplot(all_group_data, x="height", color="sex")

## get the stats of this group data
# Calculate summary statistics for each group (Group 1: Male, Group 2: Female)
group_stats <- all_group_data %>%
  group_by(sex) %>%
  summarise(
    n = n(),  # Number of samples
    mean_height = mean(height, na.rm = TRUE),  # Mean height
    sd_height = sd(height, na.rm = TRUE)  # Standard deviation of height
  )

# View the group statistics
group_stats

library(magrittr)
library(rstatix)
## create a test using the rstatix package 
##carry out an independant t-test
##specify our data
our_test <- all_group_data %>%
  ##specify the t test and the formula for it (value as a function of group, value~group)
  ##also tell it to return a more detailed output 
  t_test(height~sex, detailed=T) %>%
  ##return the significances too
  add_significance()
##look at the results
our_test

######################################

## palmer penguins 
library(palmerpenguins)
# load the inbuilt data of penguins from the package
data("penguins")

## load the required libraries
library(ggplot2)
library(dplyr)

# check the structure of the penguins df
str(penguins)

# Filter the dataset to include only Gentoo and Adelie species
penguins_filtered <- penguins %>%
  filter(species %in% c("Gentoo", "Adelie"))

# Check the filtered data
head(penguins_filtered)

# Create a boxplot to visualize flipper lengths between Gentoo and Adelie
ggplot(penguins_filtered, aes(x = species, y = flipper_length_mm, fill = species)) +
  geom_boxplot() +
  labs(title = "Flipper Lengths of Gentoo and Adelie Penguins",
       x = "Species",
       y = "Flipper Length (mm)") +
  theme_minimal()

# Check the distribution of flipper lengths for each species
ggplot(penguins_filtered, aes(x = flipper_length_mm, fill = species)) +
  geom_histogram(aes(y = ..density..), binwidth = 5, alpha = 0.5, position = "identity") +
  facet_wrap(~ species) +
  labs(title = "Distribution of Flipper Lengths by Species",
       x = "Flipper Length (mm)",
       y = "Density") +
  theme_minimal()

# Create QQ plots to check normality of flipper lengths
ggplot(penguins_filtered, aes(sample = flipper_length_mm)) +
  geom_qq(aes(color = species)) +
  geom_qq_line(aes(color = species)) +
  facet_wrap(~ species) +
  labs(title = "QQ Plots for Flipper Lengths of Gentoo and Adelie Penguins",
       x = "Theoretical Quantiles",
       y = "Sample Quantiles") +
  theme_minimal()

## perform a t-test comparing the flipper lengths
t_test_penguins <- penguins_filtered %>%
  mutate(species=as.character(species)) %>%
  t_test(flipper_length_mm ~ species, detailed = T) %>%
  add_significance()

t_test_penguins


