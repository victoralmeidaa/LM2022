%include "asm_io.inc"

;   nasm -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.c
;   gcc -o main driver.obj main.obj asm_io.obj

;3. Um professor da UTFPR está necessitando calcular as notas dos alunos. Implemente
;um algoritmo que leia o código de um aluno e suas três notas. Calcular a média
;ponderada do aluno, considerando que o peso para a maior nota seja 4 e para as duas
;restantes, 3. Mostre o código do aluno, suas três notas, a média calculada e uma
;mensagem “Aprovado” se a média for maior ou igual a 5 e “reprovado” se a média for
;menor que 5.

segment .data                                   ;vareaveis iniciadas
    entrada0 db "Informe RA: "  , 0 ;
    entrada1 db "Informe Nota 1: ", 0 ;
    entrada2 db "Informe Nota 2: ", 0 ;
    entrada3 db "Informe Nota 3: ", 0 ;
    saida1   db "RA: ", 0;
    saida2   db "Nota: ", 0;
    saida3   db "Media: ", 0;
    saida4   db "Aprovado", 0;
    saida5   db "Reprovado", 0;


segment .bss                                    ;vareaveis não iniciadas
    nota1   resd 1
    nota2   resd 1
    nota3   resd 1
    media   resd 1
    RA      resd 1
    maior   resd 1

segment .text                                   ;
    global _asm_main	
_asm_main:
	enter 	0,0
	pusha

    ;RA
    mov eax, entrada0                           ; move entrada0 para eax
    call print_string                           ; imprime eax na tela
    call read_int                               ; Ler um inteiro e amrazenar em eax
    mov [RA], eax                               ; move valor inteiro de eax para [RA]

    ; Nota 1
    mov eax, entrada1                           ;
    call print_string
    call read_int
    mov [nota1], eax

    ; Nota 2
    mov eax, entrada2
    call print_string
    call read_int
    mov [nota2], eax
    
    ; Nota 3
    mov eax, entrada3
    call print_string
    call read_int
    mov [nota3], eax

    
    mov eax, 0
    cmp [nota1], eax
    jg  maior1

    mov eax, [maior]
    cmp [nota2], eax
    jg  maior2

    mov eax, [maior]
    cmp [nota3], eax
    jg  maior3

    mov eax, [maior]
    call print_int

maior1:
    mov eax, [nota1]
    mov [maior], eax

maior2:
    mov eax, [nota2]
    mov [maior], eax

maior3:
    mov eax, [nota3]
    mov [maior], eax

    mov eax, [maior]
    call print_int

    popa
	mov	eax, 0		; return back to C
	leave
	ret
