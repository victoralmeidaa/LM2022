%include "asm_io.inc"

;   masn -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.C
;   gcc -o main driver.obj main.obj masm_io.obj

;9. Implemente um programa que calcule o ano de nascimento de uma pessoa 
;a partir de sua idade e do ano atual.

segment .data
    entrada0    db "Informe idade: ", 0;
    entrada1    db "Informe ano atual: ", 0;
    saida1      db "ano de nascimento: ", 0;

segment .bss
    input0  resd 1
    input1  resd 1
    input2  resd 1

segment .text
    global _asm_main

_asm_main:
    enter 0,0 
    pusha

    mov eax, entrada0               ;Informe
    call print_string
    
    call read_int                   ;Ler Num
    mov [input0], eax
    call print_nl

    mov eax, entrada1               ;Informe
    call print_string
    
    call read_int                   ;Ler Num
    mov [input1], eax
    call print_nl

    mov eax, saida1
    call print_string
    mov eax, [input1]
    sub eax, [input0]
    call print_int
    call print_nl


    jmp Fim
    
Fim:
    popa
    mov eax, 0
    leave
    ret