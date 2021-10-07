%include "asm_io.inc"
segment .data		; Aqui os dados inicializados são colocados 
entrada1 db "Entre com um numero inteiro: ", 0 ; Nao esquecer do terminador null
entrada2 db "Entre com um segundo numero inteiro: ", 0 ; Nao esquecer do terminador null
saida1   db "Voce digitou o valor: ", 0 	
saida2   db " e ", 0 	
saida3   db ", o resultado da soma e: ", 0 	

segment .bss
input1	resd 1
input2	resd 1

segment .text
	global _asm_main

_asm_main:
	enter 	0,0
	pusha
	
; Entrada de dados
	mov eax, entrada1		; mov dest, src
    call print_string		; imprime a string de entrada
    call read_int			; l� o valor inteiro
    mov [input1], eax		; armazena em input
    call print_nl			; nova linha
	
	mov eax, entrada2		; mov dest, src
    call print_string		; imprime a string de entrada
    call read_int			; l� o segundo valor inteiro
    mov [input2], eax		; armazena em input
    call print_nl			; nova linha
	
; Processamento dos dados
	mov	 eax, [input1]		; eax = dword na input1
	add	 eax, [input2]		; eax += dword na input2
	mov	 ebx, eax			; ebx = eax
	
; Saída de dados
	mov  eax, saida1		; mov dest, src
    call print_string		; imprime a string "Entre com um numero inteiro:"
    mov  eax, [input1],  	; eax recebe o valor armazena em input
	call print_int			; imprime o valor inteiro
	
	mov  eax, saida2		; mov dest, src
    call print_string		; imprime a string "e"
    mov  eax, [input2],  	; eax recebe o valor armazena em input
	call print_int			; imprime o valor inteiro
	
	mov  eax, saida3		; mov dest, src
    call print_string		; imprime a string "o resultado da soma e:"
    mov  eax, ebx       	; eax recebe o valor armazena em input
	call print_int			; imprime o valor inteiro
	
    call print_nl			; nova linha

; Não modifique o código apos este comentario
	popa
	mov	eax, 0
	leave
	ret