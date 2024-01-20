pow:
	addi x9, x0, 0x640     # Endereço do array que contêm as potências de 10

	lui  x5, 0x000f4
	addi x5, x5, 0x240
	sw   x5, 0(x9)

	lui  x5, 0x00018
	addi x5, x5, 0x6a0
	sw   x5, 4(x9)

	lui  x5, 0x00002
	addi x5, x5, 0x710
	sw   x5, 8(x9)

	addi x5, x0, 1000
	sw   x5, 12(x9)

	addi x5, x0, 100
	sw   x5, 16(x9)

	addi x5, x0, 10
	sw   x5, 20(x9)

	addi x5, x0, 1
	sw   x5, 24(x9)
fact:
	addi x18, x0, 0x740    # Endereço do array que contêm os fatoriais de 0 a 9

	addi x5, x0, 1         # 0! e 1!
	sw   x5, 0(x18)
	sw   x5, 4(x18)

	addi x5, x0, 2         # 2!
	sw   x5, 8(x18)

	addi x5, x0, 6         # 3!
	sw   x5, 12(x18)

	addi x5, x0, 24        # 4!
	sw   x5, 16(x18)

	addi x5, x0, 120       # 5!
	sw   x5, 20(x18)

	addi x5, x0, 720       # 6!
	sw   x5, 24(x18)

	lui  x5, 0x00001
	addi x5, x5, 0x3b0     # 7!
	sw   x5, 28(x18)

	lui  x5, 0x00009
	addi x5, x5, 0xd80     # 8!
	sw   x5, 32(x18)

	lui  x5, 0x00058
	addi x5, x5, 0x980     # 9!
	sw   x5, 36(x18)
setup:
	addi x20, x0, 0        # Resultado
	addi x22, x0, 13       # Enter (ASCII)
loop:
	lb   x5, 1025(x0)      # Ler do buffer
	beq  x5, x22, print    # Encerrar leitura
	beq  x5, x0, loop      # Continuar leitura

	addi x5, x5, -48       # Converter para inteiro
	slli x5, x5, 2         # Multiplicar por 4
	add  x5, x5, x18       # Somar com o endereço base do array

	lw   x5, 0(x5)         # Carregar valor do fatorial
	add  x20, x20, x5      # Somar valor do fatorial ao resultado

	jal  x0, loop
print:
	addi x5, x0, 0         # i = 0
	addi x6, x0, 10        # n = 7
	addi x22, x20, 0       # Copiar o número a ser impresso
for:
	bge  x5, x6, end       # i >= 7?

	slli x7, x5, 2         # Multiplicar por 4
	add  x7, x7, x9        # Somar com o endereço base do array
	lw   x7, 0(x7)         # Carregar valor da potência de 10

	addi x28, x0, 0        # j = 0
divide:
	blt  x22, x7, next
	sub  x22, x22, x7
	addi x28, x28, 1
	jal  x0, divide
next:
	blt  x20, x7, continue # Pular zeros a esquerda
	addi x28, x28, 48      # Converter para caractere
	sb   x28, 1024(x0)     # Escrever no buffer do monitor
continue:
	addi x5, x5, 1         # i++
	jal  x0, for
end:
	halt