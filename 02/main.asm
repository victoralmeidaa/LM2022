%include "asm_io.inc"

;   nasm -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.c
;   gcc -o main driver.obj main.obj asm_io.obj

; 2. Faça um programa que possibilite ao usuário realizar a conversão de unidade de
; temperatura. As opções possíveis são: Celsius para Fahrenheit; Celsius para Kelvin;
; Fahrenheit para Celsius; Fahrenheit para Kelvin; Kelvin para Celsius e Kelvin para
; Fahrenheit

segment .data           ; local para colocar vareaveis inicializadas
    entrada1    db "informe temperatura: ", 0
    entrada2    db "informe tipo de conversão: ", 0
    entrada3    db "1-Celsius para Fahrenheit, 2-Celsius para Kelvin, 3-Fahrenheit para Celsius, 4-Fahrenheit para Kelvin, 5-Kelvin para Celsius, 6-Kelvin para Fahrenheit", 0
    entrada4    db ":",0
    saida1      db "°C",0
    saida2      db "°F",0
    saida3      db "°K",0

segment .bss            ; local para colocar vareaveis não inicializadas
    temp    resd 1
    aux     resd 2

segment .text
    global _asm_main

_asm_main:
    enter 	0,0
	pusha

    mov eax, entrada1   ; move entrada1 para eax
    call print_string   ; imprime eax

    call read_int       ; ler int e armazena em eax
    mov [temp], eax     ; move eax para [temp]

    mov eax, entrada2   ; move entrada2 para eax
    call print_string   ; imprime eax
    call print_nl       ; pula linha

    mov eax, entrada3   ; move entrada3 para eax
    call print_string   ; imprime eax
    call print_nl       ; pula linha

    mov eax, entrada4   ; move entrada4 para eax
    call print_string   ; imprime eax

    call read_int       ; ler int e armazena em eax
    cmp eax, 1          ; compara eax com 1
    je CelsiParaFahre   ; se eax == 1 for igual, pula para CelsiParaFahre:

    cmp eax, 2          ; compara eax com 2
    je CelsiParaKelv    ; se eax == 2 for igual, pula para CelsiParaKelv

    cmp eax, 3          ; compara eax com 3
    je FahreParaCelsi   ; se eax == 3 for igual, pula para FahreParaCelsi

    cmp eax, 4          ; compara eax com 4
    je FahreParaKelv    ; se eax == 4 for igual, pula para FahreParaKelv

    cmp eax, 5          ; compara eax com 5
    je KelvParaCelsi    ; se eax == 5 for igual, pula para KelvParaCelsi

    cmp eax, 6          ; compara eax com 6
    je KelvParaFahre    ; se eax == 6 for igual, pula para KelvParaFahre

CelsiParaFahre:
                        ; considerando a seguinte formula F = C * 2 + 32
    mov eax, 2          ; move 2 para eax
    mov ebx, [temp]     ; move temperatura °C para ebx
    mul ebx             ; multiplica eax * ebx e move resultado para eax
    mov [aux], eax      ; move eax para [aux]

    mov eax, [aux]      ; move [aux] para eax
    add eax, 32         ; soma eax + 32 e move resultado para eax
    call print_int      ; imprime eax
    
    mov eax, saida2     ; move sainda2 para eax
    call print_string   ; imprime eax

    mov eax, 0          ; move 0 para eax
    cmp eax, 0          ; compara eax com 0
    je Fim              ; se eax == 0 for igual, pula para Fim:
    
CelsiParaKelv:
                        ; considerando a seguinte formula K = C + 273
    mov eax, 273        ; move 273 para eax
    add eax, [temp]     ; soma eax + [temp] e move resultado para eax
    call print_int      ; imprime eax(int)

    mov eax, saida3     ; move sainda3 para eax
    call print_string   ; imprime eax(string)
    
    mov eax, 0          ; move 0 para eax
    cmp eax, 0          ; compara eax com 0
    je Fim              ; se eax == 0 for igual, pula para Fim:


FahreParaCelsi:
                        ; considerando a seguinte formula C = (F - 32)/1
    mov eax, 32         ; move 32 para eax
    sub eax, [temp]     ; subtrai eax - [temp] e move resultado para eax
    mov [aux], eax      ; move eax para [aux]

    mov eax, [aux]      ; move [aux] para eax
    mov ebx, 1          ; move 1 para ebx
    idiv ebx            ; divide eax/ebx e move resultado para eax
    call print_int      ; imprime eax(int)

    mov eax, saida1     ; move saida1 para eax
    call print_string   ; imprime eax(int)

    mov eax, 0          ; move 0 para eax
    cmp eax, 0          ; compara eax com 0
    je Fim              ; se eax == 0 for igual, pula para Fim:

FahreParaKelv:
                        ; considerando a seguinte formula K = ???

KelvParaCelsi:
                        ; considerando a seguinte formula C = K - 273
    mov eax, 273        ; move 273 para eax
    sub eax, [temp]     ; subtrai eax - temp e move resultado para eax
    call print_int      ; imprime eax

    mov eax, saida1     ; move saida1 para eax
    call print_string   ; imprime eax

    mov eax, 0          ; move 0 para eax
    cmp eax, 0          ; compara eax com 0
    je Fim              ; se eax == 0 for igual, pula para Fim:

KelvParaFahre:
                        ; considerando a seguinte formula F = ???

Fim:
    popa                ; passos para encerrar o programa
    mov eax, 0          ;
    leave               ;
    ret                 ;
