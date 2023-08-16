	; fibonacci
	area fibo, code
	entry
	mov r0, #0
	mov r1, #1
	mov r2, #8
	ldr r9, =0x40000000
	strb r0, [r9], #1
	strb r1, [r9], #1
loop
	add r0, r0, r1
	strb r0, [r9], #1
	eor r0, r0, r1
	eor r1, r0, r1
	eor r0, r0, r1
	subs r2, r2, #1
	bne loop
stop b stop
	end