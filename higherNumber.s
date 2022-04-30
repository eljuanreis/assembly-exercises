.data
	msgNum1: .asciiz "\nDigite o primeiro número: "
	msgNum2: .asciiz "\nDigite o segundo número: "
	msgNum1Final: .asciiz "\nO primeiro número é maior!"
	msgNum2Final: .asciiz "\nO segundo número é maior!"
	msgNumFinal: .asciiz "\nA diferença do maior pelo menor e: "
.text
main:

num1:
# Entrando com os dados no v0 para dizer qual instrução será executada
	li $v0, 4 
	la $a0, msgNum1 # Armazenando a mensagem no a0, que será chamado no syscall
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
num2:
# Entrando com o segundo número
	li $v0, 4 
	la $a0, msgNum2
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	# Comparando números
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

	# Saída de dados
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
	
	
	# Saída de dados
	sub $t3, $t2, $t0
	
	li $v0, 1
	add $a0, $t3, 0
	syscall
	j fim
fim:
	
	