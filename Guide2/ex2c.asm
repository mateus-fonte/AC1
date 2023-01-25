.data
.text
.globl main
main:
	li	$t0, 0x2	# $t0 = 0x2
	srl	$t2, $t0, 1	# $t2 = $t0 >> 1
	xor	$t1, $t2, $t0	# $t1 = $t2 xor $ t0
	jr $ra			#end of the program