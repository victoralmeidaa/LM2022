%include "asm_io.inc"

;   masn -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.C
;   gcc -o main driver.obj main.obj asm_io.obj

;6. Leia um número inteiro de 4 dígitos (de 1000 a 9999) e imprimir 1 dígito por linha.

segment .data
    entrada0    db "Informe um Numero inteiro de 4 digitos: ", 0;
    saida1      db "Linha 1: ", 0;
    saida2      db "Linha 2: ", 0;
    saida3      db "Linha 3: ", 0;
    saida4      db "Linha 4: ", 0;

segment .bss
    input0  resd 1

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

    
    mov eax, saida1                 ;Saida Linha 1
    call print_string
    mov eax, [input0]               ;Num para eax
    mov ebx, 1000
    mov edx, 0
    idiv ebx
    call print_int                  
    call print_nl


    mov eax, saida2                 ;Saida Linha 2
    call print_string
    mov eax, edx                    ;edx resto de Num / 1000
    mov ebx, 100
    mov edx, 0    
    idiv ebx                         ;Resto / 100S
    call print_int
    call print_nl

    mov eax, saida3                 ;Saida Linha 3
    call print_string
    mov eax, edx                    ;
    mov ebx, 10
    mov edx, 0
    idiv ebx                         ;Resto / 10
    call print_int
    call print_nl

    mov eax, saida4                 ;Saida Linha 4
    call print_string
    mov eax, edx                    ;
    mov ebx, 1
    mov edx, 0
    idiv ebx                         ;Resto / 1
    call print_int
    jmp Fim
    
Fim:
    popa
    mov eax, 0
    leave
    ret