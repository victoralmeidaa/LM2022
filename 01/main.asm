%include "asm_io.inc"

;   nasm -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.c
;   gcc -o main driver.obj main.obj asm_io.obj

;   01 - Faça um programa para ler as dimensões de um terreno (comprimento c e largura l),
;   bem como o preço do metro de tela p. Imprima o custo para cercar este mesmo terreno
;   com tela

segment .data
entrada1 db "Informe Comprimento: ", 0 ;
entrada2 db "Informe Largura: ", 0 ;
entrada3 db "Informe Preço do metro: ", 0 ;
saida1   db "Terreno tem ", 0 ;
saida2   db " metros quadrados", 0 ;
saida3   db "Custo para cercar o terreno em R$: ", 0;


segment .bss
input1	resd 1
input2	resd 2
input3  resd 3
input4  resd 4
input5  resd 5

segment .text
	global _asm_main	
_asm_main:
	enter 	0,0
	pusha

    ; === Comprimento ===
    mov eax, entrada1
    call print_string

    call read_int
    mov [input1], eax

    ; === Largura ===
    mov eax, entrada2
    call print_string

    call read_int
    mov [input2], eax

    ; === Preço ===
    mov eax, entrada3
    call print_string

    call read_int
    mov [input3], eax

    ; Logica 
    mov eax, [input1]   ; move valor 1 para eax
    mov ebx, [input2]   ; move valor 2 para ebx
    mul ebx             ; multiplica valores e guarda resultado em eax
    mov [input4], eax   ; move resultado para input4
    

    mov eax, saida1
    call print_string   ; "Terreno tem "

    mov eax, [input4]
    call print_int      ; 50

    mov eax, saida2
    call print_string   ; " Metros quadrados"
    call print_nl

    mov eax, [input3]
    mov ebx, [input4]
    mul ebx
    mov [input5], eax
    mov eax, saida3
    call print_string
    mov eax, [input5]
    call print_int

    

    popa
	mov	eax, 0		; return back to C
	leave
	ret
