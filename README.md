## **Integrantes**

Integrentes: Alejandro Rojo y Bryan Olivares

Roles: 202130524-6 y 202173571-2

Paralelo 201







## Especificación del Algoritmo y Desarrollo Realizado Pregunta 1

El algoritmo sigue estos pasos:

1. **Inicialización de Datos:**
   - El espacio `max_data` se prepara para almacenar los valores máximos encontrados durante el procesamiento.
   - Se cargan los datos del número de paquetes y los valores de los paquetes en los registros.

2. **Copia de Datos Iniciales:**
   - Se recorre la lista de paquetes de derecha a izquierda (por las buenas practicas aprendidas en catedra) y se copia cada valor a la lista `max_data`. Esto  para las futuras comparaciones.

3. **Cálculo de los Valores Máximos:**
   - Se implementa la regla de procesar un paquete y saltarse 2 o saltarse al siguiente, esto se realiza hasta que no se pueda realizar un salto por el limite del arreglo.
   - El algoritmo compara la suma obtenida con el valor almacenado luego de aplicada la regla en `max_data` para encontrar el máximo valor.

4. **Salida del Resultado:**
   - Finalmente, el valor máximo calculado se imprime por pantalla usando una llamada a la función `printInt`.

**IMPORTANTE**

Dentro del programa se incluyen comentarios explicativos para poder aumentar o disminuir el tamano del arreglo tanto de paquetes como auxliar importante asignarle 
la suficiente memoria al auxliar.






