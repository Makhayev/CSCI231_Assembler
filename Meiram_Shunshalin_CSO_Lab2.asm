.data
	Arr:	.word	20 20 51 83 20 20 20	# int Arr = {21,​20​,51,83,​20​,​20};
	length:	.word	6			# int length = 6;
	x:	.word	20			# int x = 20;
	y:	.word	5			# int y = 5;
	index:	.word	0			# int index = 0;
	
	space:	.byte	' '
	
.text
	la	$s0,	Arr
	lw	$s1,	length
	lw	$s2,	x
	lw	$s3,	y
	lw	$s4,	index
	# in case if index is not initialised or not equal to 0
	addi	$s4,	$zero,	0		# index = 0:
		
	Loop:	# do {
		# 	if (Arr[index] == x) {
		#		Arr[index] = y;
		#	}	
		add	$t0,	$s4,	$zero
		sll	$t0,	$t0	2
		add	$t0,	$t0,	$s0
		lw	$s5,	0($t0)
		bne	$s5,	$s2,	exit
		sw	$s3,	0($t0)
		exit:
		
		addi	$s4,	$s4,	1	# index++;
		
		# } while (index < length)
		slt	$t0,	$s4,	$s1
		beq	$zero,	$t0,	Exit
		j	Loop			# go to loop
	Exit:
	
	addi	$s4,	$zero,	0		# index = 0;
	
	loop:	# do {
		#	printf("%i", Arr[i]);  
		add	$t0,	$s4,	$zero
		sll	$t0,	$t0,	2
		add	$t0,	$t0,	$s0
		li	$v0,	1
		lw	$a0,	0($t0)
		syscall
		
		addi	$s4,	$s4,	1	# index++;
		
		# } while(index < length)
		slt	$t0,	$s4,	$s1
		beq	$zero,	$t0,	Exit1	
		li	$v0,	4		# for the space between entries
		la	$a0,	space
		syscall	
		j	loop			# go to loop
	Exit1:
