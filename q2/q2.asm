Begin:
	addi x18, x0, 0         # Player1 = = x18 = 0
	addi x19, x0, 0         # Player2 = x19 = 0
	addi x21, x0, 0         # Result = x21 = 0
	addi x22, x0, 0         # PrintResult = x22 = 0
	addi x10, x0, 0x640     # Pow [0:6] = x10
	addi x20, x0, 0x260     # Alpha [0:25] = x20
	addi x9, x0, 32         # Flag = x9 = 32
	addi x7, x0, 65         # Corrector = x7 = 65

# Temporary register = x5, Iterator = x6
Pow:
	lui  x5, 0x000f4
	addi x5, x5, 0x240
	sw   x5, 0(x10)

	lui  x5, 0x00018
	addi x5, x5, 0x6a0
	sw   x5, 4(x10)

	lui  x5, 0x00002
	addi x5, x5, 0x710
	sw   x5, 8(x10)

	addi x5, x0, 1000
	sw   x5, 12(x10)

	addi x5, x0, 100
	sw   x5, 16(x10)

	addi x5, x0, 10
	sw   x5, 20(x10)

	addi x5, x0, 1
	sw   x5, 24(x10)

# Alocando os valores das letras em Alpha[0:25]
One:
	addi x5, x0, 1
	sw   x5, 0(x20)
	sw   x5, 16(x20)
	sw   x5, 32(x20)
	sw   x5, 56(x20)
	sw   x5, 80(x20)
Two:
	addi x5, x0, 2
	sw   x5, 40(x20)
	sw   x5, 68(x20)
	sw   x5, 72(x20)
Three:
	addi x5, x0, 3
	sw   x5, 12(x20)
	sw   x5, 24(x20)
	sw   x5, 76(x20)
Four:
	addi x5, x0, 4
	sw   x5, 20(x20)
	sw   x5, 28(x20)
	sw   x5, 84(x20)
	sw   x5, 88(x20)
	sw   x5, 96(x20)
Five:
	addi x5, x0, 5
	sw   x5, 4(x20)
	sw   x5, 8(x20)
	sw   x5, 48(x20)
	sw   x5, 52(x20)
	sw   x5, 60(x20)
Six:
	addi x5, x0, 6
	sw   x5, 36(x20)
	sw   x5, 44(x20)
	sw   x5, 92(x20)
Nine:
	addi x5, x0, 9
	sw   x5, 64(x20)
	sw   x5, 100(x20)

# Lendo as palavras byte a byte
ReadP1:
	lb   x5, 1025(x0)       # Byte = 'char'
	beq  x5, x9, ReadP2     # Fim da palavra?

	sub  x5, x5, x7         # Byte = Byte - 65
	slli x6, x5, 2          # Iterator = x t.q. x ∈ [0, 4, ..., 100]
	add  x6, x20, x6        # Iterator->Alpha[Iterator]
	lb   x5, 0(x6)          # WordValue = Alpha[Iterator]
	add  x18, x18, x5       # P1 += x5

	beq  x0, x0, ReadP1     # Volta para ReadP1
ReadP2:
	lb   x5, 1025(x0)       # Byte = 'char'
	beq  x5, x9, Winner     # Fim da palavra?

	sub  x5, x5, x7         # Byte = Byte - 65
	slli x6, x5, 2          # Iterator = x t.q. x ∈ [0, 4, ..., 100]
	add  x6, x20, x6        # Iterator->Alpha[Iterator]
	lb   x5, 0(x6)          # WordValue = Alpha[Iterator]
	add  x19, x19, x5       # P2 += x5

	beq  x0, x0, ReadP2     # Volta para ReadP2

# Printando o vencedor
Winner:
	blt  x18, x19, WinnerP2 # P1 < P2
	beq  x18, x19, Tie      # P1 = P2
WinnerP1:
	addi x21, x18, 0        # Result = P1
	addi x8, x0, 80         # Reg = P
	sb   x8, 1024(x0)       # Print(Reg)
	addi x8, x0, 49         # Reg = 1
	sb   x8, 1024(x0)       # Print(Reg)
	sb   x9, 1024(x0)       # Print( )
	beq  x0, x0, Result     # Result
WinnerP2:
	addi x21, x19, 0        # Result = P2
	addi x8, x0, 80         # Reg = P
	sb   x8, 1024(x0)       # Print(Reg)
	addi x8, x0, 50         # Reg = 2
	sb   x8, 1024(x0)       # Print(Reg)
	sb   x9, 1024(x0)       # Print( )
	beq  x0, x0, Result     # Result
Tie:
	addi x21, x18, 0        # Result = P1 OU P2
	addi x8, x0, 84         # Reg = T
	sb   x8, 1024(x0)       # Print(Reg)
	addi x8, x0, 73         # Reg = I
	sb   x8, 1024(x0)       # Print(Reg)
	addi x8, x0, 69         # Reg = E
	sb   x8, 1024(x0)       # Print(Reg)
	sb   x9, 1024(x0)       # Print( )
Result:
	addi x5, x0, 0          # i = 0
	addi x6, x0, 7          # n = 7
	addi x22, x21, 0        # Guardando o que vai ser impresso
Print:
	bge  x5, x6, End        # i >= 7?
	slli x8, x5, 2          # Iterator = x t.q. x ∈ [0, 4, ..., 100]
	add  x8, x8, x10        # Iterator = Pow[iterator]
	lw   x8, 0(x8)          # Potência de 10
	addi x28, x0, 0         # j = 0
Divide:
	blt  x22, x8, Next      # Result < Potência de 10^i
	sub  x22, x22, x8       # Result -= Potência de 10^i
	addi x28, x28, 1        # j += 1
	jal  x0, Divide         # Divide novamente
Next:
	blt  x21, x8, Continue  # Pular zeros a esquerda
	addi x28, x28, 48       # Converter para char
	sb   x28, 1024(x0)      # Escrever no buffer do monitor
Continue:
	addi x5, x5, 1          # i++
	jal  x0, Print          # Próxima
End:
	halt