.data
packages: .word 3,5,1,5,2  @ Ejemplo de lista de paquetes con hasta 5 elementos
num_packages: .word 5          @ Número de paquetes en la lista
max_data: .space 20            @ Espacio para 6 enteros (8*4 bytes, un extra para límites)

.text
.global main

.text
.global main

main:
    @ Inicializar
    ldr r0, =num_packages
    ldr r1, [r0]       @ R1 contiene el número de paquetes
    sub r1, r1, #1     @ Ajustar el índice para recorrer la lista de derecha a izquierda
    ldr r0, =packages  @ R0 apunta a la lista de paquetes
    ldr r2, =max_data  @ R2 apunta a la lista max_data

    @ Inicializar max_data
    mov r3, r1         @ R3 será el índice de trabajo

initialize_max_data:
    cmp r3, #0
    blt computation_done
    lsl r4, r3, #2
    ldr r5, [r0, r4]   @ Cargar el paquete actual en r5
    str r5, [r2, r4]   @ Guardar el paquete en max_data
    sub r3, r3, #1
    b initialize_max_data

computation_done:
    @ Inicializar los valores para las últimas posiciones
    ldr r1, =num_packages
    ldr r1, [r1]
    sub r1, r1, #1
compute_max_data:
    cmp r1, #0
    blt end            @ Si R1 < 0, terminar

    mov r4,r1 @ j=i
    sub r4,r4,#3@ j= j-3
    cmp r4, #0
    blt contador2Negativo
    

    lsl r5, r1, #2     @ r5 = i * 4
    ldr r6, [r0, r5]   @ r6 = paquetes[i]

    lsl r7, r4, #2     @r7 = j*4
    ldr r3,[r2,r7] @r8 = max[j] o paquetes[i-3]

    add r3, r3,r6

    cmp r3,r8
    bge store_r8    @ Si R3 >= R8, saltar a store_r9
    sub r1,r1,#1
    b compute_max_data

store_r8:

	mov r8,r3

    	sub r1, r1, #1
    	b compute_max_data

contador2Negativo:
	@Cuando el contador auxiliar nos da negativo significa que llegamos la limite por ende ya encontramos el maximo valor
	b end


end:

    @ Printear
    mov r2, r8         @ En r2 debemos almacenar que queremos printear
    mov r0, #1         @ En r0 almacenamos la posición en x de donde queremos printear
    mov r1, #2         @ En r1 almacenamos la posición en y de donde queremos printear
    bl printInt        @ Finalmente llamamos a la función para printear enteros
    wfi  




	
	
