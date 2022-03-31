.global _start			
.align 2			   

equal:      .ascii  "equal\n"
notequal:   .ascii  "not equal\n"

_start: 
    mov X3, #0xF
    mov X4, #0xF

    cmp X3, X4              // *X3 == *X4
    b.eq _printEqual        // if(==) _printEqual()
    b.ne _printNotEqual     // if(!=) _printNotEqual()

_exit:
    mov X0, #0x0
	mov X16, #0x1
	svc #0x80

_printEqual:
    mov	X0, #0x1			   	
	mov	X16, #0x4	
    adr	X1, equal 	
	mov	X2, #0x6	 	    
	svc	#0x80
    b _exit

_printNotEqual:
    mov	X0, #0x1			   	
	mov	X16, #0x4	
    adr	X1, notequal 	
	mov	X2, #0xA	 	    
	svc	#0x80
    b _exit

	    