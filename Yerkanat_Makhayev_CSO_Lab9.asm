.data

	array: .space 1024

.text
#Number of blocks: 4
#Cache Block Size: 8
#YOUR METRIC SCORE: 4986.88
#The reasons for my optimisation 
#In assembly code: just default code to execute the given task
#In the configurations of cache parameters: after many trials nd errors I have come up with this combination of parameters


		li $t0, 0
		li $t1, 1
		li $t2, 1024
		la $t3, array
		
	loop:	
		
		sb $t1, 0($t3)

		addi $t0, $t0, 1
		addi $t3, $t3, 1
		beq $t2, $t0, endloop
		j loop

	endloop:
	
		li $v0, 10
		syscall
		
	
	
