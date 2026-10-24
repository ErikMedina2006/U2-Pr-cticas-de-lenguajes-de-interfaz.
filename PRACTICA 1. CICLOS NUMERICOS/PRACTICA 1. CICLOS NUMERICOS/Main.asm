;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 1. CICLOS NUMERICOS
;Descripción: Este programa hace un ciclo de 20 iteraciones
INCLUDE Irvine32.inc

.data

.code
main PROC
    mov ecx, 20  ;Inicializando el registro ECX en 20

ciclo:  ;Etiqueda que marca el inicio del ciclo
    mov eax, ecx    ;Copia el valor actual de ECX a EAX

    call WriteDec   ;Imprime el numero en el registro EAX
    call Crlf   ;Salto de linea
    loop ciclo  ;Hace la funcion de ir a la etiqueta y repetir en ciclo si es diferente de cero regresa, si es 0 termina el ciclo y salta a la siguiente instruccion

    exit    ;Fin del programa
    
main ENDP

END main