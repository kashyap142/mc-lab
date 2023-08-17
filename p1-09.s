	; bubble
	area bubble, code

	entry
	mov r0, #10
	ldr r1, =0x40000000
	ldr r2, =arr
	
insert
	ldr r3, [r2], #4
	str r3, [r1], #4
	subs r0, r0, #1
	bne insert
	
	mov r13, #10
	ldr r12, =0x40000000
	
loop_i
	mov r9, r12 ; address
	subs r13, r13, #1 ; cond
	movne r8, r13 ; times j loop runs
	beq stop
loop_j
	add r1, r0, #4
	ldr r2, [r0]
	ldr r3, [r1]
	cmp r2, r3
	strpl r3, [r0]
	strpl r2, [r1]
	add r0, r0, #4
	subs r8, r8, #1
	bne loop_j
	
	cmp r13, #0
	bne loop_i
stop b stop

arr dcd 21,12,4,5,1,90,11,14,45,23
	end
	