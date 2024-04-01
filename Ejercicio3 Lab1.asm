.data
prompt: .asciiz "Ingresa un numero base para generar la serie de Fibonacci: "
result_msg: .asciiz "La serie de Fibonacci es: "

.text
.globl main

main:
    # Solicitar al usuario un n�mero entero
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Leer el n�mero entero ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0   # Guardar el n�mero ingresado en $t0

    # Mostrar mensaje de la serie Fibonacci
    li $v0, 4
    la $a0, result_msg
    syscall

    # Inicializar los primeros dos n�meros de la serie Fibonacci
    li $t1, 0       # Primer n�mero de la serie Fibonacci
    li $t2, 1       # Segundo n�mero de la serie Fibonacci
    move $t3, $t0   # Guardar el l�mite de la serie en $t3

    # Mostrar los primeros dos n�meros de la serie
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 11      # Imprimir espacio
    li $a0, 32
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # Generar y mostrar la serie Fibonacci hasta el n�mero ingresado por el usuario
    loop:
        # Calcular el siguiente n�mero de Fibonacci
        add $t3, $t1, $t2
        
        # Mostrar el n�mero de Fibonacci actual
        li $v0, 11      # Imprimir espacio
        li $a0, 32
        syscall
        li $v0, 1
        move $a0, $t3
        syscall

        # Actualizar los n�meros para el pr�ximo c�lculo
        move $t1, $t2
        move $t2, $t3

        # Verificar si se alcanz� el l�mite
        bge $t3, $t0, end_loop

        j loop

    end_loop:
    # Salto de l�nea
    li $v0, 11
    li $a0, 10
    syscall

    # Terminar el programa
    li $v0, 10
    syscall
