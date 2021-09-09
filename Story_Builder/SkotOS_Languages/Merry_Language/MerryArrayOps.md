# Working with Arrays in Merry

A collection of useful stuff I\'ve discovered about arrays:

## Dynamic Manipulation

To set an array:

    From client: +setprop zell favourite:colours ({ "green", "black" })
    From merry: $actor."favourite:colours" = ({ "green", "black" })

Merry array operations: 

| Operation | Description |
|----------------|-----------------------|
| array1 = array2 | set array1 to array2 |
| array1 += array2 | Adds all the elements in array2 to array1 |
| array1 \|= array2 | \"OR\"s the two arrays, which essentially adds every element of array2 to array1, except for elements that already exist. |
| array1 &= array2 | \"AND\"s the two arrays, which removes all elements from array1 that are not also in array2. |
| array1 -= array2 | Removes all elements in array1 that are also in array2. |
|----------------------------------------|


Sample code - setting and modifying an array.:

    $actor."favourite:colours" = ({ 1 }); /* it's now ({ 1 }) */
    $actor."favourite:colours" += ({ 3, 2 }); /* now ({ 1, 3, 2 }) */
    $actor."favourite:colours" |= ({ 4, 2 }); /* now ({ 1, 3, 2, 4 }) */
    $actor."favourite:colours" &= ({ 2, 3, 4 }); /* now ({ 3, 2, 4 }) */
    $actor."favourite:colours" -= ({ 2 }); /* now ({ 3, 4 }) */

    ... after that code is run, you can access the array like so:

    $actor."favourite:colours"[0] -> 3
    $actor."favourite:colours"[0 .. 0] -> ({ 3 })
    $actor."favourite:colours"[0 .. 1] -> ({ 3, 4 })

------------------------------------------------------------------------

The copy() function is useful when modifying for instance arrays and/or
mappings, to avoid harming the original source. VAR = ARRAY does not
instantly create a copy of ARRAY, which means there is a slight chance
that modifying VAR will also modify ARRAY (the original source).

    Example(s):
    Merry code: copy( "abc" )
    Merry result: "abc"
    Merry code: copy( ({ "a", "b", "c" }) )
    Merry result: ({ "a", "b", "c" })
    Merry code: copy( $actor )
    Merry result: <Marrach:players:K:kalle>

------------------------------------------------------------------------

\-- Main.andreww - 04 Sep 2002

Added more descriptions, and the operations table. \-- Main.JamesSanders
- 29 Jun 2003

Added copy() helpfile. \-- Main.JamesSanders - 09 Oct 2003
