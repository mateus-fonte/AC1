.data
str1:	.asciiz "Introduza 2 numeros\n"
str2:	.asciiz	"A soma dos dois numeros e:"
	.eqv	print_string, 4
	.eqv	read_int,     5
	.eqv	print_int10,  1
.text
.globl main

main:
	la	$a0, str1		# $a0 = &str1
	li	$v0, print_string	# $v0 = print_string()
	syscall				# print_string($a0)
	li	$v0, read_int		# $v0 = read_int()
	syscall				
	move 	$t0, $v0		# $t0 = $v0
	li	$v0, read_int		# $v0 = read_int()
	syscall
	move 	$t1, $v0		# $t1 = $v0
	la 	$a0, str2		# $a0 = &str2
	li	$v0, print_string	# $v0 = print_string()
	syscall
	add	$a0, $t0, $t1		# $a0 = $t0 + $t1
	li	$v0, print_int10
	syscall				# print_int10(a + b)
	
	jr $ra
	