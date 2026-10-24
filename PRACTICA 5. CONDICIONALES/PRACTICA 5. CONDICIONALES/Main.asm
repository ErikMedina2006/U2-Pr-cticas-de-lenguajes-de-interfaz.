;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 5. CONDICIONALES
;Descripcion: En este programa vemos los ciclos pero con condiciones como casos si son mayor o igual o menos
INCLUDE Irvine32.inc

.code
main PROC

    mov ebx, 1  ;Inicializa el valor de EBX en 1

;Este es un ejemplo de como hacer el ejercicio primero se pregunta y luego se ejecuta

cicloWhile:
    cmp ebx, 100    ;Compara si EBX con 100

    jg fin  ;Si EBX es mayor a 100 salta a la etiqueta 100

    mov eax, ebx    ;Copia el valor actual de EBX en EAX
    call WriteDec   ;Imprime el valor actual de EAX
    call Crlf   ;Salto de linea

    inc ebx     ;E incremente en 1 el valor de EBX para el siguiente ciclo
    jmp cicloWhile  ;Salta incondicionalmente para repetir el ciclo

fin:
    call Crlf   ;Salto de linea

;Este es otro ejemplo de como hacer el ejercicio primero se ejecuta y luego se pregunta

    mov ebx, 1  ;Se inicializa el valor de EBX en 1
CicloDo:

    mov eax, ebx    ;Copia el valor de EBX a EAX
    call WriteDec   ;Imprime el numero actual de EAX en consola
    call Crlf       ;Salto de linea

    inc ebx         ;Incremente el valor de EBX en 1
    cmp ebx, 100    ;Compara si el valor

    jle CicloDo     ;Y si es mayor o igual a 100 repite el ciclo y va a la etiqueta CicloDo

    exit    ;Fin del programa
main ENDP

END main