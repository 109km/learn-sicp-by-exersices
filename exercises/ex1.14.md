Please draw the tree about example in 1.2.2 when the amount is 11 cent.

When the amount increases, what are the orders of the space and steps in this calculating process?

![/pics/ex1.14.png](/pics/ex1.14.png)


Let's analyze the order of space:

the space of a recursive process depends on the depth of this process, in another word, what are the largest times that the recursive function are called.

The deepest recursion is n, so the space order is O(n).


Then let's analyze the order of time:

the time means how many steps are executed during the whole process.

From the graph we can find that `number of steps = number of nodes`.


When the tree goes left from the root, the steps depend on the number of coins.

When the tree goes right, the steps depend on the number of amount.

![/pics/ex1.14-2.png](/pics/ex1.14-2.png)

So when the amount increases, it will influence the nodes on the 5 right branches, so the space order is
`O(n^5)`. 

If the coins' number is 6, the space order will be `O(n^6)`