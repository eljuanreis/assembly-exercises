.data
	msgNum1: .asciiz "\nDigite um número (ou tecle 0 para encerrar): "
	media: .asciiz "\nA media aritmetica e: "
	qtpositivos: .asciiz "\nA quantidade de positivos e: "
	qtnegativos: .asciiz "\nA quantidade de negativos e: "
.text
main:
# Fazer, em Assembly MIPS, um 
# algoritmo que leia um número não determinado de valores e calcule e 
# escreva a média aritmética(inteira( dos valores lidos, a quantidade de valores positivos, 
# a quantidade de valores negativos. A saída aparecerá quando o usuário digitar o número 0
 
enquanto:
	# t0 = número, t1 = contador de número, t2 = contador de valores positivos, t3 = contador de valores negativos, t4 = soma dos números
	li $v0, 4 
	la $a0, msgNum1 # Armazenando a mensagem no a0, que será chamado no syscall
	syscall
	
	# Entrada do número
	li $v0, 5
	syscall
	add $t0, $v0, 0

	add $t4, $t4, $t0 # soma dos números
	
	bgt $t0, 0, somaPositivo
	blt $t0, 0, somaNegativo
	j saida
somaPositivo:
	add $t2, $t2, 1
	add $t1, $t1, 1 # contador de números
	bne, $t0, 0, enquanto
	j saida
somaNegativo:
	add $t3, $t3, 1
	add $t1, $t1, 1 # contador de números
	bne, $t0, 0, enquanto
	j saida
saida:
	# Saida da media
	li $v0, 4 
	la $a0, media
	syscall
	
	li $v0, 1
	div $a0, $t4, $t1
	syscall
	
	# Saida valores positivos
	li $v0, 4 
	la $a0, qtpositivos
	syscall
	
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	# Saida valores negativos
	li $v0, 4 
	la $a0, qtnegativos
	syscall
	
	li $v0, 1
	add $a0, $t3, 0
	syscall

