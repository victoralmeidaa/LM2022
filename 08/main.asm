%include "asm_io.inc"

;   masn -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.C
;   gcc -o main driver.obj main.obj asm_io.obj

;8. Faça um programa para ler o horário (hora, minuto e segundo) de inicio e a duração,
;em segundos, de um experimento computacional. O programa deve resultar com o novo
;horário (hora, minuto e segundo) do termino do mesmo.

segment .data
    entrada0    db "Informe hora: ", 0;
    entrada1    db "Informe minuto: ", 0;
    entrada2    db "Informe segundo: ", 0;
    entrada3    db "Informe duração em segundos: ", 0;
    saida1      db "termina hora: ", 0;
    saida2      db "minuto: ", 0;
    saida3      db "e segundo: ", 0;

segment .bss
    input0  resd 1                  ;hora inicio
    input1  resd 1                  ;Minuto inicio
    input2  resd 1                  ;segundos inicio
    input3  resd 1                  ;duracao inicio
    input4  resd 1                  

segment .text
    global _asm_main

_asm_main:
    enter 0,0 
    pusha

    mov eax, entrada0               ;Informe hora
    call print_string
    
    call read_int                   ;Ler hora
    mov [input0], eax
    call print_nl

    mov eax, entrada1               ;Informe minuto
    call print_string
    
    call read_int                   ;Ler minuto
    mov [input1], eax
    call print_nl

    mov eax, entrada2               ;Informe segundos
    call print_string
    
    call read_int                   ;Ler segundos
    mov [input2], eax
    call print_nl

    mov eax, entrada3               ;Informe duracao
    call print_string
    
    call read_int                   ;Ler duracao
    mov [input3], eax
    call print_nl

    mov eax, saida1                 ;informe saida hora
    call print_string
    mov eax, [input3]               ;hora
    mov ebx, 3600                   ;3600
    mov edx, 0                      ;edx = 0
    idiv ebx                        ;eax = hora/3600
    
    call print_int
    call print_nl
    mov [input4], eax               ;

    mov eax, saida2
    call print_string
    mov eax, [input4]
    mov ebx, 3600
    mul ebx
    sub eax, [input3]
    mov ebx, 60
    mov edx, 0
    idiv ebx
    call print_int
    call print_nl


    jmp Fim
    
Fim:
    popa
    mov eax, 0
    leave
    ret