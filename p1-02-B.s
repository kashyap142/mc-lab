	; gp, show in memory
	area gp, code, readwrite
	entry
	mov r0, #2
	mov r1, #3
	mov r2, #5
	mov r5, #0x4000000
	
loop
	str r0, [r5], #4
	mul r0, r1, r0
	subs r2, r2, #1
	bne loop
stop b stop
	end