# Generate a vector of 100 random numbers between 0 and 50 and allow duplication using the "sample" function
random_numbers <- sample(0:50, 100, replace = TRUE)

# Sort the vector in descending order
sorted_numbers <- sort(random_numbers, decreasing = TRUE)

print(sorted_numbers) # print and check the numbers
length(sorted_numbers) # check the length of this vector to ensure there are 100 random numbers

# Step 3: Function to calculate the log10 of a vector and subtract it from the original vector
log_subtract <- function(x) {
  # Calculate the logarithm (base 10) of each value in the vector
  log_vals <- log10(x)
  
  # Subtract the log values from the original vector
  result <- x - log_vals
  
  # Return the new vector
  return(result)
}

# Step 4: Apply the log_subtract function to the sorted vector and save the output
final_result <- log_subtract(sorted_numbers)

# Print the output
print(final_result)
