%include "asm_io.inc"

;   masn -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.C
;   gcc -o main driver.obj main.obj asm_io.obj

;7. Leia um valor inteiro em segundos, e imprima-o em horas, 
;minutos e segundos.

segment .data
    entrada0    db "Informe valor em segundos: ", 0;
    saida1      db "horas: ", 0;
    saida2      db "minutos: ", 0;
    saida3      db "segundos: ", 0;

segment .bss
    input0  resd 1
    input1  resd 1
    input2  resd 1
    input3  resd 1

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

    mov eax, saida1
    call print_string
    mov eax, [input0]
    mov ebx, 3600
    mov edx, 0
    div ebx
    call print_int
    call print_nl

    mov eax, saida2
    call print_string
    mov eax, [input0]
    mov ebx, 60
    mov edx, 0
    idiv ebx
    call print_int
    call print_nl

    mov eax, saida3
    call print_string
    mov eax, [input0]
    call print_int
    call print_nl
    jmp Fim
    
Fim:
    popa
    mov eax, 0
    leave
    ret