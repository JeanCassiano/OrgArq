```assembly
; Exibir Mensagem - Mostra uma mensagem armazenada na tela

; ------- TABELA DE CORES -------
; Adicione ao caractere para selecionar a cor correspondente

; Consulte a tabela original de cores para os valores

jmp start_execution

spacecraft_msg : string "Jogo de Nave Espacial!"

;---- Início do Programa Principal -----

start_execution:
    loadn r0, #0    ; Posição na tela para a saída da mensagem
    loadn r1, #spacecraft_msg    ; Carrega r1 com o endereço do array da mensagem
    loadn r2, #0    ; Seleção de COR da mensagem

    call PrintMsg

    loadn r0, #40   ; Posição da nave espacial na tela
    loadn r1, #'O'  ; Caractere da nave espacial
    loadn r2, #32   ; Caractere de espaço em branco
    loadn r6, #1199 ; Marcador de fim da tela

GameLoop:
    call ClearObj
    call UpdatePos
    call DrawObj
    call Sleep
    jmp GameLoop

    halt

;---- Fim do Programa Principal -----

;---- Início das Sub-rotinas -----

PrintMsg:    ; Rotina de Impressão de Mensagem: r0 = Posição na tela para o primeiro caractere; r1 = endereço inicial da mensagem; r2 = cor da mensagem. Imprime até encontrar '\0'
    push r0    ; salva r0 na pilha
    push r1    ; salva r1 na pilha
    push r2    ; salva r2 na pilha
    push r3    ; salva r3 na pilha para uso na sub-rotina
    push r4    ; salva r4 na pilha para uso na sub-rotina

    loadn r3, #'\0'    ; Critério de parada

PrintLoop:
    loadi r4, r1
    cmp r4, r3
    jeq PrintEnd
    add r4, r2, r4
    outchar r4, r0
    inc r0
    inc r1
    jmp PrintLoop

PrintEnd:
    pop r4    ; restaura registros da pilha
    pop r3
    pop r2
    pop r1
    pop r0
    rts

ClearObj:
    outchar r2, r0    ; Limpa objeto na posição
    rts

UpdatePos:
    inc r0    ; Incrementa posição
    cmp r0, r6
    jeq ResetPos
    rts

DrawObj:
    outchar r1, r0    ; Desenha objeto na nova posição
    rts

Sleep:
    push r0
    push r1

    loadn r1, #50

    Sleep_loop_outer:
        loadn r0, #3000

        Sleep_loop_inner:
            dec r0
            jnz Sleep_loop_inner
            dec r1
            jnz Sleep_loop_outer

    pop r1
    pop r0

    rts

ResetPos:
    loadn r0, #40    ; Reinicia a posição se estiver no final
    rts
```
