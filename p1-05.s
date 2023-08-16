	;sum of digits
	area sum_digits, code
n rn 0
divisor rn 1
sum rn 2
digit rn 3
quo rn 4
	entry
	ldr n, =12345
	mov divisor, #10
	mov sum, #0
	mov digit, #0
	
loop
	bl get_last_digit
	add sum, sum, digit
	cmp quo, #0
	movne n, quo
	bne loop
	
stop b stop

get_last_digit
	mov quo, #0
	mov digit, #0
next
	subs n, n, divisor
	addpl quo, quo, #1
	bpl next
	addmi digit, n, divisor
	bx lr
	end