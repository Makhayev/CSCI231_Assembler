.data
	arr: .word 2 3 7 8 5 4 2
	length: .word 7
	index: .word 1
	char: .asciiz " "
.text
	main:
		la $t1, arr
		lw $t2, length
		lw $t3, index
		move $a0, $t1
		move $a1, $t3
		
		jal swap 
		
		li $v0, 10
		syscall
	
	swap:
		
		lw $t6, 0($a0)
		
		lw $t5, 4($a0)
		
		sw $t5, 0($a0)
		
		addi $a0, $a0, 4
		
		sw $t6, ($a0)
		subi $a0, $a0, 4
		la $t8, ($a0)
		
	printf: 
		
		li $v0, 1
		lw $a0, 0($t8)
		syscall
		
		li $v0, 11
		lw $a0, char
		syscall
		addi $t8, $t8, 4
		addi $t7, $t7, 1
		beq $t7, $t2, end
		j printf
	end:
		
		
		jr $ra
	





