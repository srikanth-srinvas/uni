import time

# Make a list
my_list = [i for i in range(1, 1000000)]

# Save timestamp
start = time.time()

# Search for number
if 99999 in my_list:
    # Save timestamp
    end = time.time()

print(end - start)