import sys

# This function reverse complements a string
def reverse_complement(seq):
    # Store the complementary bases in a dictionary
    bases_dict = {'A': 'T', 'C': 'G',
                  'G': 'C', 'T': 'A'}
    # Change the sequence into upper case
    seq = seq.upper()
    # Reverse the sequence
    reverse = seq[::-1]
    # Start a new string to add the new bases to
    complement = ""
    # Loop through the reversed input string
    for b in reverse:
        # Add error message in case unknown character
        n = bases_dict.get(b, "Character not recognised")
        if n == "Character not recognised":
            complement = n
            # Stop the for loop
            break
        else:
            complement += n
    return complement

if __name__ == "__main__":
    seq = sys.argv[1]
    print(reverse_complement(seq))

#The statement [::-1] means start at the end of the string
#and end at position 0, move with the step -1, negative one,
#which means one step backwards. This reverses the string.
    