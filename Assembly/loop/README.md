# Conditional Loop example
A simple implementation of a **conditional loop**, using the **Branch** and **Branch with Link** instructions [ ``b``, ``bl`` ].  

This program stores a value in a **register**, ``X8``, and uses another **register**, ``X9``, as an **index** for the **loop**. It prints to **stdout** the value contained in ``X9`` and **increments** it by ``0x1`` until it eventually is equal to the value contained in ``X8``.
  
In this program is also implemented a **procedure** that converts the contents of ``X9`` into the corrisponding **ASCII** codification, attaching a ``New Line`` character to it.

## Pseudocode
```
main()
    x8 = 9
    x9 = 0

    while(x8 != x9)     
        asciiPrint(x9)
        x9++

    asciiPrint(x9)
    exit()


asciiPrint()
    x10 = ascii(x9) + '\n'
    push x10
    print SP
```


###### _created on: March 31th 2022_
 
