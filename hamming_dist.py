
def hamming_distance(s1, s2):
    """Return the Hamming distance between equal-length sequences"""
    if len(s1) != len(s2):
        raise ValueError("Undefined for sequences of unequal length")
    return sum(el1 != el2 for el1, el2 in zip(s1, s2))



X = 'TACCCGAT'
Y = 'TAAACGAT'
Z = 'AAAACGCG'
W = 'AAAACGAT'


print("Distance between X and Y")
out = hamming_distance(X,Y)
print(out)

print("Distance between Y and X (Symmetry check)")
out = hamming_distance(Y,X)
print(out)

print("Distance between X and Z")
out = hamming_distance(X,Z)
print(out)

print("Distance between X and W")
out = hamming_distance(X,W)
print(out)

print("Distance between Y and Z")
out = hamming_distance(Y,Z)
print(out)

print("Distance between Y and W")
out = hamming_distance(Y,W)
print(out)

print("Distance between Z and W")
out = hamming_distance(Z,W)
print(out)