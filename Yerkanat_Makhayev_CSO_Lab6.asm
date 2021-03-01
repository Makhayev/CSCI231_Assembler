.data 
	num: .word 2147483647
	entnum1: .asciiz "Please enter the first number  " 
	entnum2: .asciiz "Please enter the second number  "
	newline: .asciiz "\n"
.text
	main: 
		li $v0, 4 
		la $a0, newline
		syscall
	
		li $v0, 4
		la $a0, entnum1
		syscall
		
		li $v0, 5
		syscall
		
		move $t1, $v0
		
		li $v0, 4
		la $a0, entnum2
		syscall
		
		li $v0, 5
		syscall
		
		move $t2, $v0
		
		add $t3, $t1, $t2
		
		li $v0, 1
		move $a0, $t3
		syscall

.ktext 0x80000180

	mfc0 $k0, $14
#	addi $t5, $t1, 0x00400000
#	move $k0, $t5
#	addi $k0, $k0, 4
	lw $k0, addr
	mtc0 $k0, $14
	
	li $v0, 4
	la $a0, err
	syscall
	
	eret 

.kdata
	addr: .word 0x00400000
	err: .asciiz "Try again!"
	
	
	
	
