# HEX Value to ASCII Converter
A program to **convert** a **HEX** value contained to its **ASCII** condification, using the Shift Left and Right instructions [ ``lsl``, ``lsb`` ].  

This program stores a value in a **register**, ``X8``, then **iterates** until the content in ``X8`` is equal to ``0x0``, and each **loop** it **extracts** and stores in the **register** ``X9`` the **least significant digit** of the value contained in ``X8`` _(e.g. ``X8`` contains the value ``0xF9A3``, ``X9`` stores ``0x0003``)_, converts it to its **ASCII** codification _(either it's a letter or a number)_ and stores it in the **register** ``X10``, then **shifts** to the right by ``4 Bytes`` the content of the **register** ``X8`` _(e.g. if ``X8`` contains ``0xF9A3``, it becomes ``0x0F9A``)_.


## In-detail explaination



###### _created on: March 31th 2022_
 
