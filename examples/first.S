
# symbols allowing for external linkage
.global main


# cstd functions
.extern printf



      .text
# macros
.macro      setup
      pushq       %rbp
      movq        %rsp, %rbp
.endm


.macro      return
      popq        %rbp
      ret
.endm


# c style main-function
main:
      setup
      movsd       .float_five(%rip), %xmm0
      cvtsd2si    %xmm0, %rax
      pushq       %rax
      callq       divByTwo
      callq       printNumber
      popq        %rax
      cvtsi2sd    %rax, %xmm0
      return


# print double to stdout
# number (f32) in xmm0
printNumber:
      setup
      subq        $8, %rsp
      leaq        .fmt_printNumber(%rip), %rdi
      movb        $1, %al
      callq       printf@plt
      addq        $8, %rsp
      return


# divide double by two
# number (f32) in xmm0
divByTwo:
      setup
      movsd       .float_two(%rip), %xmm1
      divsd       %xmm1, %xmm0
      return


      .data
# zero-terminated string
.fmt_printNumber:       .asciz      "%f\n"
# double
.float_two:             .quad       2.0
.float_five:            .quad       5.0
