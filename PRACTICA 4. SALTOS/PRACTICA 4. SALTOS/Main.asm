;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 4. SALTOS
;Descripción: Hace un salto para demostrar que puede saltar y no modificar algunas instrucciones que esten por en medio
INCLUDE Irvine32.inc

.data

.code
main PROC
	mov eax, 5	;Asignamos el valor de EAX como 5
	
	jmp continuar	;Salto incondicional que va directamente a la etiqueta continuar
	mov eax, 10	;Asignamos el valor de 10 en EAX

continuar:	;Etiqueta para que continue el mensaje
	call DumpRegs	;Llamada para mostrar los registros actuales en conola

	exit	;Fin del programa 
main ENDP

END main