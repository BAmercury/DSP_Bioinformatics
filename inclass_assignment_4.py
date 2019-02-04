# ECES T580 In Class Assignment 3
# Bhautik (Brian) Amin
# Program was built for Python 2.7
# 2019


# Provides Fucntions and Class to generate trees
class TreeNode:
    def __init__(self, val):
        self.left = None
        self.right = None
        self.val = val
        
def TreeGenerator(A):
    if A is None or len(A) == 0:
        return None
    mid = len(A) // 2
    root = TreeNode(A[mid])
    root.left = TreeGenerator(A[:mid])
    root.right = TreeGenerator(A[mid+1:])
    return root


# Given a constructed binary tree, traverse and return values in a python list from lowest to highest
def TreeTraverser(root):
    # Get topmost node of binary tree
    current = root
    in_order = [] # Python list to store values in order
    temp = [] # Temporary list

    running = True
    while (running):

        # Run to the leftmost node from the current node
        if current is not None:
            temp.append(current) # Append current node value

            current = current.left # Move to left node
        else: # If we are at left most, backtrack

            if (len(temp) > 0): # Check if empty
                current = temp.pop() # Pull out the left most node
                print(current.val) # Print the value of this node, and append to in_order python list
                in_order.append(current.val)

                current = current.right # Now move to right
            else:
                running = False  # We have finished navigating the binary tree


        if (len(temp) < 0): # If stack is empty 
            running = False
    return in_order



root = TreeGenerator([1,2,3,4,5,6,7]) # Generate the tree
in_order = TreeTraverser(root) # Traverse
print(in_order)

""" OUTPUT:
1
2
3
4
5
6
7
[1, 2, 3, 4, 5, 6, 7]
"""

root = TreeGenerator([2,3,4,5,6,7,9]) # Generate the tree
in_order = TreeTraverser(root) # Traverse
print(in_order)

""" OUTPUT:
2
3
4
5
6
7
9
[2, 3, 4, 5, 6, 7, 9]
"""