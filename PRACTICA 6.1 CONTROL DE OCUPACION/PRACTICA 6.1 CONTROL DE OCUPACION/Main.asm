;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 6.1 CONTROL DE OCUPACION
;Descripción: En este programa vemos la simulacion de un estacionamiento
INCLUDE Irvine32.inc

.data
    ;Mensajes que se mostraran en consola
    msg1 BYTE "Cantidad de espacios del estacionamiento: ", 0
    msg2 BYTE "Ingrese 1 para estacionar un auto: ", 0
    msg3 BYTE "Espacios disponibles: ", 0
    msg4 BYTE "Estacionamiento lleno, no se pueden estacionar mas autos", 0
    ;Variables declaradas sin valor 
    espacios DWORD ?
    estacionar DWORD ?

.code
main PROC
    mov edx, OFFSET msg1    ;Obtiene el contenido de msg1 y lo toma la direccion de EDX
    call WriteString    ;Imprime en consola el contenido que contenga EDX
    call ReadInt    ;Lee un numero entero ingresado en consola
    mov espacios, eax   ;Guarda el valor ingresado en consola en la variable sin valor

ciclo:
    cmp espacios, 0 ;Compara la variable con 0
    je lleno    ;Si es igual a 0 salta a la etiqueta lleno

    mov edx, OFFSET msg2 
    call WriteString    ;Imprime el contenido que tendra la direccion EDX
    call ReadInt    ;Lee un numero entero ingresado en consola
    mov estacionar, eax ;Guarda el valor ingresado en consola en la variable sin valor

    cmp estacionar, 1   ;Compara si el valor ingresado es 1
    jne ciclo   ;Si es diferente de 1 regresa al inicio del ciclo

    dec espacios    ;Resta 1 a espacios

    mov edx, OFFSET msg3 
    call WriteString    ;Imprime el valor en la direccion de EDX
    mov eax, espacios   ;Da el numero actual de espacion en EAX
    call WriteDec   ;Imprime el numero en la consola en la direccion de EAX
    call Crlf   ;Salto de linea

    jmp ciclo   ;Regresa incondicionalmente al inicio para el siguiente auto

lleno:
    mov edx, OFFSET msg4 
    call WriteString    ;Imprime el contenido de la direccion EDX
    call Crlf   ;Salto linea
    exit    ;Fin del programa

main ENDP
END main