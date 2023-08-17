	; bubble
	area bubble, code
i rn 11
j rn 12
n rn 13
limit rn 10
	entry
	mov r0, #10
	ldr r1, =0x40000000
	ldr r2, =arr

insert
	ldr r3, [r2], #4
	str r3, [r1], #4
	subs r0, r0, #1
	bne insert
	
	mov n, #10
	ldr r0, =0x40000000
	
loop_i
	mov r1, r0
	subs n, n, #1
	movne j, n
	beq stop

loop_j
	add r2, r1, #1
	ldr r3, [r1]
	ldr r4, [r2]
	cmp r3, r4
	strpl r3, [r2]
	strpl r4, [r1]
	add r1, r1, #1
	subs j, j, #1
	bne loop_j
	
	cmp n, #0
	bne loop_i
	
stop b stop

arr dcd 90,12,9,4,1,2,56,22,23,24
	end