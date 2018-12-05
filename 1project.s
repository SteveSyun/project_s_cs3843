	.file	"1project.c"
	.text
.globl power
	.type	power, @function
power:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	movl	$0, %edx
	movl	$1, %eax
	testl	%ecx, %ecx
	jle	.L3
.L6:
	imull	%ebx, %eax
	addl	$1, %edx
	cmpl	%edx, %ecx
	jg	.L6
.L3:
	popl	%ebx
	popl	%ebp
	ret
	.size	power, .-power
.globl fillarray
	.type	fillarray, @function
fillarray:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$8, %esp
	movl	12(%ebp), %edi
	movl	16(%ebp), %esi
	testl	%esi, %esi
	jle	.L11
	movl	$0, %ebx
.L10:
	movl	%ebx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	power
	movl	%eax, (%edi,%ebx,4)
	addl	$1, %ebx
	cmpl	%ebx, %esi
	jg	.L10
.L11:
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	fillarray, .-fillarray
.globl fillarray2
	.type	fillarray2, @function
fillarray2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %esi
	movl	12(%ebp), %ebx
	movl	16(%ebp), %ecx
	movl	$1, (%ebx)
	cmpl	$1, %ecx
	jle	.L16
	movl	$1, %eax
	movl	$1, %edx
.L15:
	imull	%esi, %edx
	movl	%edx, (%ebx,%eax,4)
	addl	$1, %eax
	cmpl	%eax, %ecx
	jg	.L15
.L16:
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.size	fillarray2, .-fillarray2
.globl compare
	.type	compare, @function
compare:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %esi
	movl	12(%ebp), %ebx
	movl	16(%ebp), %ecx
	testl	%ecx, %ecx
	jle	.L19
	movl	(%esi), %eax
	movl	$0, %edx
	cmpl	(%ebx), %eax
	je	.L21
	jmp	.L20
.L22:
	movl	(%esi,%edx,4), %eax
	cmpl	(%ebx,%edx,4), %eax
	jne	.L20
.L21:
	addl	$1, %edx
	cmpl	%edx, %ecx
	.p2align 4,,3
	.p2align 3
	jg	.L22
	.p2align 4,,3
	.p2align 3
	jmp	.L19
.L20:
	movl	$0, %eax
	.p2align 4,,5
	.p2align 3
	jmp	.L23
.L19:
	movl	$1, %eax
.L23:
	popl	%ebx
	popl	%esi
	popl	%ebp
	.p2align 4,,4
	.p2align 3
	ret
	.size	compare, .-compare
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w= %d\n"
.LC1:
	.string	"array[%d]=%d\n"
.LC2:
	.string	"check=%d"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	subl	$108, %esp
	movl	$9, 4(%esp)
	movl	$2, (%esp)
	call	power
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$10, 8(%esp)
	leal	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$2, (%esp)
	call	fillarray
	movl	$10, 8(%esp)
	leal	-92(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$2, (%esp)
	call	fillarray2
	movl	$0, %ebx
	leal	-92(%ebp), %esi
.L26:
	movl	(%esi,%ebx,4), %eax
	movl	%eax, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	addl	$1, %ebx
	cmpl	$11, %ebx
	jne	.L26
	movl	$10, 8(%esp)
	leal	-92(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-52(%ebp), %eax
	movl	%eax, (%esp)
	call	compare
	movl	%eax, 8(%esp)
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$0, %eax
	addl	$108, %esp
	popl	%ecx
	popl	%ebx
	popl	%esi
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
	.section	.note.GNU-stack,"",@progbits
