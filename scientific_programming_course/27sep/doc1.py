my_list = ["Sri", 23, 1.8, "biology"]

print(my_list[0])  # Output: Sri

#### dictionaries ####
my_dict = {"name": "Sri", "age": 23, "height": 189}
my_dict["hobby"] = "badminton"

sris_age = my_dict["age"]
print(sris_age)

print(my_dict)  # This will print the entire dictionary

for x in my_dict:   # prints out all the keys
    print(x)

for value in my_dict.values():  # prints only values
    print(value)

for key, value in my_dict.items(): # prints the whole dictionary using printf statement
    print(f"Sris {key} is {value}")


# practice question
bookshelf = {
    "Terry Pratchett": ["Mort", "Jingo", "Truckers"],
    "Jane Austen": ["Sense and Sensibility", "Pride and Prejudice"],
    "Charles Dickens": ["Oliver Twist"],
}

for key, value in bookshelf.items():
    print(f"{key} wrote {value[0]}")


#### list comprehensions ####
s = []
for i in range(4):
    print(1)
    s.append(i*i)

print(f"list is {s}")

better_list = [i*i for i in range(4)]

print(f"Better list {better_list}")

#### FUNCTIONS ####
my_name = input("Please tell me your name: ")

name_length = len(my_name)

print(f"Hello {my_name}! Your name is {name_length} characters long")

## Methods for built in data types
animal = "horse"
animal.capitalize
print(animal)

## exercise
string = "what is your name"  # split function
string.split()

list = ["a", "b", "c"]
"-".join(list) # join list function

## exercise