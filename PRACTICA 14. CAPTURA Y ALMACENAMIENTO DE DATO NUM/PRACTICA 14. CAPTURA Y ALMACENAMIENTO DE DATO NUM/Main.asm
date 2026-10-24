;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 14. CAPTURA Y ALMACENAMIENTO DE DATO NUM
;Descripción: Lo que se hace en este proyecto es ingresar un valor en consola y se le suma 25 
;e imprime el valor obtenido
INCLUDE Irvine32.inc

.data

cantidadInicial DWORD 25
cantidadRecibida DWORD ?
existenciaActual DWORD ?

recepcion BYTE "Ingrese una cantidad (1-99): ",0
mensajeError BYTE "Cantidad recibida invalida",0

mensajeExiIni BYTE "Existencia inicial ",0
mensajeRecep BYTE " + recepcion de ",0
mensajeExiAct BYTE " existencia actual ",0
mensajeUni BYTE " unidades",0

cadena BYTE 10 DUP(0)
buffer BYTE 3 DUP(0)

.code
main PROC

capturar:   ;Etiqueta de captura de valores
    ;Carga y muestra el mensaje en consola
    mov edx, OFFSET recepcion
    call WriteString

    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString ;Escritura de la cadena en consola 

    cmp eax, 0  ;Compara EAX con 0 para verificar si lo escrito es correcto
    je error    ;En caso contrario salta a la etiqueta error

    cmp eax, 2  ;Verifica el caso si escribiste mas de 2 caracteres
    ja error    ;En caso contrario salta a la etiqueta error

    mov bl, buffer[0]   ;Obtiene el primer caracter ingresado en bl

    cmp bl, '0' ;Compara si el caracter es menor a 0
    jb error    ;Salto a error

    cmp bl, '9' ;Compara si el caracter es mayor a 9
    ja error    ;Salto a error

    cmp eax, 1  ;Compara si solo es un solo digito
    je unDigito ;Si es 1 digito salta  al realizar el procedimiento

    mov bl, buffer[1]   

    cmp bl, '0'
    jb error

    cmp bl, '9'
    ja error

    movzx eax, buffer[0]
    sub eax, '0'

    mov ebx, 10
    mul ebx

    movzx ebx, buffer[1]
    sub ebx, '0'

    add eax, ebx
    jmp validarRango

unDigito:
    movzx eax, buffer[0]
    sub eax, '0'

validarRango:
    cmp eax, 1
    jb error

    cmp eax, 99
    ja error

    mov cantidadRecibida, eax ; Guarda la cantidad recibida
    mov eax, cantidadInicial ; Carga la existencia inicial
    add eax, cantidadRecibida ; Suma la cantidad recibida
    mov existenciaActual, eax ; Guarda la existencia actual

    ; MUESTRA LA EXISTNCIA INICIAL
    mov edx, OFFSET mensajeExiIni
    call WriteString

    mov eax, cantidadInicial
    mov esi, OFFSET cadena
    call convertirDecimal

    mov edx, OFFSET cadena
    call WriteString

    ; MUESTRA LA CANTIDAD RECIBIDA
    mov edx, OFFSET mensajeRecep
    call WriteString

    mov eax, cantidadRecibida
    mov esi, OFFSET cadena
    call convertirDecimal

    mov edx, OFFSET cadena
    call WriteString

    ; MUESTRA LA EXISTENCIA ACTUAL
    mov edx, OFFSET mensajeExiAct
    call WriteString

    mov eax, existenciaActual
    mov esi, OFFSET cadena
    call convertirDecimal

    mov edx, OFFSET cadena
    call WriteString

    mov edx, OFFSET mensajeUni
    call WriteString

    call Crlf ; Realiza un salto de linea
    exit ; Termina el programa
error:

    mov edx, OFFSET mensajeError
    call WriteString
    call Crlf
    jmp capturar    ;Regresa al inicio de la etiqueta
main ENDP
convertirDecimal PROC
    ;Inicializar las direcciones a utilizar
    mov ecx, 0
    mov ebx, 10

convertirLoop:
    mov edx, 0  ;Limpia el registro EDX antes de cada division
    div ebx     ;Realiza la division

    push edx    ;Guarda el digito obtenido en la pila
    inc ecx     ;Incrementa el contador de digitos

    cmp eax, 0  ;Revisa si el resultado de la division es igual a 0
    jne convertirLoop   ;En caso de no ser 0 el ciclo se repite

cadenaLoop:
    pop edx     ;Recupera el digito guardado en la pila
    add dl, '0' ;Convierte el valor numerico a codigo ASCII

    mov [esi], dl   ;Almacena el caracter convertido en la posicion actual
    inc esi         ;Avanza a la siguiente posicion en el bufer

    loop cadenaLoop

    mov BYTE PTR [esi], 0   ;Coloca un numero 0 al final de la cadena

    ret ; Regresa al programa principal
convertirDecimal ENDP

END main