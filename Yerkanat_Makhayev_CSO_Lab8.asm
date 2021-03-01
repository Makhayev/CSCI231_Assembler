.data
	Display: .space 0x10000 #128*128*4
	DisplayWidth: .word 128
	DisplayHeight: .word 128
	Red: .word 16711680
	Green: .word 65280
	prompt: .asciiz "Hello, please enter "
	a1: .float 30.0
	b1: .float 50.0
	a2: .float 50.0
	b2: .float 30.0
	
.text
	main:
		lwc1 $f12, a1
		lwc1 $f14, b1
		li $a0, 64
		li $a1, 64
		lw $a2, Green
		jal drawEllipse
	
		lwc1 $f12, a2
		lwc1 $f14, b2
		li $a0, 64
		li $a1, 64
		lw $a2, Red
		jal drawEllipse
		
		
	endprog:
		li $v0, 10
		syscall	
	
	
	drawEllipse:
	#	a0 a1 == center, f12 f14 a and b a2 color
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		li $s7, 0
		mtc1 $s7, $f18
		cvt.s.w $f4, $f18

		li $s7, 0
		mtc1 $s7, $f18
		cvt.s.w $f5, $f18

		mtc1 $a0, $f18 #center
		cvt.s.w $f6, $f18
		mtc1 $a0, $f18 #center
		cvt.s.w $f7, $f18 
		mul.s $f12, $f12, $f12 # a^2
		mul.s $f14, $f14, $f14 # b^2
		
		li $s6, 1
		mtc1 $s6, $f18
		cvt.s.w $f13, $f18
		
		li $s5, 0
		mtc1 $s5, $f18
		cvt.s.w $f19, $f18
		
		li $s5, 254
		mtc1 $s5, $f18
		cvt.s.w $f16, $f18
		# start value of x in f4, start value of y in f5, start value of center in f6 and f7
	loop:	
		sub.s $f10, $f4, $f6
		mul.s $f10, $f10, $f10
		div.s $f10, $f10, $f12
		
		sub.s $f10, $f13, $f10
		c.lt.s $f10, $f19
		bc1t after
		mul.s $f10, $f10, $f14
		sqrt.s $f15, $f10
		
		add.s $f10, $f15, $f7
		
		cvt.w.s $f16, $f10 
		cvt.w.s $f17, $f4
		mfc1 $a0, $f17
		mfc1 $a1, $f16
		jal set_pixel_color
		
		li $t8, 128
		sub $a1, $t8, $a1 
		jal set_pixel_color
	after:	
		add.s $f4, $f4, $f13
		cvt.w.s $f17, $f4
		mfc1 $s4, $f17
		beq $s4, $s5, endloop
		j loop
		
		
		
	
	
	endloop:
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra
	
	
	set_pixel_color:
		
		beq $s4, $s5, endprog
		lw $t0, DisplayWidth
		mul $t0, $t0, $a1
		add $t0, $t0, $a0
		sll $t0, $t0, 2
		la $t1, Display
		add $t1, $t1, $t0
		sw $a2, ($t1)
		jr $ra
