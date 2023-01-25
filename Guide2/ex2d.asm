#Mapa de registos
# gray : $t0
# num  : $t1
# bin  : $t2

.data
.text
.globl main
main:
	li	$t0, 0x3	# $t0 = 0x2		gray = 0x3;
	move	$t1, $t0	# $t1 = $t0 		num = gray
	srl	$t3, $t1, 4 	# $t3 = $t1 >> 4	$t3 = num >> 4
	xor	$t1, $t0, $t3	# $t1 = $t0 xor $t3	num = num ^ ($t3)
	srl	$t3, $t1, 2     # $t3 = num >> 2
	xor	$t1, $t1, $t3   # num = num ^ (num >> 2)
	srl 	$t3, $t1, 1	# $t3 = num >> 1
	xor 	$t1, $t1, $t3   # num = num ^ (num >> 1)
	move 	$t2, $t1	# bin = num 
	jr 	$ra			#end of the program