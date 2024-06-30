.data
n: .word 5             @ Cambia este valor según el número de discos que deseas probar
msg: .asciz "el numero de movimientos es"
.text
.global main

main:
	mov r0, #0
	mov r1, #0
	ldr r2, =msg
	bl printString
        ldr r0, =n          @ Cargar la dirección de n en R0
        ldr r1, [r0]        @ Cargar el valor de n en R1

        mov r2, #1          @ Inicializa R2 a 1 (2^0)
        mov r3, #0          @ Inicializa R3 a 0 (contador de bucles)

loop:
        cmp r3, r1          @ Comparar el contador con n
        beq end_loop        @ Si son iguales, sal del bucle
        lsl r2, r2, #1      @ Multiplica R2 por 2 (equivalente a 2^i)
        add r3, r3, #1      @ Incrementa el contador
        b loop

end_loop:
	b end

end:
        sub r2, r2, #1      @ Resta 1 para obtener 2^n - 1

        @ Mostrar el resultado en consola (QtARMSim)
        @ Llamada al sistema para escribir
        mov r2, r2         
    	mov r0, #0         @ En r0 almacenamos la posición en x de donde queremos printear
    	mov r1, #2         @ En r1 almacenamos la posición en y de donde queremos printear
    	bl printInt        @ Finalmente llamamos a la función para printear enteros
    	wfi

	
