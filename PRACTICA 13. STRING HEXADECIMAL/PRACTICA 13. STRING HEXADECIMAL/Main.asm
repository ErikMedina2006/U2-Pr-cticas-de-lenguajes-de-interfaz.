;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 13. STRING HEXADECIMAL
;Descripción: En esta practica se convierte un valor hexadecimal en una cadena de texto
INCLUDE Irvine32.inc

.data
    valorOriginal DWORD 12AB34CDh
    bufferHex BYTE 9 DUP(0)

.code
main PROC
    mov eax, 12AB34CDh ; Guardar valor
    mov ecx, 8 ; Cantidad de vueltas
    mov esi, 8 ; Última posición útil del búfer (índice 8 para el fin de cadena)

    ; Asegurar el fin de cadena (null-terminator) en la posición 8
    mov byte ptr bufferHex[esi], 0 
    dec esi ; Empezar a escribir desde la posición 7 hacia atrás

conv_loop:
    push eax ; Guardar eax
    and eax, 0Fh ; Tomar último dígito
    
    cmp al, 9 ; Revisar si es número
    jbe es_num ; Saltar si es número
    sub al, 10 ; Restar 10
    add al, 'A' ; Convertir a letra (A-F)
    jmp almacenar ; Ir a guardar
es_num:
    add al, '0' ; Convertir a número (0-9)
almacenar:
    mov bufferHex[esi], al ; Guardar carácter en el búfer
    pop eax ; Recuperar eax
    shr eax, 4 ; Mover 4 bits a la derecha para el siguiente dígito
    dec esi ; Regresar una posición hacia la izquierda
    loop conv_loop ; Repetir ciclo

    mov edx, OFFSET bufferHex ; Cargar dirección de la cadena
    call WriteString ; Mostrar cadena en pantalla
    call Crlf ; Salto de línea

    exit
main ENDP

END main