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
    input3  resd 1                  ;duracao
    input4  resd 1                  ;hora final
    input5  resd 1                  ;minuto final
    input6  resd 1                  ;segundos final

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
    mov [input1], eax               ;minuto inicio = eax
    call print_nl

    mov eax, entrada2               ;Informe segundos
    call print_string
    
    call read_int                   ;Ler segundos
    mov [input2], eax
    call print_nl

    mov eax, entrada3               ;Informe duracao
    call print_string
    
    call read_int                   ;Ler duracao
    mov [input3], eax               ;duracao = eax
    call print_nl

    mov eax, saida1                 ;informe saida hora
    call print_string
    mov eax, [input3]               ;duracao
    mov ebx, 3600                   ;3600
    mov edx, 0                      ;edx = 0
    idiv ebx                        ;eax = duracao/3600
    mov [input4], eax               ;horas = eaxs
    mov eax, [input0]               ;
    add eax, [input4]               ;eax = hora inicio + horas duracao
    call print_int
    call print_nl

    mov eax, saida2                 ;informe saida minutos
    call print_string
    mov eax, [input4]               ;eax = hora
    mov ebx, 3600                   ;ebx = 3600
    mul ebx                         ;eax = horas*3600
    sub eax, [input3]               ;eax = eax - duracao
    mov ebx, 60                     ;ebx = 60
    mov edx, 0                      ;edx = 0
    idiv ebx                        ;eax = eax/ebx
                                
    mov ebx, [input1]               ;ebx = minuto inicio
    add eax, ebx                    ;eax = ebx + eax
    mov [input5], eax               ;minuto final = eax
    call print_int
    call print_nl


    mov eax, saida3
    call print_string
    mov eax, [input4]               ;eax = hora
    mov ebx, 3600                   ;ebx = 3600
    mul ebx                         ;eax = horas*3600
    mov ebx, [input5]               ;ebx = minutos


    jmp Fim
    
Fim:
    popa
    mov eax, 0
    leave
    ret