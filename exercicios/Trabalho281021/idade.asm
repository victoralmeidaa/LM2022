%include "asm_io.inc"

segment .data
    entrada db "idade: ", 0
    saida1  db "infantil", 0
    saida2 db "juvenil", 0
    saida3 db "adulto", 0

segment .bss
    input1 resd 1

segment .text 
    global _asm_main

_asm_main:
    enter 0,0
    mov eax, entrada            ; move string entrada para eax
    call print_string           ; print string contida em eax

    call read_int               ; ler valor 
    mov [input1], eax           ; armazena valor em input1
    call print_nl               ; quebra de linha

    cmp eax, 10                 ; compara eax com 10
    jle infantil                ; jump jle se vleft <= vright pula para "infantil:"

    cmp eax, 17                 ; compara eax com 17
    jle juvenil                 ; jump jle se vleft <= vright pula para "juvenil:" 

    cmp eax, 18                 ; compara eax com 18
    jge adulto                  ; jump jge se vleft >= vright pula para "adulto:"
    
infantil:
    mov eax, saida1             ; move saida1 para eax
    call print_string           ; print eax
    call print_nl               ; quebra de linha 
    jmp fim                     ; jmp jump incondicional para "fim:"

juvenil:
    mov eax, saida2             ; move saida2 para eax
    call print_string           ; print eax
    call print_nl               ; quebra de linha
    jmp fim                     ; jmp jump incondicional para "fim:"

adulto:
    mov eax, saida3             ; move saida3 para eax
    call print_string           ; print eax
    call print_nl               ; quebra de linha
    jmp fim                     ; jmp jump incondicional para "fim:"

fim:
    call print_nl               ; quebra de linha

    popa                        
    mov eax, 0
    leave
    ret 