# ECES T580 In Class Assignment 6
# Bhautik (Brian) Amin
# Program built on Python 2.7.12
import numpy as np

# Part 1
# Define transition matrix: s1|s2|s3
A = np.matrix([ [1.0/3.0,2.0/3.0, 0], [1.0/3.0, 0.0, 2.0/3.0], [0.0, 2.0/3.0, 1.0/3.0] ])

# Write a function that takes a transition matrix A, an initial state s0, transition steps t
# and a final state st, return probability of P(st(t) | s0(0) )


def markov_prob(matrix, initial, steps, final):
    updated = np.linalg.matrix_power(matrix, steps)
    # Python indexes by 0 so we need to scale back by 1
    # S1|S2|S3 => S0|S1|S2
    initial = initial - 1
    final = final - 1
    return updated[initial, final]

# What is the probability of P(s1(2) | s3(0) )?
answer = markov_prob(A, 3, 2, 1)
print(answer)
""" OUTPUT:
    0.22222222222222221
"""

# What is the probability of P(s1(10) | s3(0) )?
answer = markov_prob(A, 3, 10, 1)
print(answer)
""" OUTPUT:
    0.20230655896
"""

# What is the probability of P(s1(50) | s3(0) )?
answer = markov_prob(A, 3, 50, 1)
print(answer)
""" OUTPUT:
    0.200000000209
"""

# What is the probability of P(s1(100) | s3(0) )?
answer = markov_prob(A, 3, 100, 1)
print(answer)
""" OUTPUT:
    0.200000000000
"""

# Part 2
# Suppose we have an HMM (S1|S2|S3 and observations o1|o2) with following transition matrix A
# and emission matrix B:
A = np.matrix([ [1.0/3.0,2.0/3.0, 0], [1.0/3.0, 0.0, 2.0/3.0], [0.0, 2.0/3.0, 1.0/3.0] ])
B = np.matrix([ [9.0/10.0, 1.0/10.0], [1.0/10.0, 9.0/10.0], [1.0/2.0, 1.0/2.0] ])

# Write a function that takes A, B, I, O and outputs probability P( o1(1) , o2(2) , o2(3) | s1(0) )

def hmm_prob(A,B,I,O):
    t0 = np.dot(I, A)
    t1 = np.multiply( t0, np.transpose( B[:,0] ) )
    t2 = np.multiply( np.dot(t1, A), np.transpose( B[:,1] ) )
    t3 = np.multiply( np.dot(t2, A), np.transpose( B[:,1] ) )
    return np.sum(t3[:])



I = np.matrix([1.0, 0.0, 0.0])
O = np.matrix([0.0, 1.0, 1.0])

# What is the probability of P( o1(1) , o2(2) , o2(3) | s1(0) )
an = hmm_prob(A,B,I,O)
print(an)
""" OUTPUT
    0.0907777777778
"""