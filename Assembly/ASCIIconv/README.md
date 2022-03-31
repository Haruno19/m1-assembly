# HEX value to ASCII Converter
A program to **convert** a **HEX** value into its **ASCII** condification, using the Shift Left and Right instructions [ ``lsl``, ``lsb`` ].  

This program stores a value in a **register**, ``X8``, then **iterates** until the content in ``X8`` is equal to ``0x0``, and each **loop** it **extracts** and stores in the **register** ``X9`` the **least significant digit** of the value contained in ``X8`` _(e.g. ``X8`` contains the value ``0xF9A3``, ``X9`` stores ``0x0003``)_, converts it to its **ASCII** codification _(either it's a letter or a number)_ and stores it in the **register** ``X10``, then **shifts** to the right by ``4 bits`` the content of the **register** ``X8`` _(e.g. if ``X8`` contains ``0xF9A3``, it becomes ``0x0F9A``)_.


## In-detail explaination
The goal of this program is to convert an arbitrary HEX value stored in a register to its ASCII codification.  
For example, ``0xF9A3`` will become [``'F'``,``'9'``,``'A'``,``'3'``].  
In order to print to stdout this ASCII string it needs to be stored as: [``3``,``A``,``9``,``F``], with each "block" of the length of 8 Bits.  
  
To perform the conversion of any given value, regarderless of its size, the program uses a loop.  
The loop is performed until the value we want to convert eventually reaches ``0x0``.  
What it does every loop is to:
1. _Copy into another register (``X9``) the value shifted by 4 bits to the right, then shift it to the left, again by 4 bits, and subtract it from the original value._  
This allows to "extract" the least significant digit from the original value and store it into the ``X9`` register.
Using ``0xF9A3`` as an example, let's look at ``X9``'s value during this step: ``0x0F9A`` -> ``0xF9A0`` -> ``0xF9A3 - 0xF9A0`` which results in ``0x0003``, which indeed is the least significant digit of the original value ``0xF9A3``.
2. _Convert the value stored in ``X9`` into its ASCII codification, then insert the converted value into the register ``X10`` (shifted by 4 bits to the left)._  
To convert ``X9`` into its ASCII codification, you need to add to its current value either ``'A'`` (``0x0041``), if it's a letter, or ``'0'`` (``0x0030``), if it's a number. To implement this, this program always adds ``0x0030`` to the value stored in ``X9``, and uses a Conditional Branch in order to add an additional offset of ``0x0007`` (as ``0x000A`` should become ``0x0041`` if converted into ASCII), if ``X9`` stores a value grater or equal to ``0x000A``.  
Each loop, ``X10`` gets shifted to the left by 8 bits, in order to "free up" enouch space for the incoming 8-bit ASCII codification, then its value gets added to the converted ``X9`` value.
3. _Shift ``X8`` to the right by 4 bits, in order to repeat the loop with the remaining part of the number_  
For example, with the initial value of ``0xF9A3``, ``X8`` stores ``0xF9A3`` during the first loop, ``0x0F9A`` during the second loop, ``0x00F9`` during the third loop, ``0x000F`` during the fourth loop, and when it reaches the value ``0x0000`` it Branches out of the loop.
  
Once the loop has ended, it stores in the stack the value contained in ``X10``, which rapresents the ASCII codification of the initial value,  and prints it to stdout.

## Pseudocode
```
main()
  X8 = 0xF9A3
  X10 = 0x0
  
  while(X8 != 0x0)
    X9 = RightShift(X8, 4 Bit)
    X9 = LeftShift(X9, 4 Bit)
    X9 = X8 - X9
    if(X9 >= 0x000A)
      X9 = X9 + 0x0007
    X9 = X9 + 0x0030
    X10 = LeftShift(X10, 8 Bit)
    X10 = X10 + X9
    X8 = RightShift(X8, 4 Bit)
  
  push X10
  print SP
```


###### _created on: March 31th 2022_
 
