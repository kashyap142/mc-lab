	;palindrome
	area palindrome, code
quo rn 5
rem rn 6
div rn 7
new rn 8
	entry
	ldr r0, =121
	mov div, #10
	mov r1, r0
	
loop
	bl next_digit
	mla new, div, new, rem
	cmp quo, #0
	movne r1, quo
	bne loop
	
	cmp r0, new
	moveq r9, #1
	movne r9, #0


stop b stop	

next_digit
	; 
	mov quo, #0
	mov rem, #0
	
next
	subs r1, r1, div
	addpl quo, quo, #1
	bpl next
	addmi rem, r1, div
	bx lr
	
	end
	