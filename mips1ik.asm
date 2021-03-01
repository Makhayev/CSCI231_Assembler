.data
numbers: .word 0x88776655
.text
	la  $a0,numbers
	addi $t0,$zero,4
	add  $v0,$zero,$zero
loop:	lbu  $s0,0($a0)
	sub  $v0,$v0,$s0
	lb   $s0,0($a0)
	add  $v0,$v0,$s0
	addi $a0,$a0,1
	subi $t0,$t0,1
	bne  $t0,$zero,loop
	addi $t8, $v0, 0
	
	