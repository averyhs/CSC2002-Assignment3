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
	la $a0, bfr # Load empty byte space into a0
	li $a1, 4 # Load size of byte space to allot into a1
	
	syscall # Read input
	la $t0, bfr # Store input in temp register
	
	li $v0, 4 # Load print_string opcode into $vo
	li $v0, 4 # Print entered value
	syscall

.data
	msg1: .asciiz "Enter a series of 5 formulae:\n"
	bfr: .space 10