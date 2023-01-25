.data
.text
.globl main
main:

	li	$t0, 0x2345	# $t0 = 5
	li	$t1, 0x1234	# $t1 = 6
	and	$t2, $t0, $t1	# $t2 = 6 and 5
	or	$t3, $t0, $t1	# $t3 = 6 or 5
	nor	$t4, $t0, $t1	# $t4 = 6 nor 5
	xor	$t5, $t0, $t1	# $t5 = 6 xor 5
	nor	$t0, $t0, $t0	# $t0 = not $t0
	jr $ra			# end of the program
	