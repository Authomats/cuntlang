
      .global main

      .text
main:
      pushq       %rbp
      movq        %rsp, %rbp
#
      movsd       .float_five(%rip), %xmm0
      callq       divByTwo
      callq       printNumber
#
      popq        %rbp
      ret


# number (f32) in xmm0
printNumber:
      pushq       %rbp
      movq        %rsp, %rbp
#
      leaq        .fmt_printNumber(%rip), %rdi
      movb        $1, %al
      callq       printf@plt
#
      popq        %rbp
      ret


# number (f32) in xmm0
divByTwo:
      pushq       %rbp
      movq        %rsp, %rbp
#
      movsd       .float_two(%rip), %xmm1
      divsd       %xmm1, %xmm0
#
      popq        %rbp
      ret



      .data
# zero-terminated string
.fmt_printNumber:       .asciz      "%f\n"
# double
.float_two:             .quad       2.0
.float_five:            .quad       5.0
