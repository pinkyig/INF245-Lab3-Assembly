.data
num_discos: .word 3        @ Variable para almacenar el número de discos

.text
.global main

main:
    @ Inicialización
    ldr r0, =num_discos   @ R0 contendrá la dirección de num_discos
    ldr r1, [r0]          @ Cargar el número de discos en R1

    @ Llamando  a la función recursiva para resolver la Torre de Hanoi
    bl hanoi

   
    mov r0, r2            @ R0 contendrá el resultado (cantidad de movimientos)
    bl printInt           @ Llamar a la función para imprimir un entero
    bx lr                 @ Regresar

hanoi:
    @ Función recursiva para resolver la Torre de Hanoi
    push {lr, r1, r3}     @ Guardar el link register y los registros usados

    cmp r1, #1            @ Caso base: si solo hay un disco, se realiza un movimiento
    beq base_case

    @ Caso recursivo: T(n) = 2 * T(n-1) + 1
    sub r1, r1, #1        @ n-1
    bl hanoi              @ Llamada recursiva para T(n-1)
    mov r3, r2            @ Guardar el resultado de T(n-1) en R3

    lsl r3, r3, #1        @ Multiplicar por 2
    add r2, r3, #1        @ T(n) = 2 * T(n-1) + 1
    pop {r3, r1, pc}      @ Restaurar los registros y regresar

base_case:
    mov r2, #1            @ Si hay un solo disco, se necesita un movimiento
    pop {r3, r1, pc}      @ Restaurar los registros y regresar
