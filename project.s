        .file   "project.c"
        .text
        .globl  power
        .type   power, @function
power:
        pushl   %ebp
        movl    %esp, %ebp
        pushl   %ebx
        # INSERT YOUR CODE HERE
        # USE REGISTERS FOR LOCAL VARIABLES
        movl    8(%ebp), %ecx       #x
        movl    12(%ebp), %edx      #i
        movl    $1, %eax            #tmp =1
        movl    $0, %ebx            #j=0
.L1:
        cmpl    %ebx, %edx           # while(j!=i)
        jle     .L3
        imull   %ecx, %eax
        addl    $1, %ebx      
        jmp     .L1   
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
        pushl   %edi
        pushl   %esi
        pushl   %ebx

        # INSERT YOUR CODE HERE
        # USE REGISTERS FOR LOCAL VARIABLES
        subl    $8, %esp
        movl    16(%ebp), %edi  #i
        testl   %edi, %edi
        jle     .L6
        movl    $0 , %esi       #j
.L5:   
        movl    %esi, 4(%esp) 
        movl    8(%ebp), %eax   #x
        movl    12(%ebp), %ebx  #a[]
        movl    %eax, (%esp)
        call    power
        movl    %eax, (%ebx, %esi, 4)
        incl    %esi
        cmpl    %esi, %edi
        jg     .L5
.L6:
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
        pushl   %esi
        pushl   %edi
        # INSERT YOUR CODE HERE
        # USE REGISTERS FOR LOCAL VARIABLES
        movl    8(%ebp), %eax   #x
        movl    12(%ebp), %edx  #a[]
        movl    16(%ebp), %ecx  #n
        movl    $1 , %esi    #tmp=1
        movl    $1 , %edi
        movl    %esi, (%edx)
.L8:
        cmpl    %edi, %ecx
        jle      .L9
        imull   %eax, %esi
        movl    %esi, (%edx, %edi, 4)
        addl     $1, %edi
        jmp     .L8
.L9:
        popl    %edi
        popl    %esi
        popl    %ebp
        ret
        .size   fillarray2, .-fillarray2
        .globl  compare
        .type   compare, @function
compare:
        pushl   %ebp
        movl    %esp, %ebp
        pushl   %esi
        pushl   %ebx
        pushl   %edi
        # INSERT YOUR CODE HERE
        # USE REGISTERS FOR LOCAL VARIABLES
        movl    8(%ebp), %edi   #a[]
        movl    12(%ebp), %edx  #b[]
        movl    16(%ebp), %ecx  #N
        testl   %ecx, %ecx
        jle     .L12
        movl    (%edi), %eax
        movl    $0, %esi    #i=0
        cmpl    (%edx), %eax
        je      .L13
        jmp     .L15
.L10:
        movl    (%edi, %esi, 4), %eax
        cmpl   (%edx, %esi, 4), %eax
        jne     .L15
.L13:
        addl    $1, %esi
        cmpl    %esi, %ecx
        jg      .L10
        jmp     .L12
.L15:
        movl    $0, %eax
        jmp     .L11
.L12:
        movl    $1, %eax
.L11:
        popl    %edi
        popl    %ebx
        popl    %esi
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
       # leal     112(%esp), %eax
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
