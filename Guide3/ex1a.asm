# Mapa de Registos
# $t0 : soma
# $t1 : value
# $t2 : i
.data
.eqv	print_string, 4
.eqv	read_int, 5
.eqv 	print_int10, 1
str1: .asciiz "Introduza um numero: "
str2: .asciiz "Valor ignorado\n"
str3: .asciiz "A soma dos positivos é: "
.text
.globl main
main:
	li	$t2, 0	# i = 0
	li	$t0, 0 	# soma = 0
for:	
	bge	$t2, 5, endfor	# for( i < 5)
	la	$a0, str1	# $a0 = &str1
	li	$v0, print_string
	syscall			# print_string(str1)
	li	$v0, read_int	
	syscall			# $v0 = read_int()
	move	$t1, $v0	# $t1 = $v0
if:
	blez	$t1, else	# if (value > 0)
	add	$t0, $t0, $t1	# soma = soma + value
	addi	$t2, $t2, 1	# i++
	j for
else:
	la	$a0, str2	# $a0 = &str2
	li	$v0, print_string
	syscall			# print_string(str2)
	addi	$t2, $t2, 1	# i++
	j for
endfor:
	la	$a0, str3	# $a0 = &str3
	li	$v0, print_string
	syscall			#print_string(str3)
	move	$a0, $t0	# $a0 = soma
	li	$v0, print_int10
	syscall			# print_int10(soma)
	jr $ra  		# fim do programa
	