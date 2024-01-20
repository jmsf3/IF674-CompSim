setup:
    addi x5, x0, 8       # pow = 8
    addi x6, x0, 0       # num = 0
decode:
    beq  x5, x0, display # Verificar se pow == 0

    lb   x7, 1025(x0)    # Ler char do buffer
    beq  x7, x0, decode  # Ver se o buffer estava vazio

    addi x7, x7, -48     # Converter char para int
    beq  x7, x0, shift   # Verificar se o int é nulo
    add  x6, x6, x5      # num = num + pow
shift:
    srli x5, x5, 1       # pow = pow / 2
    jal  x0, decode
display:
    addi x9, x6, 0       # Salvar valor lido
zero:
    bne  x9, x0, one     # Dígito 0

    addi x5, x0, 0x00    # Pin 8 = 0
    sb   x5, 1027(x0)
    addi x5, x0, 0x3f    # Pin 2, 3, 4, 5, 6, 7 = 111111
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
one:
    addi x5, x9, -1
    bne  x5, x0, two     # Dígito 1

    addi x5, x0, 0x00    # Pin 8 = 0
    sb   x5, 1027(x0)
    addi x5, x0, 0x06    # Pin 2, 3, 4, 5, 6, 7 = 000110
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
two:
    addi x5, x9, -2
    bne  x5, x0, three   # Dígito 2

    addi x5, x0, 0x01    # Pin 8 = 1
    sb   x5, 1027(x0)
    addi x5, x0, 0x1b    # Pin 2, 3, 4, 5, 6, 7 = 011011
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
three:
    addi x5, x9, -3
    bne  x5, x0, four    # Dígito 3

    addi x5, x0, 0x01    # Pin 8 = 1
    sb   x5, 1027(x0)
    addi x5, x0, 0x0f    # Pin 2, 3, 4, 5, 6, 7 = 001111
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
four:
    addi x5, x9, -4
    bne  x5, x0, five    # Dígito 4

    addi x5, x0, 0x01    # Pin 8 = 1
    sb   x5, 1027(x0)
    addi x5, x0, 0x26    # Pin 2, 3, 4, 5, 6, 7 = 100110
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
five:
    addi x5, x9, -5
    bne  x5, x0, six     # Dígito 5

    addi x5, x0, 0x01    # Pin 8 = 1
    sb   x5, 1027(x0)
    addi x5, x0, 0x2d    # Pin 2, 3, 4, 5, 6, 7 = 101101
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
six:
    addi x5, x9, -6
    bne  x5, x0, seven   # Dígito 6

    addi x5, x0, 0x01    # Pin 8 = 1
    sb   x5, 1027(x0)
    addi x5, x0, 0x3d    # Pin 2, 3, 4, 5, 6, 7 = 111101
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
seven:
    addi x5, x9, -7
    bne  x5, x0, eight   # Dígito 7

    addi x5, x0, 0x00    # Pin 8 = 0
    sb   x5, 1027(x0)
    addi x5, x0, 0x07    # Pin 2, 3, 4, 5, 6, 7 = 000111
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
eight:
    addi x5, x9, -8
    bne  x5, x0, nine    # Dígito 8

    addi x5, x0, 0x01    # Pin 8 = 1
    sb   x5, 1027(x0)
    addi x5, x0, 0xff    # Pin 2, 3, 4, 5, 6, 7 = 111111
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
nine:
    addi x5, x9, -9
    bne  x5, x0, clear   # Dígito 9

    addi x5, x0, 0x01    # Pin 8 = 1
    sb   x5, 1027(x0)
    addi x5, x0, 0x2f    # Pin 2, 3, 4, 5, 6, 7 = 101111
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar
clear:
    addi x5, x9, -15
    bne  x5, x0, setup   # Clear

    addi x5, x0, 0x00    # Pin 8 = 0
    sb   x5, 1027(x0)
    addi x5, x0, 0x00    # Pin 2, 3, 4, 5, 6, 7 = 000000
    sb   x5, 1029(x0)

    jal  x0, setup       # Reiniciar