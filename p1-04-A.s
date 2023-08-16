	; factorial
	area fact, code
	entry
	mov r0, #1
	mov r1, #5

loop
	mul r0, r1, r0
	subs r1, r1, #1
	bne loop
stop b stop
	end