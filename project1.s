        .file   "project.c"
        .text
        .globl  power
        .type   power, @function
power:
        pushl   %ebp
        movl    %esp, %ebp
        # INSERT YOUR CODE HERE
        # USE REGISTERS FOR LOCAL VARIABLES
        pushl   %ebx
        movl    8(%ebp), %ebx
        movl    12(%ebp), %ecx
        movl    $0, %edx
        movl    $1, %eax
        testl   %ecx, %ecx
        jle     .L3
.L6:
        imull   %ebx, %eax
        leal    1(%edx), %edx
        cmpl    %edx, %ecx
        jg      .L6
.L3:
        popl    %ebx 
        popl    %ebp
        ret
        .size   power, .-power
        .globl  fillarray
        .type   fillarray, @function
fillarray:
        pushl   %ebp
        movl    %esp, %ebp
        # INSERT YOUR CODE HERE
        # USE REGISTERS FOR LOCAL VARIABLES
        pushl   %edi
        pushl   %esi
        pushl   %ebx
        addl    $-8, %esp
        movl    12(%ebp), %edi
        movl    16(%ebp), %esi
        testl   %esi, %esi
        jle     .L11
        movl    $0, %ebx
.L10:
        movl    %ebx, 4(%esp)
        movl    8(%ebp), %eax
        movl    %eax, (%esp)
        call    power
        movl    %eax, (%edi,%ebx,4)
        leal    1(%ebx), %ebx
        cmpl    %ebx, %esi
        jg      .L10
.L11:
        addl    $8, %esp
        popl    %ebx
        popl    %esi
        popl    %edi
        popl    %ebp
        ret
        .size   fillarray, .-fillarray
        .globl  fillarray2
        .type   fillarray2, @function
fillarray2:
        pushl   %ebp
        movl    %esp, %ebp
        # USE REGISTERS FOR LOCAL VARIABLES
        # INSERT YOUR CODE HERE
        pushl   %esi
        pushl   %edi
        movl    8(%ebp), %esi
        movl    12(%ebp), %edi
        movl    16(%ebp), %ecx
        movl    $1, (%edi)
        cmpl    $1, %ecx
        jle     .L16
        movl    $1, %eax
        movl    $1, %edx
.L15:
        imull   %esi, %edx
        movl    %edx, (%edi,%eax,4)
        addl    $1, %eax
        cmpl    %eax, %ecx
        jg      .L15
.L16:
        popl    %esi
        popl    %edi 
        popl    %ebp
        ret
        .size   fillarray2, .-fillarray2
        .globl  compare
        .type   compare, @function
compare:
        pushl   %ebp
        movl    %esp, %ebp
        pushl   %ebx
        pushl   %edi
        # INSERT YOUR CODE HERE
        # USE REGISTERS FOR LOCAL VARIABLES
        movl    8(%ebp), %edi
        movl    12(%ebp), %ebx
        movl    16(%ebp), %ecx
        testl   %ecx, %ecx
        jle     .L26
        movl    (%edi), %eax
        movl    $0, %edx
        cmpl    (%ebx), %eax
        je      .L28
        jmp     .L27
.L29:
        movl    (%edi,%edx,4), %eax
        cmpl    (%ebx,%edx,4), %eax
        jne     .L27
.L28:
       leal    1(%edx), %edx
       cmpl    %edx, %ecx
       jg      .L29
       jmp     .L26
.L27:
       movl    $0, %eax
       jmp     .L30
.L26:
       movl    $1, %eax
.L30:
       popl    %edi
       popl    %ebx 
       popl    %ebp
       ret
        .size   compare, .-compare
        .section        .rodata
.LC0:
        .string "fillarray(2,a,10) correct"
.LC1:
        .string "fillarray(2,a,10) inccrrect"
.LC2:
        .string "fillarray2(2,b,10) correct"
.LC3:
        .string "fillarray2(2,b,10) incorrect"
.LC4:
        .string "fillarray(3,a,10) correct"
.LC5:
        .string "fillarray(3,a,10) incorrect"
.LC6:
        .string "fillarray2(3,b,10) correct"
.LC7:
        .string "fillarray2(3,b,10) incorrect"
        .text
        .globl  main
        .type   main, @function
main:
        pushl   %ebp
        movl    %esp, %ebp
        andl    $-16, %esp
        subl    $192, %esp
        movl    $2, 28(%esp)
        movl    $1, 112(%esp)
        movl    $2, 116(%esp)
        movl    $4, 120(%esp)
        movl    $8, 124(%esp)
        movl    $16, 128(%esp)
        movl    $32, 132(%esp)
        movl    $64, 136(%esp)
        movl    $128, 140(%esp)
        movl    $256, 144(%esp)
        movl    $512, 148(%esp)
        movl    $1, 152(%esp)
        movl    $3, 156(%esp)
        movl    $9, 160(%esp)
        movl    $27, 164(%esp)
        movl    $81, 168(%esp)
        movl    $243, 172(%esp)
        movl    $729, 176(%esp)
        movl    $2187, 180(%esp)
        movl    $6561, 184(%esp)
        movl    $19683, 188(%esp)
        movl    $10, 8(%esp)
        leal    32(%esp), %eax
        movl    %eax, 4(%esp)
        movl    28(%esp), %eax
        movl    %eax, (%esp)
        call    fillarray
        movl    $10, 8(%esp)
        leal    112(%esp), %eax
        movl    %eax, 4(%esp)
        leal    32(%esp), %eax
        movl    %eax, (%esp)
        call    compare
        cmpl    $1, %eax
        jne     .L17
        movl    $.LC0, (%esp)
        call    puts
        jmp     .L18
.L17:
        movl    $.LC1, (%esp)
        call    puts
.L18:
        movl    $10, 8(%esp)
        leal    72(%esp), %eax
        movl    %eax, 4(%esp)
        movl    28(%esp), %eax
        movl    %eax, (%esp)
        call    fillarray2
        movl    $10, 8(%esp)
        leal    112(%esp), %eax
        movl    %eax, 4(%esp)
        leal    72(%esp), %eax
        movl    %eax, (%esp)
        call    compare
        cmpl    $1, %eax
        jne     .L19
        movl    $.LC2, (%esp)
        call    puts
        jmp     .L20
.L19:
        movl    $.LC3, (%esp)
        call    puts
.L20:
        movl    $3, 28(%esp)
        movl    $10, 8(%esp)
        leal    32(%esp), %eax
        movl    %eax, 4(%esp)
        movl    28(%esp), %eax
        movl    %eax, (%esp)
        call    fillarray
        movl    $10, 8(%esp)
        leal    152(%esp), %eax
        movl    %eax, 4(%esp)
        leal    32(%esp), %eax
        movl    %eax, (%esp)
        call    compare
        cmpl    $1, %eax
        jne     .L21
        movl    $.LC4, (%esp)
        call    puts
        jmp     .L22
.L21:
        movl    $.LC5, (%esp)
        call    puts
.L22:
        movl    $10, 8(%esp)
        leal    72(%esp), %eax
        movl    %eax, 4(%esp)
        movl    28(%esp), %eax
        movl    %eax, (%esp)
        call    fillarray2
        movl    $10, 8(%esp)
        leal    152(%esp), %eax
        movl    %eax, 4(%esp)
        leal    72(%esp), %eax
        movl    %eax, (%esp)
        call    compare
        cmpl    $1, %eax
        jne     .L23
        movl    $.LC6, (%esp)
        call    puts
        jmp     .L25
.L23:
        movl    $.LC7, (%esp)
        call    puts
.L25:
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
        .section        .note.GNU-stack,"",@progbits
