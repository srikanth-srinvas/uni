import time

# Make a list
my_list = [i for i in range(1, 1000000)]

# Convert the list into a dictionary
my_dictionary = dict.fromkeys(my_list, "")

# Save timestamp
start = time.time()

# Search for number
if my_dictionary.get(99999) == "":
    # Save timestamp
    end = time.time()

print(end - start)