letter_to_morse = {
    'a':'.-', 'b':'-...', 'c':'-.-.', 'd':'-..', 'e':'.', 'f':'..-.', 
    'g':'--.', 'h':'....', 'i':'..', 'j':'.---', 'k':'-.-', 'l':'.-..', 'm':'--', 
    'n':'-.', 'o':'---', 'p':'.--.', 'q':'--.-', 'r':'.-.', 's':'...', 't':'-',
    'u':'..-', 'v':'...-', 'w':'.--', 'x':'-..-', 'y':'-.--', 'z':'--..',
    '0':'-----', '1':'.----', '2':'..---', '3':'...--','4':'....-',
    '5':'.....', '6':'-....', '7':'--...', '8':'---..','9':'----.', ' ':'/'
}

morse = []
input_string = "SOS We have hit an iceberg and need help quickly"

for letter in input_string:
    letter = letter.lower() # call this function to convert the uppercase letters to lowercase
    morse.append(letter_to_morse[letter])

morse_code = ' '.join(morse)
print(morse_code)

### python packages and modules ###

from math import sqrt
print(math.sqrt(25))

import os  # get the current working directory with by calling cwd function from os module
current_working_directory = os.getcwd()
print(current_working_directory)

### writing functions ###
weight_in_ounces = 6

weight_in_grams = weight_in_ounces * 28.3495

print(f"{weight_in_grams} g")

## define a function ##
def ounces_to_grams(weight): # define and write a function
    new_weight = weight * 28.3495
    return new_weight

weight = 23 # use a function on a declared variable
ounces_to_grams(weight)

## exrercise ##

def doubling_function(my_number):
    new_number = my_number * 2
    return new_number

my_number = 10
doubling_function(my_number)

## 