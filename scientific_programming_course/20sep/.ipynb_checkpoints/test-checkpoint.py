#print("Hello from python") #this line prints greetings

name = "Sri"
#print(name)

age = "23"
#print(age, type(age))

fav = input("What is better dogs or cats?")
#print("The correct answer is", fav)

x = 23
y = 7

#print("Add them together", x+y)
#print("Subtract them", x-y)
#print("Multiply them", x*y)
#print("Divide", x/y)

a = 2
b = 3
# print("Equality", a==b)
# print("Greater than:", a>b)
# print("Less than:", a<b)

# print("Greater than or equal to;", a>=b)
# print("Less than or equal to":, a<=b)

a = 5
b = 2
c = 4

#print("(a==b) or (a>c)", (a==b) and (a > c))
#print("(a==b) or (a>c)", (a==b) and (a > c))
#print("not (a > b):", not (a > b))


#strings
str1="Bananna"
str2="Apple"

# print(str1,"equal to",str2,":",str1==str2)
# print(str1,"greater than",str2,":",str1>str2)
# print(str1,"less than",str2,":",str1<str2)


#### Data structures #####
#lists
my_list = ["Sri", 23, 1.85]
#print(my_list[2])  # Python always starts counting from 0
name = my_list[0]
age = my_list[-2]
height = my_list[2]
#print(name, age, height)

###reverse indexing in python###

## slicing : create a range within a list##
mylist2 = [3, 5, "green", 5.3, "house", 100, 1]
my_slice = mylist2[2:5]
print(my_slice)

mylist3= ["red", "green", "yellow", "orange", "white", "blue", "purple"]
mylist3.append("black")  # appending lists
print(mylist3)
my_slice2 = mylist3[1:4]
print(my_slice2)