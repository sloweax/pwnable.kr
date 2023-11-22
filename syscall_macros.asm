%macro EXIT 1
        mov rdi, %1
        mov rax, 60
        syscall
%endmacro

%macro WRITE 3
        mov rdi, %1
        mov rsi, %2
        mov rdx, %3
        mov rax, 1
        syscall
%endmacro

%macro READ 3
        mov rdi, %1
        mov rsi, %2
        mov rdx, %3
        mov rax, 0
        syscall
%endmacro

%macro OPEN 3
        mov rdi, %1
        mov rsi, %2
        mov rdx, %3
        mov rax, 2
        syscall
%endmacro
