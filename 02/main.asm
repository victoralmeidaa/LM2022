%include "asm_io.inc"

; 2. Faça um programa que possibilite ao usuário realizar a conversão de unidade de
; temperatura. As opções possíveis são: Celsius para Fahrenheit; Celsius para Kelvin;
; Fahrenheit para Celsius; Fahrenheit para Kelvin; Kelvin para Celsius e Kelvin para
; Fahrenheit

segment .data 
    entrada1    db "informe temperatura: ", 0
    entrada2    db "informe tipo de conversão: ", 0
    entrada3    db "1 - Celsius para Fahrenheit, 2 - Celsius para Kelvin, 3 - Fahrenheit para Celsius, 4 - Fahrenheit para Kelvin, 5 - Kelvin para Celsius, 6 - Kelvin para Fahrenheit", 0
    entrada4    db " :",0
    saida1      db "",0

segment .bss
    temp    resd 1
    op      resd 2
    aux     resd 3
    calc    resd 4

segment .text
    global _asm_main

_asm_main:
    enter 	0,0
	pusha

    mov eax, entrada1
    call print_string

    call read_int
    mov [temp], eax

    mov eax, entrada2
    call print_string
    call print_nl

    mov eax, entrada3
    call print_string
    call print_nl

    mov eax, entrada4
    call print_string

    call read_int
    mov [op], eax

    cmp eax, 1
    je CofF

    cmp eax, 2
    je CofK

    cmp eax, 3
    je FofC

    cmp eax, 4
    je FofK

    cmp eax, 5
    je KofC

    cmp eax, 6
    je KofF

CofF:
    mov eax, 2
    mov ebx, [temp]
    mul ebx
    mov [aux], eax

    mov eax, [aux]
    mov ebx, 32
    add eax, ebx
    mov [calc], eax
    call print_int
    
CofK:

FofC:

FofK:

KofC:

KofF:

Fim:
    popa                        
    mov eax, 0
    leave
    ret
