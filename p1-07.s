	;ncr
	area ncr, code
n rn 0
r rn 1
n_fact rn 2
r_fact rn 3
n_r_fact rn 4
quo rn 5
	entry
	mov n, #6
	mov r, #2

	; n!
	mov r8, n
	bl fact
	mov n_fact, r7
	
	; r!
	mov r8, r
	bl fact
	mov r_fact, r7
	
	;(n-r)!
	sub r8, n, r
	bl fact
	mov n_r_fact, r7
	
	; division by r!
	mov r7, n_fact
	mov r8, r_fact
	bl division
	mov n_fact, quo
	
	; division by (n-r)!
	mov r7, n_fact
	mov r8, n_r_fact
	bl division
	mov n_fact, quo

fact
	;mov req no to r8
	mov r7, #1
loop
	mul r7, r8, r7
	subs r8, r8, #1
	bne loop
	bx lr
	
	
division
	mov quo, #0
	; use r7 = n, r8 = k (n / k)
next
	subs r7, r7, r8
	addpl quo, quo, #1
	bne next
	
	bx lr
	
	end