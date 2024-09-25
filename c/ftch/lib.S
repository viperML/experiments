# Need to make it global so it can be accessed in another file with extern
.global integrate
.global myexit

# Cannot hurt to define it as a function type, sometimes useful for dynamic linking, see comments in: https://stackoverflow.com/questions/65837016/how-to-call-a-function-in-an-external-assembly-file#comment116408928_65837016
.type integrate, @function
.type myexit, @function

integrate:
    # int integrate(int from /*EDI*/,  int to /*ESI*/)
    # INPUT:
    #   the first parameter `from` is contained in %edi, the int-sized low half of %rdi
    #   the second parameter `to`  is contained in %esi
    # OUTPUT:
    #   return is passed in %eax;
    #      you can leave garbage in the high half of RAX if convenient

    lea  123(%rdi, %rsi), %ecx         # from + to + 123 just for example
    # (main work of function done)

    mov %ecx, %eax # it seems your return value is in %ecx
                   # but we need it in %eax for the return value to C
     # or just use EAX instead of ECX in the first place to avoid this instruction
    ret

myexit:
    mov $60, %rax
    mov $7, %rdi
    syscall
