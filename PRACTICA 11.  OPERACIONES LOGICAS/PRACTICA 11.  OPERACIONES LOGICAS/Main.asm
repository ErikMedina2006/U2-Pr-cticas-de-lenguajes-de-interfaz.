;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 11.  OPERACIONES LOGICAS
;Descripción: Aqui vemos las operaciones condicionales lo que son AND, OR, XOR y TEST
INCLUDE Irvine32.inc

.data
alarmaEncencida BYTE "Alarma encendida",0
alarmaApagada BYTE "Alarma apagada",0

; Estados de computadora:
; 0 - Computadora encendida
; 1 - Alarma encendida
; 2 - Computadora conectada a internet
; Estados: 0 = Apagado, 1 = Encendido

; Estado inicial: 0000 0101

.code
main PROC

    ; 1 - OPERACION AND: REVISAR SI LA ALARMA ESTA ENCENDIDA
    mov eax, 0 ; Inicializa EAX como 0
    mov al, 00000101b ; Guarda el estado inicial
    and al, 00000010b ; Revisa solo el bit de la alarma

    call WriteBin ; Muestra el resultado en binario

    nop

    ; 2 - OPERACION OR: ENCENDER LA ALARMA
    mov eax, 0 ; Inicializa EAX nuevamente
    mov al, 00000101b ; Guarda otra vez el estado inicial
    or al, 00000010b ; Enciende la alarma colocando 1 en ese bit

    call WriteBin ; Muestra el nuevo estado

    nop

    ; 3 - OPERACION XOR: CAMBIAR EL ESTADO DE LA COMPUTADORA
    mov eax, 0 ; Inicializa EAX 
    mov al, 00000101b ; Guarda el estado inicial
    xor al, 00000001b ; Cambia el estado de la computadora

    call WriteBin ; Muestra el resultado en binario

    nop

    ; 4 - OPERACION TEST: REVISAR SI LA ALARMA ESTA ENCENDIDA
    mov eax, 0 ; Inicializa EAX 
    mov al, 00000111b ; Estado con la alarma encendida

    test al, 00000010b ; Verifica el bit de la alarma
    jz apagarAlarma ; Si vale 0 salta a apagarAlarma

    mov edx, OFFSET alarmaEncencida ; Guarda la direccion del mensaje
    call WriteString ; Muestra el mensaje en pantalla
    call Crlf ; Realiza un salto de linea
    jmp fin ; Salta al final del programa

apagarAlarma:
    mov edx, OFFSET alarmaApagada ; Guarda la direccion del mensaje
    call WriteString ; Muestra el mensaje en pantalla
    call Crlf ; Realiza un salto de linea

fin:
    exit
main ENDP

END main