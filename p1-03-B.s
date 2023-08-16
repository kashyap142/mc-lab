	; sum of 10 no in memory
	area sum10, code
	entry
	mov r0, #0
	mov r1, #9
	ldr r7, =table
	ldrh r0, [r7]
loop
	ldrh r4, [r7, #2]!
	add r0, r0, r4
	subs r1, r1, #1
	bne loop
	
	mov r1, #10
	mov r8, #0 ; average
	mov r9, #0 ; rem
	mov r5, r0 ; sum
	
average
	subs r5, r5, r1
	addpl r8, r8, #1
	bpl average
	addmi r9, r5, r1
stop b stop

table dcw 1,2,3,4,5,6,7,8,9,10
	end
	