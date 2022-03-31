.global _start			
.align 2


_start:
    mov X8, #0x875F

_convert_to_ASCII: 
    mov X10, #0x0
_loop:
    cmp X8, #0x0            //while(x!=0)
    b.eq _exit              
                            //x8 = F 9 A 3 
    lsr X9, X8, #4          //x9 = 0 F 9 A
    lsl X9, X9, #4          //x9 = F 9 A 0
    sub X9, X8, X9          //x9 = F 9 A 3 - F 9 A 0 = 0 0 0 3
    cmp X9, #0xA            //if x9 should become a char between '0' and '9'
    b.lt number             //branch to number:
    add X9, X9, #0x7        //else, add an offset [0x0007 + 0x0030 = 'A']
    number:    
    add X9, X9, #0x30       //x9 = x9 + '0'
    lsl X10, X10, #8        //x10 = 000000000 000000000 00000000 --------
    add X10, X10, X9        //x10 = 000000000 000000000 00000000 ascii(x9)
    lsr X8, X8, #4          //x8 = 0 F 9 A
    b _loop

_exit:
    str X10, [SP, #0x0]	
    bl _print

    mov X0, #0x0
	mov X16, #0x1
	svc #0x80

_print:
    mov	X0, #0x1
    mov X1, SP
	mov	X2, #0x8
	mov	X16, #0x4
    svc	#0x80
    ret