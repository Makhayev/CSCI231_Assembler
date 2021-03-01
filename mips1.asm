.data
	Fib: .word 0, 1
.text
	la $s0, Fib
	li $t0, 0
	lw $t1, Fib($t0)
	addi $t0, $t0, 4
	lw $t2, Fib($t0)
	add $t3, $t2, $t1
	lw $t1, Fib($t0)
	addi $t0, $t0, 4
	sw $t3, Fib($t0)
	lw $t2, Fib($t0)
	add $t3, $t2, $t1
	lw $t1, Fib($t0)
	addi $t0, $t0, 4
	sw $t3, Fib($t0)
	lw $t2, Fib($t0)
	add $t3, $t2, $t1
	lw $t1, Fib($t0)
	addi $t0, $t0, 4
	sw $t3, Fib($t0)
	lw $t2, Fib($t0)
	add $t3, $t2, $t1
	lw $t1, Fib($t0)
	addi $t0, $t0, 4
	sw $t3, Fib($t0)
	lw $t2, Fib($t0)
	add $t3, $t2, $t1
	lw $t1, Fib($t0)
	addi $t0, $t0, 4
	sw $t3, Fib($t0)
	
	
	
	
	
