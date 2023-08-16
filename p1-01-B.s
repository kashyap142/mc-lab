	; use squ 
	area squ, code 
	entry
	mov r0, #0
	mov r1, #1

loop 
	bl SQU
	add r0, r0, r5
	add r1, r1, #1
	cmp r1, #6
	blt loop
	
stop b stop

SQU
	mul r5, r1, r1
	bx lr

	end
	