# ECES T580 In Class Assingment 2
# Bhautik (Brian) Amin
# Program built on Python 2.7.12
import numpy as np # Import numpy to calculate averages

""" Part A:
    Compute a set of 5 averages by moving window along a test case array of 9 values
"""
k = 5 # Pointer variable for window length
p = 0 # Pointer variable for starting index
x = [1, 2, 5, 4, 3, 4, 10, 2, 1] # Test case data
n = 9 # Length of test case data
averages = [] # empty array to store averages

for iteration in range(5): # Iterate through calculatios a total of 5 times (5 averages)
    averages.append(np.mean(x[p:k])) # Compute mean for window starting at index p and ending at index k, length between these indices is 5 (window size)
    p = p + 1 # Slide the window by incrementing the pointers
    k = k + 1
print("Averages for Part A: ")
print(averages) # Print final array at the end

""" Part A Output:
    >>Averages for Part A:
    >>[3.0, 3.6000000000000001, 5.2000000000000002, 4.5999999999999996, 4.0]
"""

""" Problem B:
    Create algorithm that does this faster
"""
k = 5 # Pointer variable for window length
p = 0 # Pointer variable for starting index
x = [1, 2, 5, 4, 3, 4, 10, 2, 1] # Test case data
n = 9 # Length of test case data
averages = [] # empty array to store averages
previous_value = 0 # Previous value that lies outside of overlap


previous_sum = np.sum(x[p:k]) # Precalculate the first sum of the array
averages.append(previous_sum/5.000) # Calculate the average for this sum and save it to list

for iteration in range(4):
    sum_update = previous_sum - x[p] # Subtract the latest sum from the previous index
    sum_update = sum_update + x[p+5] # Add this updated sum to the next index
    averages.append(sum_update/5.000) # Compute the average and save to array
    previous_sum = sum_update
    p = p + 1 # Update the previous index pointer
print("Averages for Part B: ")
print(averages) # Print final array at the end

""" Part B Output:
    >>Averages for Part B:
    >>[3.0, 3.6000000000000001, 5.2000000000000002, 4.5999999999999996, 4.0]
"""

""" Part C:
    Create an algorithm that can compute the maximum number
    within an array with N-length windows, with an overlap of N-1
"""

# Create a function to handle this, inputs are an array and desired window length
def findMax(array, window_length):
    p = 0 # Pointer to represent first index of array
    k = window_length # Pointer to represent last index of array 
    array_size = len(array) # Get array size
    max_values = [] # Save the maximums into a Pyton list
    for iteration in range(array_size - window_length + 1): # Iterate through loop for Length-WindowSize+1 (K-N+1)
        max_values.append(max(array[p:k])) # Append maximum integer from the subset of array with window size N
        p = p + 1 # Update the pointers to slide across array by 1 with overlap of 4
        k = k + 1
    print(max_values) # Print the values

# Prompt user for a test case array and window size to test this function
print("Give me a list of integers, seperate them using a comma")
cd_string = raw_input()
# Convert comma delimited string to list of characters
user_input = cd_string.split(',')
# Convert these values into list of integers
user_input = map(int, user_input)
# Prompt user for window length
print("Give me the window length")
window_length = raw_input()
window_length = int(window_length)
# Run the function
findMax(user_input, window_length)

""" Part C Output:
    >> Sample Input I typed in: [1, 2, 5, 5, 6, 10]
    >> Sample Input I typed in for window length: 4
    Output:
    >> [5, 6, 10]
"""