;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 4.1 - MAYOR, MENOR O IGUAL CON ENTRADA DEL USUARIO
;Descripción: Este programa hacemos un ingreso de valores por parte del usuario y comparamos 2 numeros ingresados por el y vemos si es mayor, igual o menor
INCLUDE Irvine32.inc

.data
    n1 BYTE "Escribe el primer numero a comparar: ", 0
    n2 BYTE "Escribe el segundo numero a comparar: ", 0

    mensajeIguales BYTE "Los numeros son iguales", 0
    mensajeMayor BYTE "El primer numero es mayor", 0
    mensajeMenor BYTE "El primer numero es menor", 0

    num1 DWORD ?    ;Reserva espacio en memoria para guardar un valor
    num2 DWORD ?    ;Utiliza el ? para indicar que no se inicializara con ningun valor

.code
main PROC

    mov edx, OFFSET n1  ;Carga en EDX la direccion de memoria el mensaje de n1
    call WriteString    ;Imprimer en la terminal la direccion cargada de EDX
    call ReadInt    ;Lee un numro entero que sera escrito en terminal
    mov num1, eax   ;Guarda el valor escrito en la terminal a la variable num1

    mov edx, OFFSET n2  ;Carga en EDX la direccion de memoria el mensaje de n2
    call WriteString    ;Imprimer en la terminal la direccion cargada de EDX

    call ReadInt    ;Lee un numro entero que sera escrito en terminal
    mov num2, eax   ;Guarda el valor escrito en la terminal a la variable num1

    mov eax, num1   ;Mueve el valor de num1 al registro EAX
    mov ebx, num2   ;Mueve el valor de num2 al registro EBX

    cmp eax, ebx    ;Compara los 2 registros EAX y EBX

    ;Compara el primer registro con el segundo registro colocado en el cmp
    je iguales  ;Salto condicional si son iguales
    jg mayor    ;Salto condicional si es mayor
    jl menor    ;Salto condicional si es menor

iguales:    ;Etiqueta en caso que los valores de registros sean iguales
    mov edx, OFFSET mensajeIguales  ;Carga en EDX la la direccion con el mensaje
    call WriteString    ;Imprimer el mensaje cargado anteriormente

    jmp fin ;Salto hacia la etiqueta fin

mayor:  ;Etiqueta en caso que sea mayor
    mov edx, OFFSET mensajeMayor  
    call WriteString 

    jmp fin 

menor:  ;Etiqueta en caso que sea menor
    mov edx, OFFSET mensajeMenor 
    call WriteString 

fin:
    call Crlf   ;Salto de linea
    exit    ;Fin del programa

main ENDP

END main