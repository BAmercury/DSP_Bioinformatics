# ECES T580 In Class Assignment 5
# Bhautik (Brian) Amin
# Program built on Python 2.7.12

# Problem 1:
# Implement a hashing function of a 3-mer based
# Use a quaternary metric
# Have it index 1 start


def hash(key):
    # Break down the given key and calculate its equivalent decimal representation
    index = 0
    point = 2
    # Make sure given key is upper case
    key.upper()
    for x in range(len(key)): # Iterate through the given 3-mer
        # Each value of 3-mer is encoded as [0,1,2,3]
        if (key[x] == 'A'):
            index = index + 0*(4**point)
        elif (key[x] == 'C'):
            index = index + 1*(4**point)
        elif (key[x] == 'G'):
            index = index + 2*(4**point)
        elif (key[x] == 'T'):
            index = index + 3*(4**point)
        # Decrement the power down
        point = point - 1
    return index+1 # Add one to have the hashing index start by 1


# Test cases
i = hash('AAA')
print('AAA: '+ str(i))
i = hash('AAC')
print('AAC: '+ str(i))
i = hash('ATC')
print('ATC: '+ str(i))
i = hash('TTT')
print('TTT: '+ str(i))

""" OUTPUT:
AAA: 1
AAC: 2
ATC: 14
TTT: 64
"""

# Problem 2
# Write a function that uses our previous hash() function to return
# a 3-mer frequency in a DNA sequence. Use sliding window with step size 1
# so Given "ATTATTGC" return "ATT: 2", "TTA: 1", "TAT: 1", "TTG: 1", "TGC: 1"


def freq_decomposer(DNA_Sequence):
    WINDOW_SIZE = 3 # For 3-mers
    rolling_index = [] # Don't use dictionary as MATLAB users will have have access to one
    rolling_keys = [] # List of rolling names of the 3-mers used for displaying the answer
    rolling_counts = [] # List of frequency of the 3-mer within the sequence
    for i in range(len(DNA_Sequence)- WINDOW_SIZE+1): # Sliding window
        subset = DNA_Sequence[i:(i+WINDOW_SIZE)] # Extract the subset from the DNA sequence
        if subset not in rolling_keys: # Used for displaying the answer later
            rolling_keys.append(subset)

        index = hash(subset) # Build a hash character from the subset
        if index not in rolling_index: # If the hash character is not in the rolling list of characters add it and increment its corresponding count by 1
            rolling_index.append(index)
            rolling_counts.append(1)
        else:
            # if the hash character is already in the rolling list increment by the count by 1
            location = rolling_index.index(index) # Find the location of the index's count
            rolling_counts[location] = rolling_counts[location] + 1
    freq = zip(rolling_keys, rolling_counts) # Zip together the names and count for final display
    return freq


# Test Case 1
freq = freq_decomposer('ATTATTGC')
print(freq)
""" OUTPUT
[('ATT', 2), ('TTA', 1), ('TAT', 1), ('TTG', 1), ('TGC', 1)]
"""
# Test Case 2:
freq = freq_decomposer('GTTAATTAG')
print(freq)
""" OUTPUT
[('GTT', 1), ('TTA', 2), ('TAA', 1), ('AAT', 1), ('ATT', 1), ('TAG', 1)]
"""