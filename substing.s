	;substring
	area substring, code
cnt rn 7
	entry
	mov cnt, #0
	ldr r1, =M
	ldr r2, =S
	mov r12, r2
	
loop
	ldrb r3, [r1]
	ldrb r4, [r2]
	
	cmp r4, #0
	addeq cnt, cnt, #1
	moveq r2, r12
	beq loop
	
	cmp r3, r4
	addeq r2, r2, #1
	movne r2, r12
	add r1, r1, #1
	beq loop
	
	cmp r3, #0
	bne loop
	beq stop
	
stop b stop
	
M dcb "ABCABC", 0
S dcb "ABC",0

	end