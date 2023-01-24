.data			#diretiva assembly
.text			
.globl main
main:	
		li 	$v0, 5		# load imidiate $v0 = 5
		syscall			# $v0 = read_int()
		or 	$t0, $0, $v0	# $t0 = $v0
		ori	$t2, $0, 8 	# $t2 = 8
		add 	$t1, $t0, $t0	# $t1 = $t0 + $t0 (2*$t0) ---> $t1 = 3 + 3 = 6
		sub	$t1, $t1, $t2   # $t1 = $t1 + $t2	  ---> $t1 = 6 + 8 = 14
		or 	$a0, $0, $t1	# $a0 = $t1
		li 	$v0, 1		# print_int10($a0)
		syscall
		
		jr	$ra		#fim do programa
		