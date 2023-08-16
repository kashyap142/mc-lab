	; count 0,1
	area count01, code
	entry
	mov r0, #0
	mov r1, #0
	ldr r5, =0x1234
loop
	lsrs r5, #1
	addcc r0, r0, #1
	addcs r1, r1, #1
	cmp r5, #0
	bne loop
stop b stop
	end
	