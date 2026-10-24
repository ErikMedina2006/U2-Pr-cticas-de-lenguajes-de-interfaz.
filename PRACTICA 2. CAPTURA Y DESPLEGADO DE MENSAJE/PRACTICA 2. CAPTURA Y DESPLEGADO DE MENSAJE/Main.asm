;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 2. CAPTURA Y DESPLEGADO DE MENSAJE
;Descripción: En esta practica se hizo el ingreso de una cadena en consola y posteriormente la impresion de este mismo en consola
INCLUDE Irvine32.inc

.data
    mensaje BYTE "Escribe tu nombre: ", 0   ;Texto que sera mostrado al usuario
    nombre BYTE 30 DUP(0)   ;Reserva espacio de la memoria de 30 BYTES con cada Byte con un valor de 0

.code
main PROC
    mov edx, OFFSET mensaje ;Carga en el registro de memoria EDX la variable de mensaje
    call WriteString    ;Llamada al contenido de EDX y imprime el mensaje en la terminal de EDX

    mov edx, OFFSET nombre  ;Carga en el registro EDX la direccion del buffer
    mov ecx, SIZEOF nombre  ;Carga en el registro ECX el tamaño total en BYTES que puede leer

    call ReadString ;Llamada  a funcion para capturar un mensaje

    mov edx, OFFSET nombre  ;Carga en el registro EXD la variable de mensaje
    call WriteString    ;Llamada para imprimir el contenido de EDX
    call Crlf   ; Llamada a funcion para hacer un salto de linea en consola

    exit ;  Fin del programa

main ENDP

END main