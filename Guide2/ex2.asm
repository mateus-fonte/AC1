.data
.text
.globl main
main:
	li	$t0, 0x12345678	# $t0 = 0x12345678, é uma função virtual, decomposta em duas instruções nativas
	sll	$t2, $t0, 1	# $t2 = $t0 << 1
	srl	$t3, $t0, 1	# $t3 = $t0 >> 1
	sra	$t4, $t0, 1	# $t4 = $t0 >> 1
	jr $ra
	
	# sll ---> realizes a multiplication >> 1 multiplies by 2
	# srl ---> divides by potencies of 2
	# sra ---> divides by potencies of 2
	