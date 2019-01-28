# ECES T580 In Class Assignment 3
# Bhautik (Brian) Amin
# Program built on Python 2.7.12

# Part 1
# Create a function that will compute the fibonacci sequence between
# values F_initial = 0, and F_end = {USER DEFINED}

import numpy as np
"""
    fibonacci_array  = compute_fibonacci(end_bound, start_bound=0)
    Inputs: end_bound = Will compute the fibonacci sequence up to this index
    Outputs: fibonacci_array = Python list that will contain all values in the computed fibonacci sequence
"""
def compute_fibonacci(end_bound):
    fiboacci_sequence = [] # Initialize empty list to store values in
    if (end_bound == 0): # if user inputs 0, return 0 (First index of fibonacci sequence)
        return fiboacci_sequence.append(0)
    elif (end_bound == 1): # If user inputs 0, return 0,1 (Second index of fibonacci sequence)
        fiboacci_sequence = [0,1]
        return fiboacci_sequence
    else:
        fiboacci_sequence = [0] * end_bound # Initlaize fibonacci array as a set of 0's
        for i in range(0, end_bound): # Iterate from 0 to user defined end bound
            if (i == 0): # Initialize first and second index 
                fiboacci_sequence[i] = 0
            elif (i == 1):
                fiboacci_sequence[i] = 1
            else: 
                fiboacci_sequence[i] = fiboacci_sequence[i-2] + fiboacci_sequence[i-1]
        return fiboacci_sequence


# Run test sequence
print(compute_fibonacci(13))

"""
    Output:
    [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
"""



# Part 2: Write a function that computes levenshtein
#         distance between them
def compute_difference(word1, word2):  
    word1_length = len(word1) + 1 # Compute size for matrix
    word2_length = len(word2) + 1
    matrix = np.zeros ((word1_length, word2_length)) # Construct a matrix of zeros
    for x in xrange(word1_length):
        matrix [x, 0] = x
    for y in xrange(word2_length):
        matrix [0, y] = y
    # Iterate through first word
    for x in xrange(1, word1_length):
        # Iterate through second word
        for y in xrange(1, word2_length):
            if word1[x-1] == word2[y-1]: # If equal, compute min of neighbors
                matrix [x,y] = min(matrix[x-1, y] + 1, matrix[x-1, y-1], matrix[x, y-1] + 1)
            else: # If not equal, compute min with next
                matrix [x,y] = min(matrix[x-1,y] + 1, matrix[x-1,y-1] + 1, matrix[x,y-1] + 1)
    return (matrix[word1_length - 1, word2_length - 1])

# Run the test case
print(compute_difference("sitting", "kitten"))

"""
    OUTPUT: 3.0
"""




    





