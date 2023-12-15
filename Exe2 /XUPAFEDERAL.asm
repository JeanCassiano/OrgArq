; Saudações na Tela - Exibe mensagem armazenada na tela

; ------- TABELA DE CORES -------
; Adicione ao caractere para selecionar a cor correspondente

; 0 branco                     0000 0000
; 256 marrom                   0001 0000
; 512 verde                    0010 0000
; 768 oliva                    0011 0000
; 1024 azul marinho            0100 0000
; 1280 roxo                    0101 0000
; 1536 ciano                   0110 0000
; 1792 prata                   0111 0000
; 2048 cinza                   1000 0000
; 2304 vermelho                1001 0000
; 2560 lima                    1010 0000
; 2816 amarelo                 1011 0000
; 3072 azul                    1100 0000
; 3328 fúcsia                  1101 0000
; 3584 água                    1110 0000
; 3840 branco brilhante        1111 0000

jmp start

textdata: var #21
static textdata + #0, #'E'
static textdata + #1, #'N'
static textdata + #2, #'T'
static textdata + #3, #'E'
static textdata + #4, #'R'
static textdata + #5, #' '
static textdata + #6, #'T'
static textdata + #7, #'O'
static textdata + #8, #' '
static textdata + #9, #'B'
static textdata + #10, #'E'
static textdata + #11, #'G'
static textdata + #12, #'I'
static textdata + #13, #'N'
static textdata + #14, #'\0'
static textdata + #15, #'S'
static textdata + #16, #'T'
static textdata + #17, #'A'
static textdata + #18, #'R'
static textdata + #19, #'T'
static textdata + #20, #'!'

extraText: string "Instituto Federal FTW!!!"

;---- Início do Programa Principal -----

start:
    loadn r0, #650          ; Posição na tela onde a mensagem será escrita
    loadn r1, #extraText    ; Carrega r1 com o endereço do array da mensagem
    loadn r2, #3072         ; Seleciona a COR da mensagem

    call PrintString        ; r0 = Posição na tela para o primeiro caractere da mensagem; r1 = endereço do início da mensagem; r2 = cor da mensagem. Nota: a mensagem será impressa até encontrar '\0'

    halt

;---- Fim do Programa Principal -----

;---- Início das Sub-rotinas -----

PrintString: ; Rotina de Impressão de Mensagem: r0 = Posição na tela para o primeiro caractere; r1 = endereço do início da mensagem; r2 = cor da mensagem. Nota: a impressão continua até encontrar '\0'
    push r0 ; salva r0 na pilha para preservar seu valor
    push r1 ; salva r1 na pilha para preservar seu valor
    push r2 ; salva r2 na pilha para preservar seu valor
    push r3 ; salva r3 na pilha para uso na sub-rotina
    push r4 ; salva r4 na pilha para uso na sub-rotina

    loadn r3, #'\0' ; Condição de término

PrintLoop:
    loadi r4, r1
    cmp r4, r3
    jeq PrintExit
    add r4, r2, r4
    outchar r4, r0
    inc r0
    inc r1
    jmp PrintLoop

PrintExit:
    pop r4 ; Recupera valores dos registradores da pilha
    pop r3
    pop r2
    pop r1
    pop r0
    rts
