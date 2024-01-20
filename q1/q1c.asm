begin:
    jal  x1, input     # Ler do teclado
    addi x10, x14, 0   # Copiar valor lido para 'a'

    jal  x1, input     # Ler do teclado
    addi x11, x14, 0   # Copiar valor lido para 'b'

    jal  x1, input     # Ler do teclado
    addi x12, x14, 0   # Copiar valor lido para 'c'

    jal  x1, input     # Ler do teclado
    addi x13, x14, 0   # Copiar valor lido para 'x'

    addi x13, x0, 0    # x = 0
    addi x11, x11, -76 # Subtrair 76 de 'b'
    addi x12, x12, -26 # Subtrair 26 de 'c'

    blt  x10, x0, end  # a >= 0?
    bge  x11, x0, end  # b < 75?
    blt  x12, x0, end  # c > 25?
    addi x13, x0, 1    # x = 1
end:
    addi x13, x13, 48  # Converter inteiro para caractere
    sb   x13, 1024(x0) # Escrever caractere no buffer
    halt               # Encerrar o programa
input:
    addi x5, x0, 0     # i = 0
    addi x6, x0, 10    # n = 10
    addi x14, x0, 0    # num = 0
    addi x28, x0, 32   # stop = ' '
read:
    beq  x5, x6, stop  # i == 10?

    lb   x7, 1025(x0)  # Pegar caractere do buffer
    beq  x7, x0, stop  # Verificar se o buffer está vazio
    beq  x7, x28, stop # Verificar se há um espaço no buffer

    addi x7, x7, -48   # Converter caractere lido para um inteiro (z)
    slli x14, x14, 1   # num * 2^1
    slli x30, x14, 2   # num * 2^3
    add  x14, x30, x14 # num = num * 2^1 + num * 2^3 = num * 10
    add  x14, x14, x7  # num = num + z

    addi x5, x5, 1     # i++
    jal  x0, read      # Loop
stop:
    jalr x0, 0(x1)     # Return