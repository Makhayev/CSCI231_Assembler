.data
	x: .word 20
	y: .word 7
	index: .word 0
	length: .word 6
	arr: .word 25, 21, 20, 83, 20, 22
	space: .asciiz " "
	
.text
	main: 
	addi $t5, $zero, 4
	lw $t0, index

	lw $t1, length
	mul $t6, $t1, $t5
	lw $t2, x
	lw $t3, y
	lw $t4, arr($t0)
	addi $t7, $t7, 0
		
		while: 
			beq $t0, $t6, print 
			
			beq $t2, $t4, swap
		cont:
			
			addi $t0, $t0, 4
			lw $t4, arr($t0)
			
			j while
		swap:	sw $t3, arr($t0)  
			j cont
			
		print: 	beq $t7, $t6, exit
			li $v0, 1
			lw $a0, arr($t7)
			syscall
			li $v0, 4
			la $a0, space
			syscall
			addi $t7, $t7, 4
			j print 
			
		exit: 
			
	
