.data
	msgNum1: .asciiz "\nDigite o primeiro n�mero: "
	msgNum2: .asciiz "\nDigite o segundo n�mero: "
	msgNum1Final: .asciiz "\nO primeiro n�mero � maior!"
	msgNum2Final: .asciiz "\nO segundo n�mero � maior!"
	msgNumFinal: .asciiz "\nA diferen�a do maior pelo menor e: "
.text
main:

num1:
# Entrando com os dados no v0 para dizer qual instru��o ser� executada
	li $v0, 4 
	la $a0, msgNum1 # Armazenando a mensagem no a0, que ser� chamado no syscall
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
num2:
# Entrando com o segundo n�mero
	li $v0, 4 
	la $a0, msgNum2
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	# Comparando n�meros
	bge $t0, $t2, num1maiorCond
	ble $t0, $t2, num2maiorCond
num1maiorCond:

	li $v0, 4 # 4 escrita de string
	la $a0, msgNum1Final
	syscall
	
	# Mensagem de diferenca
	li $v0, 4 # 4 escrita de string
	la $a0, msgNumFinal
	syscall

	# Sa�da de dados
	sub $t3, $t0, $t2
	
	li $v0, 1
	add $a0, $t3, 0
	syscall
	j fim
num2maiorCond:
	li $v0, 4 # 4 escrita de string
	la $a0, msgNum2Final
	syscall
	
	# Mensagem de diferenca
	li $v0, 4 # 4 escrita de string
	la $a0, msgNumFinal
	syscall
	
	
	# Sa�da de dados
	sub $t3, $t2, $t0
	
	li $v0, 1
	add $a0, $t3, 0
	syscall
	j fim
fim:
	
	