begin:
    sw    x0, x       # x = 0
    lw    x5, a       # Carregar o valor de 'a'
    lw    x6, b       # Carregar o valor de 'b'
    lw    x7, c       # Carregar o valor de 'c'

    addi  x6, x6, -76 # Subtrair 76 de 'b'
    addi  x7, x7, -26 # Subtrair 26 de 'c'
    blt   x5, x0, end # a >= 0?
    bge   x6, x0, end # b < 75?
    blt   x7, x0, end # c > 25?

    addi  x5, x0, 1   # x = 1
    sw    x5, x       # Salvar o valor de 'x' na memória
end:
    halt              # Encerrar o programa
a:
    .word 0           # Salvar 'a' como variável na memória
b:
    .word 64          # Salvar 'b' como variável na memória
c:
    .word 48          # Salvar 'c' como variável na memória
x:
    .word 255         # Salvar 'x' como variável na memória