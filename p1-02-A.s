	; add first 10 even nos, store in memory
	area add_10_even, code, readonly
	entry
	mov r0, #0
	mov r1, #2
	mov r2, #10
	mov r5, #0x4000000

loop
	add r0, r0, r1
	add r1, r1, #2
	subs r2, r2, #1
	bne loop
	
	str r0, [r5]
stop b stop
	end