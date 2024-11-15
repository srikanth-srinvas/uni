##load the package
library(palmerpenguins)
##load the data set
data(penguins)

str(penguins)


## Plot the flipper length between the different species
library(ggplot2)
ggplot(..., aes(x=..., fill = species)) +
  ## bin width determines how course the histogram is
  ## the alpha determines the transparency of the bars
  ## position allows you to determine what kind of histogram you plot (e.g. stacked vs overlapping). try changing to position="stack"
  geom_histogram(binwidth = 1, alpha = .5, position="identity")


##fit a glm()
mod_flipper <- glm(flipper_length_mm ~ species,
                   ##specify the data
                   data = penguins,
                   ##specify the error structure
                   family = "gaussian")
plot(mod_flipper)

class(mod_flipper)

#load the performance package
library(performance)
check_model(mod_flipper)

summary(mod_flipper)

########################

## Pong island activity

library(dplyr)
library(vroom)

# Load the data
data <- vroom("~/data/uni/programming_R_course/31oct/updated_pong_island.csv")

# Calculate SpeciesCount for each (Bucket, Distance) combination
species_count <- data %>%
  group_by(Bucket, Distance) %>%
  summarise(SpeciesCount = n_distinct(Species), .groups = 'drop')

# read to double check
species_count

# Merge SpeciesCount with the data (this ensures the SpeciesCount column is included)
data <- data %>%
  left_join(species_count, by = c("Bucket", "Distance"))

# read to double check
data

# Merge species_richness data for SpeciesRichness variable
data <- data %>%
  left_join(species_richness, by = c("Bucket", "Distance"))

# read to double check after joining species richness column
data

# Remove rows with missing values in the relevant columns for modeling
data_clean <- data %>%
  filter(!is.na(SpeciesCount) & !is.na(SpeciesRichness) & !is.na(Distance) & !is.na(Bucket))

# Fit a GLM model using SpeciesRichness as a predictor for SpeciesCount
model <- glm(SpeciesCount ~ Distance + Bucket + SpeciesRichness, data = data_clean, family = "poisson")

# Check model summary
summary(model)

# Add predicted counts to the clean data (ensure correct row counts)
data_clean$predicted_count <- predict(model, newdata = data_clean, type = "response")

# Merge the predicted counts back to the original dataset (with missing rows removed)
data <- data %>%
  left_join(select(data_clean, Bucket, Distance, predicted_count), by = c("Bucket", "Distance"))

# Plot Observed vs. Predicted Counts for diagnostic purposes
library(ggplot2)
ggplot(data, aes(x = SpeciesCount, y = predicted_count)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0) +
  geom_smooth(method = "lm", color = "lightblue", se = FALSE) +
  theme_classic() +
  labs(title = "Observed vs Predicted Species Count", x = "Observed Count", y = "Predicted Count")


###### model without the species richness column ######

model_no_richness <- glm(SpeciesCount ~ Distance + Bucket, data = data_clean, family = "poisson")
# Make predictions using the model without SpeciesRichness
data_clean$predicted_count_no_richness <- predict(model_no_richness, type = "response")

# Plot Observed vs Predicted Counts for the model without SpeciesRichness
ggplot(data_clean, aes(x = SpeciesCount, y = predicted_count_no_richness)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, color = "red") +  # Add a reference line y=x
  geom_smooth(method = "lm", color = "lightblue", se = FALSE) +  # Add linear regression line
  theme_classic() +
  labs(title = "Observed vs Predicted Species Count (without SpeciesRichness)", 
       x = "Observed Count", 
       y = "Predicted Count")


## checking performance of the model
library(performance)
model_performance(model = model)
check_model(model)
check_outliers(model)
check_collinearity(model)


#### GLMM's Mixed model #####

# install the required packages
install.packages("fitdistrplus")
install.packages("MuMIn")

# load the libraries
library(glmmTMB)
library(fitdistrplus)
library(MuMIn)


# Identify an appropriate error distribution 
# Fit Poisson distribution
fit_pois <- fitdist(data_clean$SpeciesCount, "pois")
plot(fit_pois)
gofstat(fit_pois)

# Fit Negative Binomial distribution
fit_nbinom <- fitdist(data_clean$SpeciesCount, "nbinom")
plot(fit_nbinom)
gofstat(fit_nbinom)

# Fit the GLMM model
m_mod1 <- glmmTMB(SpeciesCount ~ Bucket + Distance + Bucket:Distance + (1 | `Group name`),
                  data = data_clean,
                  family = "nbinom1")

summary(m_mod1)

# calculate the variance
r2_values <- r.squaredGLMM(m_mod1)
print(r2_values)

# assess model fit
install.packages("DHARMa")

# load the required libraries
library(DHARMa)
citation("DHARMa")


# Simulate residuals for the model with 1000 simulations
m_mod2_sim <- simulateResiduals(m_mod1, n = 1000)

# Plot the residuals
plot(m_mod2_sim)

# Test for overdispersion
testDispersion(m_mod2_sim)

## Check for Nested Random Effects
#Updating Model to Include Nested Random Effects

library(glmmTMB)

# Fit the GLMM model with nested random effects
m_mod2 <- glmmTMB(SpeciesCount ~ Distance +
                    Bucket +
                    Distance:Bucket +
                    (1 | `Group name`/Thrower),
                  data = data_clean,
                  family = "nbinom1")

# Model with the BFGS optimizer
m_mod2_optim <- glmmTMB(SpeciesCount ~ Distance +
                          Bucket +
                          Distance:Bucket +
                          (1 | `Group name`/Thrower),
                        data = data_clean,
                        family = "nbinom1",
                        control = glmmTMBControl(optimizer = optim, optArgs = list(method = "BFGS")))

# Scaled model with the BFGS optimizer
m_mod_scaled <- glmmTMB(SpeciesCount ~ scale(Distance) +
                          scale(Bucket) +
                          scale(Distance):scale(Bucket) +
                          (1 | `Group name`/Thrower),
                        data = data_clean,
                        family = "nbinom1",
                        control = glmmTMBControl(optimizer = optim, optArgs = list(method = "BFGS"))

# Example of crossed random effects (not for our current dataset, but for general use)
m_mod_crossed <- glmmTMB(SpeciesCount ~ Distance +
                           Bucket +
                           (1 | `Group name`) + (1 | Thrower),
                         data = data_clean,
                         family = "nbinom1")
summary(m_mod_crossed)

# Simplified random effects structure
m_mod_simple <- glmmTMB(SpeciesCount ~ scale(Distance) +
                          scale(Bucket) +
                          scale(Distance):scale(Bucket) +
                          (1|Thrower),
                        data=data_clean,
                        family="nbinom1",
                        control=glmmTMBControl(optimizer=optim, optArgs=list(method="BFGS")))
# Summary
summary(m_mod_simple)

# Zero-inflated model with random effect to account for zeros
Zi_mod <- glmmTMB(SpeciesCount ~ scale(Distance) +
                    scale(Bucket) +
                    scale(Distance):scale(Bucket) +
                    (1|`Group name`/Thrower),
                  ziformula = ~ Thrower,
                  data=data_clean,
                  family="nbinom1",
                  control=glmmTMBControl(optimizer=optim, optArgs=list(method="BFGS")))

# Model summary
summary(Zi_mod)

# Load DHARMa for residual diagnostics
library(DHARMa)

# Simulate residuals for the zero-inflated model
sim_res <- simulateResiduals(Zi_mod)

# Plot residuals
plot(sim_res)

# Test for outliers, dispersion, and zero inflation
testOutliers(sim_res)
testDispersion(sim_res)
testZeroInflation(sim_res)

# Model comparisons
anova(m_mod_scaled, m_mod_simple, Zi_mod)

# Add predicted values from the model to your_data
data_clean$predicted <- predict(Zi_mod, type = "response")

# Create Predicted vs Observed plot
library(ggplot2)
ggplot(data_clean, aes(x = SpeciesCount, y = predicted)) +
  geom_point(color="grey") +
  geom_abline(slope = 1, intercept = 0, color="blue")


