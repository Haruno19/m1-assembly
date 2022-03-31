.global _start			
.align 2


_start:
    mov X8, #0x9
    mov X9, #0x0

_loop:
    cmp X8, X9     
    b.eq _exit
    bl _asciiPrint
    add X9, X9, #0x1
    b _loop

_exit:
    bl _asciiPrint
    mov X0, #0x0
	mov X16, #0x1
	svc #0x80


_asciiPrint:
    add X11, X9, #0x30      	;x11 = ... 00000000 00000000 00000000 ascii(x9)    -> ascii(x9)
    mov X10, #0xA           	;x10 = ... 00000000 00000000 00000000 0000000A     -> "\n"
    lsl X10, X10, #8        	;x10 = ... 00000000 00000000 0000000A 00000000     
    add X10, X10, X11       	;x10 = ... 00000000 00000000 0000000A ascii(x9)    -> "ascii(x9)\n"
	str X10, [SP, #0x0]	

    mov	X0, #0x1
    mov X1, SP
	mov	X2, #0x2
	mov	X16, #0x4
    svc	#0x80
    ret 			;the return instruction tells the procedure to branch back to where it was called with a branch and link
