import numpy as np


def viterbi(A, B, I, O):

    tmp_likelihood = I
    hidden_states = []

    # Compute the likelihood of emission for IC
    for i in xrange(o, len(O)):
        
