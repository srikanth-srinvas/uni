
## simple if else statements ##
person_age = 22

if person_age > 18:
    print("You are an adult.")
else:
    print("You are less than 18")


#
my_number = int(input('Enter a number'))

if my_number > 100:
    print('I have put in a big number')


### conditional if else elif together ###
my_number = int(input('Enter a number'))

if my_number > 100:
    print('my number is a large number')
elif my_number > 1:
    print('my number is positive')
else:
    print("my number is negative")


## using if and and statement to combine a condition ##
my_number = int(input('Enter a number'))

if my_number > 0 & my_number <= 10:
    print('my number is between 1 and 10')

#### for loops ####

my_words =  ['Its', 'almost', 'the', 'weekend']

print(my_words)

for word in my_words:
    print(word)


numbers = [2,6,4,3,2]
total = 0

while True:
    user_input = input("Enter 'q' to quit")
    if user_input == 'q':
        break



import csv

with open('/Users/srikanth/data/uni/20sep', 'r') as file:
    csv_reader = csv.reader(file)
    for row in csv_reader:
        print(row[2])