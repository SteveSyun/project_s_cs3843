	.file	"assign.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	function1
	.type	function1, @function
function1:
.LFB25:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovge	%edi, %eax
	ret
	.cfi_endproc
.LFE25:
	.size	function1, .-function1
	.globl	function2
	.type	function2, @function
function2:
.LFB26:
	.cfi_startproc
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovge	%edi, %eax
	ret
	.cfi_endproc
.LFE26:
	.size	function2, .-function2
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
