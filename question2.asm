# ======================== #
#  CSC2002 Assignment 3    #
#  HRRHAN002               #
# ======================== #

.text
main:
	# Start the program
	
	li   $v0, 4       # Load print_string opcode
	la   $a0, msg1    # Load message
	syscall           # Print
	
	li   $v0, 8       # Load read_string opcode
	li   $a1, 10      # Set buffer size
	la   $a0, bfr     # Load buffer
	syscall           # Read
	
	la   $t0, bfr      # Store input string
	li   $t7, 0        # Initialize int value for conversion

get_prefix:
	lb   $t1, ($t0)    # Get first char (prefix)
	addu $t0, $t0, 1   # Skip past prefix

convert_loop:
	lb   $t1, ($t0)    # Load current byte
	addu $t0, $t0, 1   # Increment position of curr byte
	beq  $t1, 10, add5 # Exit if current byte is \n
	
	# String to int conversion logic
	mul  $t7, $t7, 10
	sub  $t1, $t1, '0'
	add  $t7, $t7, $t1
	
	j    convert_loop  # Jump to beginning of loop

add5:
	addi $t7, $t7, 5   # Add 5 to input int

display_out:
	li   $v0, 4       # Load print_string opcode
	la   $a0, msg2    # Load message
	syscall           # Print
	
	li   $v0, 1       # Load print_int opcode
	move $a0, $t7     # Load int value
	syscall           # Print

exit:
	li  $v0, 10        # Load exit opcode
	syscall            # Exit

.data
	msg1: .asciiz "Enter a string:\n"
	msg2: .asciiz "The value +5 is:\n"
	
	bfr: .space 10