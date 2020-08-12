
################# Data segment #####################
.data
EnterNum: .asciiz "\nPlease enter a number\n"
BiggestNum: .asciiz "\nThe biggest number out of the three is:"
.macro printString(%str)
la $a0, %str
li $v0,4
syscall
.end_macro

.macro printNum
li $v0,1
syscall
.end_macro

.macro nextInt
li $v0,5
syscall
.end_macro

.macro sortBiggest(%$a2,%$a1)
bgt %$a2,%$a1,Label
add $t3,%$a1,$zero
Label: add $t3,%$a2,$zero
.end_macro

.macro end_program
li $v0, 10
syscall
.end_macro
           
################# Code segment #####################
.text
.globl main
main:

printString EnterNum

nextInt

move $t1,$v0

printString EnterNum

nextInt

move $t2,$v0

sortBiggest($t1,$t2)

printString EnterNum

nextInt

move $t4,$v0

sortBiggest($t4,$t2)

printString BiggestNum

move $a0,$t3

printNum

end_program

	
