	.file	"assign3.c"
	.section	.rodata
.LC0:
	.string	"B[%d]=%d\n"
.LC1:
	.string	"Sum of 2 largest = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$64, %esp
	movl	$0, 20(%esp)
	jmp	.L2
.L3:
	movl	20(%esp), %eax
	imull	20(%esp), %eax
	imull	20(%esp), %eax
	leal	50(%eax), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	20(%esp), %edx
	movl	%eax, 24(%esp,%edx,4)
	addl	$1, 20(%esp)
.L2:
	cmpl	$9, 20(%esp)
	jle	.L3
	movl	$0, 20(%esp)
	jmp	.L4
.L5:
	movl	20(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	addl	$1, 20(%esp)
.L4:
	cmpl	$9, 20(%esp)
	jle	.L5
	leal	24(%esp), %eax
	movl	%eax, (%esp)
	call	function1
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	leave
	ret
	.size	main, .-main
	.globl	function1
	.type	function1, @function
function1:
        pushl   %ebp 
        movl    %esp,    %ebp
        pushl   %esi
        movl    8(%ebp), %esi
        movl    $0,      %edx
        movl    (%esi, %edx, 4), %eax
.L10:
        addl    $1, %edx
        cmpl    $10,      %edx
        jg     .L8
.L9:
        cmpl    (%esi, %edx, 4), %eax
        jle     .L10
        movl    (%esi, %edx, 4), %eax
        jmp     .L10
	# INSERT YOUR CODE HERE
	# DO NOT STORE LOCAL VARIABLES ON STACK
	# USE REGISTERS FOR LOCAL VARIABLES
.L8:
        popl    %esi
	leave
	ret
	.size	function1, .-function1
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
