#void reverse(char String[], int length) {
#char stack[length]; 
#for (int t3 = 0; t3 < length; t3++) { 
#	stack[t3] = S[t3];
#}
#
#for (int t5=0; t5 <= length; t5++) {
#	S[t5] = stack[length - t5 - 1];
#}
#printf("%s", String);
#}
#
#int main() {
#char S[] = {'C', 'S', 'C', 'I', '2', '3', '1'};
#int length = 7;
#reverse(S, length);
#return 0;
#}
.data
	S: .asciiz "CSCI 231"
	length: .word 8
	
.text
	main: 
	
		
		la $a2, S	 		#char S[] = {'C', 'S', 'C', 'I', '2', '3', '1'};
		lw $a3, length			#int length = 7;
		
		jal reverse			# reverse(S, length);
		
		
		
		
		li $v0, 10			#return 0;
		syscall
		
	reverse:				#void reverse(char String[], int length) {
						#char stack[length]; 
					
	loop:					# // I used stack as temporary String to store characters from S
		addi $sp, $sp, -4		
		lbu $t2, 0($a2)			# for (int t3 = 0; t3 < length; t3++) { 
		sb $t2, 0($sp)			#	stack[t3] = S[t3];
		addi $a2, $a2, 1		#}
		addi $t3, $t3, 1		#}
		beq $t3, $a3, next		
		
		j loop
	
	next:	
		sub $a2, $a2, $t3		#
		
	loopik:	lbu $t4, 0($sp) 		#
		sb $t4, 0($a2)			#for (int t5=0; t5 <= length; t5++) {
		addi $a2, $a2, 1		#	S[t5] = stack[length - t5 - 1]; // -1 is required in C because the address begins from 0
		addi $sp, $sp, 4		#		
		addi $t5, $t5, 1		#}
		beq $t5, $a3, nextik		#
		j loopik
		
	nextik: 
		li $v0, 4			
		la $a0, S			#printf("%s", String);
		syscall
		
		jr $ra
		
		
		
		
		
		
		
		
		
