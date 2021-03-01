.data
	x: .word 20
	y: .word 30
	index: .word 0
	length: .word 6
	arr: .word 25, 21, 20, 83, 20, 25
	line: .asciiz "\n"
	
.text
	main: 	lw $a0, y
		lw $a1, length
		lw $a2, x
		la $a3, arr
		
		
		jal print
		
		jal replace 
		
		jal print 
		

		li $v0, 10
		syscall
	replace: 	addi $t0, $zero, 0
			
			
			mul $t6, $a1, 4
	
		while: 
			lw $t4, 0($a3)
			beq $t0, $t6, replex
			
			beq $a2, $t4, swap
		cont:
		
			addi $t0, $t0, 4
			addi $a3, $a3, 4
			
			j while
		swap:	sw $a0, 0($a3)  
			j cont
		replex: lw $a0, y
			la $a3, arr
			lw $a1, length
			lw $a2, x
		
			jr $ra
		
	print: 
			addi $t9, $t9, 4
		
			mul $t8, $a1, 4
		
			li $v0, 1
			lw $a0, 0($a3)
			syscall
		
			li $v0, 11
			la $a0, 32
			syscall
			beq $t9, $t8, loopex
			addi $a3, $a3, 4
			j print 
		loopex:	la $a0, line  
			addi $v0, $zero, 4
			syscall 
			addi $t9, $zero, 0
			lw $a1, length
			lw $a0, y
			la $a3, arr
			jr $ra 
	
		
		
		




















	
