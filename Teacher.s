.data
	lvl: .asciiz "\nDigite o nível do professor (1/2/3): "
	qntHoras: .asciiz "\nDigite a quantidade de horas aula dadas no mes: "
	salario: .asciiz "\nO salario e: R$ "
.text
main:

	# A escola “APRENDER” faz o pagamento de seus professores por hora/aula. 
	# Faça, em Assembly MIPS, um 
	# algoritmo que peça para entrar com o nível do professor (1, 2 ou 3), a quantidade de horas aula dadas no mês, calcule e
	# exiba o salário de um professor. Sabe-se que o valor da hora/aula segue a tabela abaixo:
	# Professor Nível 1 R$12,00 por hora/aula
	# Professor Nível 2 R$17,00 por hora/aula
	# Professor Nível 3 R$25,00 por hora/aula
	# O algoritmo deve pedir o nível do professor sucessivamente, até que seja digitado um valor válido

	li $v0, 4 
	la $a0, lvl # Armazenando a mensagem no a0, que será chamado no syscall
	syscall
	
	# Entrada do número
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	bgt $t0, 3, main # se for maior que 3
	blt $t0, 1, main # se for menor que 1
	
	# Entrando qnt horas
	li $v0, 4 
	la $a0, qntHoras # Armazenando a mensagem no a0, que será chamado no syscall
	syscall
	
	# Entrada do número
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	# Comparações de lvl
	beq $t0, 1, profLevel1
	beq $t0, 2, profLevel2
	beq $t0, 3, profLevel3
	
profLevel1:
	mul $t2, $t1, 12 # Professor Nível 1 R$12,00 por hora/aula
	j saida
profLevel2:
	mul $t2, $t1, 17 # Professor Nível 2 R$17,00 por hora/aula
	j saida
profLevel3:
	mul $t2, $t1, 25 # Professor Nível 3 R$25,00 por hora/aula
	j saida
saida:
	li $v0, 4 
	la $a0, salario # Armazenando a mensagem no a0, que será chamado no syscall
	syscall
	
	li $v0, 1
	add $a0, $t2, 0
	syscall
	