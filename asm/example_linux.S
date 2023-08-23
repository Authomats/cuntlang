
      .global main

      .text
main:
      push       %rax
      leaq       .msg(%rip), %rdi
      xorq       %rax, %rax
      callq      printf@plt
      pop        %rax
      ret


      .data
.msg:       .asciz      "hello, cuntlang!\n"
