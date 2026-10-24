;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 6. DECREMENTO E INCREMENTO
;Descripción: En este programa vemos las funcions INC y DEC que nos ayudar a aunmentar o disminuir los valores en 1 en 1
INCLUDE Irvine32.inc

.data
    ;Mensajes a imprimir en consola
    msg BYTE "Escribe un numero: ", 0
    incremento BYTE "Incremento: ", 0
    decremento BYTE "Decremento: ", 0

.code
main PROC

    mov edx, OFFSET msg ;Carga la direccion del mensaje en EDX
    call WriteString    ;Imprime el consola el contenido de EDX
    call ReadInt    ;Lee un numero entero ingresado en la consola
    mov ebx, eax    ;Guarda una copia del numero ingresado

    mov edx, OFFSET incremento 
    call WriteString 
    inc eax ;Incrementa el valor de EAX en 1
    call WriteInt   ;Escribe el valor actualizado en EAX despues de incrementalor
    call Crlf   ;Salto de linea

    mov eax, ebx    ;Recupera el valor original

    mov edx, OFFSET decremento 
    call WriteString 
    dec eax ;Decrementa en 1 el valor que tenga EAX
    call WriteInt   ;Imprime el valor que contenga la direccion en EAX en la consola
    call Crlf   ;Salto de linea

    exit    ;Fin del programa
main ENDP

END main