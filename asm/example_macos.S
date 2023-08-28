
      .global _main

      .text
_main:
      push       %rax
      leaq       .msg(%rip), %rdi
      xorq       %rax, %rax
      callq      _printf
      pop        %rax
      ret


      .data
.msg:       .asciz      "hello, cuntlang!\n"
