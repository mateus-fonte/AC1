# Mapa de registos
# value : $t0
# bit   : $t1
# i     : $t2
.data
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz "\nO valor em binario é: "
.eqv	print_string, 4
.eqv	read_int,     5
.eqv	print_char,   11
.text
.globl main
main:
	la	$a0, str1		# $a0 = &str1
	li	$v0, print_string
	syscall				# print_string(str1)
	li	$v0, read_int		
	syscall				# $v0 = read_int()
	move	$t0, $v0		# value = $v0
	la	$a0, str2		# $a0 = str2
	li	$v0, print_string	#
	syscall				# print_string(str2)
	li	$t2, 0			# i = 0
for:
	bge	$t2, 32, endfor		#  for (i < 32)
if4:	
	rem	$t4, $t2, 4		# $t4 = i % 4
	bnez	$t4, endif4		# if (i % 4 == 0)
	li	$a0, ' '		# $a0 = ' '
	li 	$v0, print_char		# print_char(' ')
	syscall
endif4:
	andi	$t1, $t0, 0x80000000	# bit = value & 0x80000000
	
if:	
	beqz	$t1, else		# if (bit != 0)
	li	$a0, '1'		# $a0 = '1'
	li	$v0, print_char		# print_char('1')
	syscall
	
	j endif
else:
	li	$a0, '0'		# $a0 = '0'
	li	$v0, print_char		
	syscall				# print_char('0')
	
endif:					
	sll	$t0, $t0, 1		# value = value << 1
	addi	$t2, $t2, 1		# i++
	j for
endfor:
	jr $ra				#fim do programa

	
