setup:
    addi x5, x0, 255  # VCC
    sb   x0, 1030(x0) # Indicar que a leitura de temperatura será em A0
read:
    lh   x7, 1031(x0) # Realizar a leitura de temperatura
t1:
    addi x6, x0, 307
    bge  x7, x6, t2   # 0 <= T <= 15

    addi x7, x0, 3
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 3
    sb   x5, 1034(x0) # Ligar

    addi x7, x0, 5
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 5
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 6
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 6
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 9
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 9
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 10
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 10
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 11
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 11
    sb   x0, 1034(x0) # Desligar

    jal  x0, read     # Reiniciar
t2:
    addi x6, x0, 409
    bge  x7, x6, t3   # 16 <= T <= 20

    addi x7, x0, 3
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 3
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 5
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 5
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 6
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 6
    sb   x5, 1034(x0) # Ligar

    addi x7, x0, 9
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 9
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 10
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 10
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 11
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 11
    sb   x0, 1034(x0) # Desligar

    jal  x0, read     # Reiniciar
t3:
    addi x6, x0, 512
    bge  x7, x6, t4   # 21 <= T <= 25

    addi x7, x0, 3
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 3
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 5
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 5
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 6
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 6
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 9
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 9
    sb   x5, 1034(x0) # Ligar

    addi x7, x0, 10
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 10
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 11
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 11
    sb   x0, 1034(x0) # Desligar

    jal  x0, read
t4:
    addi x6, x0, 614
    bge  x7, x6, t5   # 26 <= T <= 30

    addi x7, x0, 3
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 3
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 5
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 5
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 6
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 6
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 9
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 9
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 10
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 10
    sb   x5, 1034(x0) # Ligar

    addi x7, x0, 11
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 11
    sb   x0, 1034(x0) # Desligar

    jal  x0, read     # Reiniciar
t5:
    addi x6, x0, 716
    bge  x7, x6, t6   # 31 <= T <= 35

    addi x7, x0, 3
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 3
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 5
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 5
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 6
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 6
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 9
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 9
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 10
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 10
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 11
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 11
    sb   x5, 1034(x0) # Ligar

    jal  x0, read     # Reiniciar
t6:
    addi x7, x0, 3
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 3
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 5
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 5
    sb   x5, 1034(x0) # Ligar

    addi x7, x0, 6
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 6
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 9
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 9
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 10
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 10
    sb   x0, 1034(x0) # Desligar

    addi x7, x0, 11
    sb   x7, 1033(x0) # Indicar que a escrita vai ser no pin 11
    sb   x0, 1034(x0) # Desligar

    jal  x0, read     # Reiniciar