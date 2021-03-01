.data	
	val: .float 30

.text

	li $t0, 5
	li $t1, 2
	div $t0, $t1
	
	mflo $t3
	mfhi $a0
	
	li $v0, 1
	
	syscall

	move $a0, $t3
	syscall