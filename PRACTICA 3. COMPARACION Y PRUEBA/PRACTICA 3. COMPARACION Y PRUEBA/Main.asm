;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 3. COMPARACION Y PRUEBA
;Descripción: El programa compara 2 numeros si son iguales o diferentes
INCLUDE Irvine32.inc

.data
    mensajeIguales BYTE "Los numeros son iguales", 0    ;Mensaje que se mostrara en consola
    mensajeDiferentes BYTE "Los numeros son diferentes", 0  ;Mensaje que se mostrara en consola

.code
main PROC

    mov eax, 65 ;EAX toma el valor de 65
    mov ebx, 30 ;EBX toma el valor de 30

    cmp eax, ebx    ;Compara el valor de los registros entre EAX y EBX

    je iguales  ;Salta en caso que sean iguales
    mov edx, OFFSET mensajeDiferentes   ;Carga el mensaje de EDX
    call WriteString    ;Imprime el mensaje almacenado en EDX

    jmp fin ;Hace que haga un salto a la etiqueta fin

iguales:    ;Etiqueta en caso que sean iguales
    mov edx, OFFSET mensajeIguales  ;Carga el mensaje de EDX
    call WriteString    ;Llamada al mensaje en que fue cargado anteriormente

fin: 
    exit    ;Fin del programa

main ENDP

END main