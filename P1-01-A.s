	; sum of 10 odd numbers
	area sum10, code
	entry
	mov r0, #0
	mov r1, #1
	mov r2, #10
	
loop
	add r0, r0, r1
	add r1, r1, #2
	subs r2, r2, #1
	bne loop
stop b stop
	end