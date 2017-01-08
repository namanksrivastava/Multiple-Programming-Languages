							Execution
For Ada:
i.  Run using : ./AQMain < input.txt

For Scheme:
i.  Install Dr. Racket, set language as R5RS.
ii. Run the scheme code.

For ML:
i.  Download the ML of New Jersey
ii. Run using : sml ml.sml

For Scala:
i.  Compile using scalac Part2.scala
ii. Run using: scala Part2

	
							Objective
Ada:
Implement Simpson's method.


Scheme:
1. Write a function (count-numbers L) that returns a count of the numbers found anywhere
within L(a list), including in nested lists.

2. Define a function (insert x L) where x is a number and L is a sorted list of numbers in
increasing order, that returns a new sorted list containing x and all the elements L. That is,
x appears in the right place in the new list.

3. Define a function (insert-all L M), where L is list of numbers and M is a sorted list of
numbers, that returns a sorted list containing all the elements of L and all the elements of M.

4. Define the function (sort L), where L is an unsorted list of numbers, that returns a new
list containing the elements of L in sorted order. sort must perform an insertion sort, such
as one you implemented above, but it cannot call any external function that you've defined.

5. Write a simple function, (translate op), where op is the symbol '+, '-, '*, or '/, that
returns the corresponding operator.

6. Write the function (postfix-eval exp), where exp represents an expression in postfix
notation, that returns the result of evaluating exp. For this, a postfix expression
can only be of the following form:
 A number, or
 a list of the form (arg1 arg2 op), where arg1 and arg2 are postfix expressions and op
is an operator symbol. Note that the list must contain exactly three elements (some of
which may be lists, of course) and represents the application of the operator op to the
operands arg1 and arg2.

7. Suppose you are using a list whose elements are distinct to represent a set (which, unlike a
list, has no order). Define the function (powerset L), where L is such a list representing a
set, that returns the power set of L, i.e. the set of all subsets of L. Of couse, each subset is
also represented by a list. When considered as sets, the list (2 3) is the same as the list
(3 2), so both of these lists cannot appear in the same list representing a larger set (such as
a power set).


ML:
1. Implement a function merge L1 L2, where L1 and L2 are both sorted lists of integers in
ascending order, that returns a sorted list containing the elements of both lists.

2. Define a function split L, where L is a list of integers, that returns a tuple of two lists,
(L1, L2), such that half the elements of L are in L1 and half are in L2, in alternating order.

3. Define a function mergeSort L, where L is a list of integers, that returns a sorted list of the
elements of L.

4. Implement the function sort, which is a polymorphic version of your merge sort function,
above. sort should sort a list of elements of any type. In order to do this, sort must take
an additional parameter, the < (less-than) operator, that operates on the element type of the
list. Furthermore, the definition of the split and merge functions should be nested inside
your sort function. No external function (outside of sort) should be defined (or called).

5. Define a polymorphic type 'a tree using ML's datatype facility, i.e.
datatype 'a tree = ...
such that an 'a tree is one of the following:
 An empty tree,
 a leaf that is labeled with an value of type 'a
 an interior node that is labeled with an 'a and has two children, each of type 'a tree

6. Write the function labels T, where T is an 'a tree, that returns a list of the labels associated
with the leaves and interior nodes of T. The order of the returned list should be determined
by an in-order tree traversal, where the label of an interior node appears after all the labels
of its left subtree and before all the labels of its right subtree.

7. Define the function replace (op ==) x y T, where T is an 'a tree, and x and y are values
of type 'a, that returns a tree that is identical to T except that anywhere that a label equal
to x appears in T, the label y appears instead. The parameter (op ==) is the function that
should be used as the infix equality operator, so you will have to declare == as an infix
operator.

8. Define the function replaceEmpty y T, where T is an 'a Tree, which returns a new tree
identical to T, except that each empty subtree in T has been replaced with y. 

9. Define a function maptree f T, where T is an 'a tree, that returns a tree resulting from
applying f to every node, leaf, and empty in T.

10. Define a polymorphic sortTree function that, given an 'a list tree (for some type 'a, so
that each label is a list of elements of type 'a), returns a new tree that is identical to the
original tree, except that each label is sorted. sortTree must use both your mapTree function
and your polymorphic sort function, above. sortTree should not itself be recursive. Finally,
sortTree should use a lambda expression


Scala:
1.	Define a class, OInt, that implements the Ordered trait.

2. 	Define an abstract generic class OTree[T] such that:
o	T must itself implement the Ordered trait, allowing two T's to be compared.
o	OTree[T] also implements the Ordered trait, allowing two OTree's to be compared
o	Two case classes, OLeaf[T] and ONode[T], extend the OTree[T] class.
o	OLeaf[T] should be parameterized by a T object and ONode[T] should be parameterized by a list of OTree's. 

3. 	In a singleton class named Part2, put the main() method. Also in the Part2 singleton class, put the following.
o	A method compareTrees() that takes two trees of type OTree[T] as parameters, for the same T. If the first tree is less than the second, 
compareTrees() should print "Less". If the two trees are equal, then compareTrees()should print "Equal". Otherwise, compareTrees() should print "Greater".
