.global _start			
.align 2			   

_start: 
	//sum
    mov X3, #0x2    
	mov X4, #0x4
	add X4, X4, X3		//put X3+X4 in X5
	//convert to ascii
	add X4, X4, #0x30	//add '0' to X5
	//pushing X4 to the stack
	str X4, [SP, #0x0]	//^1
    //print
	mov	X0, #0x1		//stdout
    mov X1, SP			//^2
	mov	X2, #0x1		//string size is 1
	mov	X16, #0x4		//write system call
	svc	#0x80		    
    //end
	mov     X0, #0x0		
	mov     X16, #0x1	    //exit system call
	svc     #0x80

/*
	COMMENTS

	^1: push does not exist in arm64, 
		str X4 [SP, #0x0] means: store X4 into [Stack Pointer, with offset #0x0]
		which is equal to push X4
	
	^2:	You can't just use X4 as parameter for the Write System Call;
		It expects a pointer to the string you want printed, 
		so you have to store that value somewhere (e.g. the stack),
		and give the pointer (e.g. SP, Stack-Pointer) as a prameter.

*/