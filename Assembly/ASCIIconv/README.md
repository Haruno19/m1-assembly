# HEX Value to ASCII Converter
A program to **convert** a **HEX** value contained to its **ASCII** condification, using the Shift Left and Right instructions [ ``lsl``, ``lsb`` ].  

This program stores a value in a **register**, ``X8``, then **iterates** until the content in ``X8`` is equal to ``0x0``, and each **loop** it **extracts** and stores in the **register** ``X9`` the **least significant digit** of the value contained in ``X8`` _(e.g. ``X8`` contains the value ``0xF9A3``, ``X9`` stores ``0x0003``)_, converts it to its **ASCII** codification _(either it's a letter or a number)_ and stores it in the **register** ``X10``, then **shifts** to the right by ``4 bits`` the content of the **register** ``X8`` _(e.g. if ``X8`` contains ``0xF9A3``, it becomes ``0x0F9A``)_.


## In-detail explaination
The goal of this program is to convert an arbitrary HEX value stored in a register to it's ASCII codification. For example, ``0xF9A3`` will become [``'F'``,``'9'``,``'A'``,``'3'``].  
In order to print to stdout this ASCII string it needs to be stored as: [``3``,``A``,``9``,``F``], with each "block" long 8 Bits.  
  
To perform the conversion of any given value, regarderless of its size, the program uses a loop.  
The loop is performed until the value we want to convert eventually reaches ``0x0``.  
What it does every loop is to:
1. _Copy into another register (``X9``) the value shifted by 4 bits to the right, then shift it to the left, again by 4 bits, and subtract it from the original value._  
This allows to "extract" the least significant digit from the original value and store it into the ``X9`` register.
Using ``0xF9A3`` as an example, let's look at ``X9``'s value during this step: ``0x0F9A`` -> ``0xF9A0`` -> ``0xF9A3 - 0xF9A0`` which results in ``0x0003``, which indeed is the least significant digit of the original value ``0xF9A3``.


###### _created on: March 31th 2022_
 
