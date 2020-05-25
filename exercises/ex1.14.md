Please draw the tree about example in 1.2.2 when the amount is 11 cent.

When the amount increases, what are the orders of the space and steps in this calculating process?

![/pics/ex1.14.png](/pics/ex1.14.png)


Let's analyze the order of space:

the space of a recursive process depends on the depth of this process, in another word, what are the largest times that the recursive function are called.

The deepest recursion is n, so the space order is O(n).


Then let's analyze the order of time:

the time means how many steps are executed during the whole process.

From the graph we can find that `number of steps = number of nodes`.

To a binary tree `nodes = left nodes + right nodes + 1`




