# Conditional and Unconditional Branch example
A program to test the **Branch instructions** [ ``b``, ``b.eq``, ``b.ne`` ].  

It stores two values in two **registers**, ``X3`` and ``X4``, compares them and prints to **stdout** if they're ``equal`` or ``not equal``.

## Pseudocode
```
string equal = "equal"
string notequal = "not equal"

main()
  X3 = 0xF
  X4 = 0xF
  
  if(X3==X4)
    print(equal)
  else if(X3!=X4)
    print(notequal)
```


###### _created on: March 31th 2022_
