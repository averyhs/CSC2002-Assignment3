# ======================== #
#  CSC2002 Assignment 3    #
#  HRRHAN002               #
# ======================== #

.text
main:
	li $v0, 4 # Load print_string opcode into v0
	la $a0, msg1 # Load user prompt string into a0
	syscall # Print prompt
	
	li $v0, 8 # Load read_string opcode into v0
	li $a1, 10 # Load size of byte space to allot into a1
	
	# Reading and printing values is not in a loop because idk how
	# to change store address based on counter value
	
	# Value 1
	la $a0, bfr1 # Load empty byte space into a0
	syscall # Read input
	#la $t1, bfr1 # Store input in temp register
	
	# Value 2
	la $a0, bfr2
	syscall
	
	# Value 3
	la $a0, bfr3
	syscall
	
	# Value 4
	la $a0, bfr4
	syscall
	
	# Value 5
	la $a0, bfr5
	syscall
	
	li $v0, 4 # Load print_string opcode into $v0
	la $a0, msg2 # Load print back message string into a0
	syscall # Print
	
	# Value 1
	#move $a0, $t1 # Load value into $a0
	la $a0, bfr1 # Load value into $a0
	syscall # Print value
	
	# Value 2
	la $a0, bfr2
	syscall
	
	# Value 3
	la $a0, bfr3
	syscall
	
	# Value 4
	la $a0, bfr4
	syscall
	
	# Value 5
	la $a0, bfr5
	syscall

.data
	msg1: .asciiz "Enter a series of 5 formulae:\n"
	msg2: .asciiz "The values are:\n"
	
	bfr1: .space 10
	bfr2: .space 10
	bfr3: .space 10
	bfr4: .space 10
	bfr5: .space 10

