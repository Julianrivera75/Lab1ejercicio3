.data
prompt: .asciiz "Ingresa un numero base para generar la serie de Fibonacci: "
result_msg: .asciiz "La serie de Fibonacci es: "

.text
.globl main

main:
    # Solicitar al usuario un número entero
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Leer el número entero ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0   # Guardar el número ingresado en $t0

    # Mostrar mensaje de la serie Fibonacci
    li $v0, 4
    la $a0, result_msg
    syscall

    # Inicializar los primeros dos números de la serie Fibonacci
    li $t1, 0       # Primer número de la serie Fibonacci
    li $t2, 1       # Segundo número de la serie Fibonacci
    move $t3, $t0   # Guardar el límite de la serie en $t3

    # Mostrar los primeros dos números de la serie
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 11      # Imprimir espacio
    li $a0, 32
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # Generar y mostrar la serie Fibonacci hasta el número ingresado por el usuario
    loop:
        # Calcular el siguiente número de Fibonacci
        add $t3, $t1, $t2
        
        # Mostrar el número de Fibonacci actual
        li $v0, 11      # Imprimir espacio
        li $a0, 32
        syscall
        li $v0, 1
        move $a0, $t3
        syscall

        # Actualizar los números para el próximo cálculo
        move $t1, $t2
        move $t2, $t3

        # Verificar si se alcanzó el límite
        bge $t3, $t0, end_loop

        j loop

    end_loop:
    # Salto de línea
    li $v0, 11
    li $a0, 10
    syscall

    # Terminar el programa
    li $v0, 10
    syscall
