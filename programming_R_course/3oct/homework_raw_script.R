library(dplyr)
library(vroom)
library(ggplot2)
# Load the dataset using vroom
url <- "https://raw.githubusercontent.com/ExperimentalConservation/Bioinformatics_data/master/Workshop%203/wader_data.csv"
wader_data <- vroom(url)

# Display the first few rows of the data
head(wader_data)
# Check for missing values in the BreedingPairs column
missing_values <- sum(is.na(wader_data$BreedingPairs))

# Remove rows with missing BreedingPairs data (if any)s
wader_data_clean <- wader_data %>%
  filter(!is.na(BreedingPairs))

# Check the structure of the cleaned data
str(wader_data_clean)

# Display a summary of the cleaned data
summary(wader_data_clean$BreedingPairs)
ggplot(wader_data_clean, aes(x = BreedingPairs)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Breeding Pairs", x = "Breeding Pairs", y = "Frequency") +
  theme_minimal()
ggplot(wader_data_clean, aes(y = BreedingPairs)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Boxplot of Breeding Pairs", y = "Breeding Pairs") +
  theme_minimal()
