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
    notap1  resd 1
    notap2  resd 1
    notap3  resd 1
    media   resd 1
    RA      resd 1
    maior   resd 1
    soma    resd 1
    somap   resd 1

segment .text                                   ;
    global _asm_main	
_asm_main:
	enter 	0,0
	pusha

    ; RA
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

    ; soma notas
    mov eax, [nota1]
    add eax, [nota2]
    add eax, [nota3]
    mov [soma], eax
    
    mov eax, [nota1]
    cmp [nota2], eax                            ;compara nota1 com nota2
    jg  maior1                                  ;se nota2 > nota1 pula para maior1
    
    mov eax, [nota1]                            
    cmp [nota3], eax
    jg  maior2                                  ;se nota3 > nota1 pula para maior2

    mov eax,[nota1]
    mov [maior], eax

    mov eax,[nota2]
    mov ebx, 3
    mul ebx
    mov [notap2], eax

    mov eax,[nota3]
    mov ebx, 3
    mul ebx
    mov [notap3], eax

    mov eax,[nota1]
    mov ebx, 4
    mul ebx
    mov [notap1], eax

    mov eax, [maior]
    call print_int

    jmp continuar

maior1:
    mov eax,[nota1]
    mov ebx, 3
    mul ebx
    mov [notap1], eax

    mov eax, [nota2]                            
    cmp [nota3], eax
    jg  maior2                                  ;se nota3 > nota2 pula para maior2

    mov eax, [nota2]                            ; move nota2 para eax
    mov [maior], eax                            ; move eax para maior

    mov eax,[nota3]
    mov ebx, 3
    mul ebx
    mov [notap3], eax

    mov eax,[nota2]
    mov ebx, 4
    mul ebx
    mov [notap2], eax

    jmp continuar

maior2:
    mov eax,[nota1]
    mov ebx, 3
    mul ebx
    mov [notap1], eax

    mov eax,[nota2]
    mov ebx, 3
    mul ebx
    mov [notap2], eax

    mov eax,[nota3]
    mov ebx, 4
    mul ebx
    mov [notap3], eax

    mov eax, [nota3]                            ; move nota3 para eax
    mov [maior], eax                            ; move eax para maior

    jmp continuar
    
continuar: 
    mov eax, [notap1]
    add eax, [notap2]
    add eax, [notap3]
    mov [somap], eax

    mov eax, [somap]
    call print_int
    call print_nl
    mov eax, [soma]
    call print_int
    call print_nl

    mov eax, somap
    mov ebx, soma
    idiv ebx                                    ; CONSERTA ESSA DIVISAO
    mov [media], eax
    call print_int
    call print_nl

    mov eax, 5
    cmp [media], eax
    jge Aprovado

    call print_nl

    mov eax, saida1
    call print_string
    mov eax, [RA]
    call print_int
    call print_nl

    mov eax, saida2
    call print_string
    mov eax, [nota1]
    call print_int
    call print_nl

    mov eax, saida2
    call print_string
    mov eax, [nota2]
    call print_int
    call print_nl

    mov eax, saida2
    call print_string
    mov eax, [nota3]
    call print_int
    call print_nl

    mov eax, saida3
    call print_string
    mov eax, [media]
    call print_int
    call print_nl

    mov eax, saida5
    call print_string

    jmp Fim

Aprovado:
    mov eax, saida1
    call print_int
    call print_nl

    mov eax, saida2
    call print_string
    mov eax, [nota1]
    call print_int
    call print_nl

    mov eax, saida2
    call print_string
    mov eax, [nota2]
    call print_int
    call print_nl

    mov eax, saida2
    call print_string
    mov eax, [nota3]
    call print_int
    call print_nl

    mov eax, saida3
    call print_string
    mov eax, [media]
    call print_int
    call print_nl

    mov eax, saida4
    call print_string

    jmp Fim

Fim:
    popa
	mov	eax, 0		; return back to C
	leave
	ret
