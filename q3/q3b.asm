pow:
    addi x9, x0, 0x640     # Endereço do array que contêm as potências de 10

    lui  x5, 0x00989
    addi x5, x5, 0x680
    sw   x5, 0(x9)

    lui  x5, 0x000f4
    addi x5, x5, 0x240
    sw   x5, 4(x9)

    lui  x5, 0x00018
    addi x5, x5, 0x6a0
    sw   x5, 8(x9)

    lui  x5, 0x00002
    addi x5, x5, 0x710
    sw   x5, 12(x9)

    addi x5, x0, 1000
    sw   x5, 16(x9)

    addi x5, x0, 100
    sw   x5, 20(x9)

    addi x5, x0, 10
    sw   x5, 24(x9)

    addi x5, x0, 1
    sw   x5, 28(x9)
begin:
    jal  x1, input         # Ler do teclado
    addi x10, x14, 0       # Copiar valor lido para 'a'

    jal  x1, input         # Ler do teclado
    addi x11, x14, 0       # Copiar valor lido para 'b'

    addi x12, x0, 0        # Inicializar o valor de 'c' como 0
    jal  x1, multiply      # Multiplicar os valores de 'a' e 'b'
    jal  x1, print         # Mostrar o resultado da multiplicação
end:
    halt                   # Encerrar o programa
multiply:
    addi x5, x0, 0         # i = 0
    addi x6, x0, 32        # n = 32
    addi x7, x0, 1         # Bitmask
start:
    beq  x11, x0, done     # b == 0?
    beq  x5, x6, done      # i == 32?
check:
    and  x28, x11, x7      # Least Significant Bit (LSB)
    beq  x28, x0, shift    # LSB == 0?
    add  x12, x12, x10     # c = c + a
shift:
    slli x10, x10, 1       # a << 1
    srli x11, x11, 1       # b >> 1

    addi x5, x5, 1         # i++
    jal  x0, start         # Loop
done:
    jalr x0, 0(x1)         # Return
input:
    addi x5, x0, 0         # i = 0
    addi x6, x0, 4         # n = 4
    addi x14, x0, 0        # num = 0
    addi x28, x0, 32       # stop = ' '
read:
    beq  x5, x6, stop      # i == 4?

    lb   x7, 1025(x0)      # Pegar caractere do buffer
    beq  x7, x0, stop      # Verificar se o buffer está vazio
    beq  x7, x28, stop     # Verificar se há um espaço no buffer

    addi x7, x7, -48       # Converter caractere lido para um inteiro (z)
    slli x14, x14, 1       # num * 2^1
    slli x30, x14, 2       # num * 2^3
    add  x14, x30, x14     # num = num * 2^1 + num * 2^3 = num * 10
    add  x14, x14, x7      # num = num + z

    addi x5, x5, 1         # i++
    jal  x0, read          # Loop
stop:
    jalr x0, 0(x1)         # Return
print:
    addi x5, x0, 0         # i = 0
    addi x6, x0, 8         # n = 8
    addi x20, x12, 0       # Copiar o número a ser impresso
for:
    bge  x5, x6, finished  # i >= 10?

    slli x7, x5, 2         # Multiplicar por 4
    add  x7, x7, x9        # Somar com o endereço base do array
    lw   x7, 0(x7)         # Carregar valor da potência de 10

    addi x28, x0, 0        # j = 0
divide:
    blt  x20, x7, next
    sub  x20, x20, x7
    addi x28, x28, 1
    jal  x0, divide
next:
    blt  x12, x7, continue # Pular zeros a esquerda
    addi x28, x28, 48      # Converter para caractere
    sb   x28, 1024(x0)     # Escrever no buffer do monitor
continue:
    addi x5, x5, 1         # i++
    jal  x0, for
finished:
    jalr x0, 0(x1)         # Return