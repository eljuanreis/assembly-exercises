.data
	msgNum1: .asciiz "\nDigite o número (entre 0 e 10): "
	fatorialText: .asciiz "\nO Fatorial e: "
.text
main:
# Entrando com os dados no v0 para dizer qual instrução será executada
	li $v0, 4 
	la $a0, msgNum1 # Armazenando a mensagem no a0, que será chamado no syscall
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0 # entrada de dados
	
	# Validações de número
	blt $t0, 0, main # caso seja menor que 0
	bgt $t0, 10, main # caso seja maior que 10
		
	li $t1, 1 # i = 1
	li $t2, 1
	j fatorial
	
#t0 = limite; #t1 = i; #t2 = fat
fatorial:
	mul $t2, $t2, $t1
	add $t3, $t2,0 
	
	add $t1, $t1, 1
	ble $t1, $t0, fatorial
	j mostrarResultado
mostrarResultado:
	li $v0, 4 
	la $a0, fatorialText
	syscall
	
	li $v0, 1
	add $a0, $t3, 0
	syscall
