.data
	entreNum1: .asciiz "\nDigite o primeiro numero: "
	entreNum2: .asciiz "\nDigite o segundo numero: "
	entreNum3: .asciiz "\nDigite o terceiro numero: "
	linha: .asciiz "\n"
	dump: .asciiz "Aqui"
.text
main:
 #Fazer, em Assembly MIPS, um algoritmo que leia três valores inteiros e diferentes e mostre-os em ordem decrescente.
 #t0 = num1; #t1 = num2: #t2 = num3;
 
lerNum1:
	li $v0, 4
	la $a0, entreNum1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
lerNum2:
 	li $v0, 4
	la $a0, entreNum2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
lerNum3:
 	li $v0, 4
	la $a0, entreNum3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
# numero1 > numero2 e numero2 > numero3
se1Poss1:
	bgt $t0, $t1, se2Poss1
	j se1Poss2
se2Poss1:
	bgt $t1, $t2, fimPoss1
	
# numero2 > numero1 e numero1 > numero3
se1Poss2:
	bgt $t1, $t0, se2Poss2
	j se1Poss3
se2Poss2:
	bgt $t0, $t2, fimPoss2
	j se2Poss3
	
# numero3 > numero1 e numero2 > numero1
se1Poss3:
	bgt $t2, $t0, se2Poss3
se2Poss3:
	bgt $t1, $t0, fimPoss3

# Saída
fimPoss1:
	
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
	li $v0, 4
	la $a0, linha
	syscall
	
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, linha
	syscall
	
	li $v0, 1
	add $a0, $t2, 0
	syscall
	j fim
fimPoss2:
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, linha
	syscall
	
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
	li $v0, 4
	la $a0, linha
	syscall
	
	li $v0, 1
	add $a0, $t2, 0
	syscall
	j fim
fimPoss3:
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	li $v0, 4
	la $a0, linha
	syscall
	
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, linha
	syscall
	
	li $v0, 1
	add $a0, $t0, 0
	syscall
	j fim
fim:

	