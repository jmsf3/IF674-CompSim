begin:
    lw    x10, a         # Carregar o valor de 'a' da memória
    lw    x11, b         # Carregar o valor de 'b' da memória
    lw    x12, c         # Carregar o valor de 'c' da memória
    jal   x1, multiply   # Multiplicar os valores de 'a' e 'b'
    sw    x12, c         # Salvar o resultado da multiplicação em 'c'
end:
    halt                 # Encerrar o programa
multiply:
    addi  x5, x0, 0      # i = 0
    addi  x6, x0, 32     # n = 32
    addi  x7, x0, 1      # Bitmask
start:
    beq   x11, x0, done  # b == 0?
    beq   x5, x6, done   # i == 32?
check:
    and   x28, x11, x7   # Least Significant Bit (LSB)
    beq   x28, x0, shift # LSB == 0?
    add   x12, x12, x10  # c = c + a
shift:
    slli  x10, x10, 1    # a << 1
    srli  x11, x11, 1    # b >> 1
    
    addi  x5, x5, 1      # i++
    jal   x0, start      # Loop
done:
    jalr  x0, 0(x1)      # Return
a:
    .word 2              # 16-bits
b:
    .word 3              # 16-bits
c:
    .word 0              # 32-bits