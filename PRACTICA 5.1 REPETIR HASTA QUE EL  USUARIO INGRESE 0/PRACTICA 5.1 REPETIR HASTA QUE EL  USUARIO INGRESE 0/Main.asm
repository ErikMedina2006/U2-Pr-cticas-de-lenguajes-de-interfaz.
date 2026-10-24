;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 5.1 REPETIR HASTA QUE EL  USUARIO INGRESE 0
;Descripcion: En esta practica se diseño un sistema de un ciclo que no se 
;detendra hasta que el usuario ingrese un valor en consola de 0
INCLUDE Irvine32.inc

.data
    ;Mensajes que seran impresos en consola
    numero BYTE "Escribe un numero: ", 0    ;El 0 es para marcar el final de la linea
    mensajeIntentar BYTE "Ingrese nuevamente un numero", 0
    mensajeCero BYTE "Programa terminado, se ingreso el 0", 0

.code

main PROC
    
ciclo:
    mov edx, OFFSET numero  ;Carga el contenido a EDX
    call Crlf   ;Salto de linea
    call WriteString    ;Imprime el contenido en EDX en la consola

    call ReadInt    ;Llama a una funcion para leer un numero ingresado en consola

    cmp eax, 0  ;Compara el valor ingresado con 0 

    je fin  ;Si es igual a 0 salta a la etiqueta fin

    mov edx, OFFSET mensajeIntentar
    call Crlf   ;Salto linea
    call WriteString    ;Imprime el contenido actual de EDX

    jmp ciclo   ;Y hace un salto incondicional a ciclo

fin:
    mov edx, OFFSET mensajeCero ;Carga el contenido a EDX
    call Crlf   ;Salto de linea
    call WriteString    ;Imprime el contenido en EDX en la consola

    exit    ;Fin del programa
main ENDP

END main