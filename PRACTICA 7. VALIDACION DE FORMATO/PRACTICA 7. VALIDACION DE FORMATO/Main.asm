;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 7. VALIDACION DE FORMATO
;Descripción: En este programa vemos la validacion de un formato solicitado en especifico y la forma de comprobarlo
;Usando los ciclos definiendo espacio en el bufer y leyendo cadenas de texto y digitos
INCLUDE Irvine32.inc

.data
    ;Mensajes a desplegar
    cadena BYTE "Escribe una cadena (ejemplo TEC-123): ", 0
    mensajeValido BYTE "Cadena valida", 0
    mensajeInvalido BYTE "Cadena invalida", 0
    ;Tamaño maximo del buffer
    MAX = 20
    ;Bufer para almacenar la cadena
    stringIn BYTE MAX+1 DUP(?)

.code
main PROC
    mov edx, OFFSET cadena  ;Carga el contenido de la cadena en la direccion EDX
    call WriteString    ;Muestra en colsola el mensaje

    mov edx, OFFSET stringIn    ;Carga la direccion del buffer en EDX
    mov ecx, MAX    ;Define el numero maximo de caracteres
    call ReadString ;Lee el valor ingresado por uno mismo en la consola

    cmp eax, 7  ;Compara si la longitudingresada es exactamente de 7 caracteres
    jne cadenaInvalida  ;Si es diferente de 7 se va a la etiqueta cadenaInvalida

    mov esi, 0  ;Inicializa ESI en 0
    mov ecx, 3  ;Declara un valor para el contador de 3 para escribir las letras

validarLetras:
    mov al, stringIn[esi]   ;Obtiene el caracter actual de la cadena
    cmp al, 'A' ;Copara si el caracter es menor al codigo ASCII de la A
    jl cadenaInvalida   ;Si es menor salta a la etiqueta cadenaInvalida

    cmp al, 'Z' ;Copara si el caracter es mayor al codigo ASCII de la Z
    jg cadenaInvalida   ;Si es mayor salta a la etiqueta cadenaInvalida

    inc esi     ;Avanza a la siguiente posicion de la cadena
    loop validarLetras  ;Y regresa a validad las letras faltantes

    mov al, stringIn[3] ;Obtiene el cuarto caracter de la cadena
    cmp al, '-'     ;Compara si es exactamente un -
    jne cadenaInvalida  ;Si es diferente a - va a la etiqueta de cadenaInvalida

    mov esi, 4  ;Asignamos el valor en ESI en el 4 para estar en esa posicion de la cadena
    mov ecx, 3  ;Prepara un contador para los numeros

validarNumeros:
    mov al, stringIn[esi]   ;Obtiene el caracter actual

    cmp al, '0'     ;Compara si es menor al codigo ASCII del 0
    jb cadenaInvalida   ;Si es menor salta a la etiqueta de cadenaInvalida

    cmp al, '9'     ;Compara si es mayor al codigo ASCII del 9
    ja cadenaInvalida   ;Si es mayor salta a la etiqueta de cadenaInvalida

    inc esi     ;Incrementa ESI para estar en la siguiente posicion de la cadena
    loop validarNumeros     ;Y repita a validar los otros numeros

    jmp cadenaValida

cadenaValida:
    mov edx, OFFSET mensajeValido   ;Carga el mensaje de exito
    call WriteString    ;Imprime el contenido de mensajeValido
    jmp fin     ;Salta a la etiqueta fin

cadenaInvalida:
    mov edx, OFFSET mensajeInvalido ;Carga el mensaje de error
    call WriteString    ; Imprime "Cadena invalida" en consola

fin:
    call Crlf   ;Imprime un salto de linea
    exit    ;Fin del programa
main ENDP

END main