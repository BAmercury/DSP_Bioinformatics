# ECES T580 In Class Assignment 3
# Bhautik (Brian) Amin
# Program built on Python 2.7.12

# Create a function that will compute the fibonacci sequence between
# values F_initial = 0, and F_end = {USER DEFINED}

def compute_fibonacci(end_bound, start_bound=0):
    fiboacci_sequence = [] # Initialize empty list to store values in
    if (end_bound == 0):
        return fiboacci_sequence.append(0)
    elif (end_bound == 1):
        fiboacci_sequence = [0,1]
        return fiboacci_sequence
    else:
        fiboacci_sequence = [0] * end_bound
        for i in range(0, end_bound):
            if (i == 0):
                fiboacci_sequence[i] = 0
            elif (i == 1):
                fiboacci_sequence[i] = 1
            else:
                fiboacci_sequence[i] = fiboacci_sequence[i-2] + fiboacci_sequence[i-1]
        return fiboacci_sequence

print(compute_fibonacci(13))

