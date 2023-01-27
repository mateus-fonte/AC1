# Mapa de registos
# value : $t0
# bit   : $t1
# i     : $t2
.data
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz "\nO valor em binario �: "
.eqv	print_string, 4
.eqv	read_int,     5
.eqv	print_char,   11
.text
.globl main
main:
	la	$a0, str1
	li	$v0, print_string
	syscall
	li	$v0, read_int
	syscall
	move	$t0, $v0
	la	$a0, str2
	li	$v0, print_string
	syscall
	li	$t2, 0
for:
	bge	$t2, 32, endfor
	andi	$t1, $t0, 0x80000000
if:	
	beqz	$t1, else
	li	$a0, '1'
	li	$v0, print_char
	syscall
	
	j endif
else:
	li	$a0, '0'
	li	$v0, print_char
	syscall
	
endif:
	sll	$t0, $t0, 1
	addi	$t2, $t2, 1
	j for
endfor:
	jr $ra
