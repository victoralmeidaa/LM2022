; file: Adicao.asm
; Este programa demonstra como funciona a instru��o de Adi��o e Impress�o
; de valores inteiros

; ------------------------------
; Como compilar o programa(Usando o programa cygwin terminal do desktop ou linux):

; Sao umas 5 rotinas

; Estrelas e o codigo a ser executado
; O menos embaixo e o comentario

; * nasm -f win32 Adicao.asm				* nasm -f elf32 Adicao.asm
; - arquivo: Adicao.obj e criado			- Adicao.o e criado

; * nasm -f win32 asm_io.asm                * nasm -f elf32 asm_io.asm 
; - arquivo: asm_io.obj e criado			- asm_io.o e criado 

; * gcc -c -o driver.obj driver.c							* gcc -c driver.c -o driver.o
; - driver.c e compilado e arquivo driver.obj e criado		- driver.c e compilado e driver.o e criado

; * gcc -o Adicao driver.obj Adicao.obj asm_io.obj			* gcc driver.o Adicao.o asm_io.o -o Adicao -no-pie
; - os arquivos objeto sao ligados / 						- erro:i386 architecture of input file '*.o' incopatible with i3386:x86-64
; - linkados e o executuvel Adicao.exe e criado

; * ./Adicao.exe
; - arquivo .exe gerado � executado 
; -----------------------------

%include "asm_io.inc"
segment .data

; Aqui os dados inicializados s�o colocados 

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
	
; Sa�da de dados
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

; N�o modifique o c�digo ap�s este coment�rio
	popa
	mov	eax, 0
	leave
	ret