.data
	prompt: .asciiz "Please enter a number in degrees"
	pi: .float 3.1415927
	oneeighty: .float 180.0
	newline: .asciiz "\n"

.text
	main:
		li $v0, 4
		la $a0, prompt
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall
		
		li $v0, 5
		syscall
		
		li $s3, -1
		
		beq $v0, $s3, finalend
		
		move $t0, $v0
		
		mtc1 $t0, $f8
		cvt.s.w $f7, $f8
		lwc1 $f9, pi
		mul.s $f7, $f7, $f9
		lwc1 $f9, oneeighty
		div.s $f7, $f7, $f9
		
		
		mov.s $f12, $f7
		
		jal cosine
		
		
		mov.s $f12, $f0
		li $v0, 2
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall
		
		j main
		
		
	cosine: 
		addi $sp, $sp, -4
		sw $ra, 0($sp)
	
		
		
		li $t2, 1
		li $t3, 2
		mtc1 $t2, $f4
		cvt.s.w $f20, $f4
		
		mov.s $f14, $f12
	
	cosloop:
	
		move $a1, $t3
		jal power 
		
		
		move $a0, $t3 
		
		jal factorial
		
		move $t9, $v0
		li $v0, 1
		move $a0, $t9
		#syscall
		
		li $v0, 4
		la $a0, newline
		#syscall
		
		mtc1 $t9, $f16
		
		cvt.s.w $f7, $f16
		div.s $f9, $f0, $f7 
		
		beq $t3, 2, minus
		beq $t3, 6, minus
		beq $t3, 10, minus
		
		
	plus:
		add.s $f20, $f20, $f9
	
		beq $t3, 12, loopend
		addi $t3, $t3, 2
		j cosloop
	minus:
		sub.s $f20, $f20, $f9
		beq $t3, 12, loopend
		addi $t3, $t3, 2
		j cosloop
	
	loopend:	
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		mov.s $f0, $f20
		jr $ra
	
	
	power:
		# f12 passing float, a1 passing int, f5 or f12 returning float
	#	lwc1 $f12, float
	#	li $a1, 4
		mov.s $f4, $f14
		move $t7, $a1
		mov.s $f5, $f4
		li $t6, 1
	loop1:	
	
		beq $t6, $t7, next1
		
		
		mul.s $f5, $f5, $f4
		addi $t6, $t6, 1
		j loop1
		
	next1:
		li $v0, 2
		mov.s $f12, $f5
		#syscall
		
		li $v0, 4
		la $a0, newline
		#syscall
		
		mov.s $f0, $f12
		
		jr $ra
		
		
	factorial:
		# passing a0 int
		subu $sp, $sp, 8
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		
		li $v0, 1
		beq $a0, 0, factnext
		
		move $s0, $a0
		sub $a0, $a0, 1
		jal factorial 
		
		mul $v0, $s0, $v0
		
		
	
	factnext:
		
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		addu $sp, $sp, 8
		
	#	move $t9, $v0
	#	li $v0, 1
	#	move $a0, $t9
	#	syscall
		
	#	li $v0, 4
	#	la $a0, newline
	#	syscall
		
		
		jr $ra
		
	finalend:
		
		li $v0, 10
		syscall
		
		
		
		
		
	
	
	
	
	
