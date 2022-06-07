%include "asm_io.inc"

;   masn -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.C
;   gcc -o main driver.obj main.obj asm_io.obj

;5. Desenvolver um algoritmo para calcular a conta de água para a CASAGO. O custo da
;água varia dependendo se o consumidor é residencial, comercial ou industrial. A regra
;para calcular a conta é:
;– Residencial: R$5,00 de taxa mais R$2,00 por m³ gastos;
;– Comercial: R$ 500,00 para os primeiros 80m³ gastos mais R$25,00 por m³ gastos;
;– Industrial: R$ 800,00 para os primeiros 100m³ gastos mais R$40,00 por m³ gastos;
;O programa deverá ler a conta do cliente, consumo de água por metros cúbicos e o tipo
;de consumidor ( residencial, comercial e industrial ). Como resultado, imprima a conta
;do cliente e o valor real a ser pago pelo mesmo.


segment .data  
    entrada1 db "informe seu consumo em metro(s) cubico(s): ", 0
    entrada2 db "Informe tipo de consumidor", 0
    entrada3 db "1 - Residencial  2 - Comercial  3 - Industrial", 0
    entrada4 db "Opcao: ", 0  
    saida1 db "Sua Conta: R$", 0

segment .bss
    taxa resd 1
    conta resd 1
    consumo resd 1
    consumidor resd 1
    mult resd 1
    op resd 1
    cont resd 1
segment .text
    global _asm_main

_asm_main:
    mov eax, entrada1
    call print_string   ; Informe seu consumo:

    call read_int
    mov [consumo], eax  ; Ler consumo salva em [consumo]

    mov eax, entrada2
    call print_string   ; informe tipo de consumidor
    call print_nl

    mov eax, entrada3   
    call print_string   ; tipo 1, 2, 3.
    call print_nl

    mov eax, entrada4
    call print_string   ; opção:

    call read_int       ; 
    mov [op], eax       ; ler opção e salvar em [op]

    cmp eax, 1          ; caso 1
    je residencial      ; jump para residencial:

    cmp eax, 2          ; caso 2
    je comercial        ; jump para comercial:

    cmp eax, 3          ; caso 3
    je industrial       ; jumpo para industrial:

residencial:
    mov eax, 5          ;
    mov [taxa], eax     ; mover eax = 5 em [taxa]

    mov eax, 2          ; mover 2 para eax
    mov ebx, [consumo]  ; mover [consumo] para ebx
    mul ebx             ; multiplicar eax*ebx 
    mov ebx, eax        ; 
    mov [mult], ebx
    mov eax, [taxa]
    add eax, [mult]
    mov ebx, eax

    mov eax, saida1
    call print_string
    mov eax, ebx
    call print_int
    call print_nl
    jmp fim

comercial:
    mov ecx, 500
    mov [taxa], ecx

    mov eax, [consumo]
    cmp eax, 80
    jge linha1

    mov eax, saida1
    call print_string
    mov eax, [taxa]
    call print_int
    call print_nl
    jmp fim

    linha1:
        mov ebx, [consumo]
        mov eax, 80
        sub ebx, eax 
        mov [cont], ebx
        
        mov eax, 25
        mov ebx, [cont]
        mul ebx
        mov ebx, eax
        mov [mult], ebx
        mov eax, [taxa]
        add eax, [mult]
        mov ebx, eax
        
        mov eax, saida1
        call print_string
        mov eax, ebx
        call print_int
        call print_nl
        jmp fim

industrial:
    mov ecx, 800
    mov [taxa], ecx

    mov eax, [consumo]
    cmp eax, 100
    jge linha2

    mov eax, saida1
    call print_string
    mov eax, [taxa]
    call print_int
    call print_nl
    jmp fim

    linha2:
        mov ebx, [consumo]
        mov eax, 100
        sub ebx, eax
        mov[cont], ebx

        mov eax, 40
        mov ebx, [cont]
        mul ebx
        mov ebx, eax
        mov [mult], ebx
        mov eax, [taxa]
        add eax, [mult]
        mov ebx, eax

        mov eax, saida1
        call print_string
        mov eax, ebx
        call print_int
        call print_nl
        jmp fim

fim:

    popa                        
    mov eax, 0
    leave
    ret 