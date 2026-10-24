;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 10. CADENA CON DECIMAL
;Descripción: En este programa calculamos y medio simulamos un monitoria el estado de una descarga de datos
INCLUDE Irvine32.inc

.data
	bytesDesc DWORD ?
	bytesPend DWORD ?
	gruposComp DWORD ?
	porcentaje DWORD ?
	residuo DWORD ?
	bufferASCII BYTE 11 DUP(0)

.code

main PROC

	mov eax, 125 ; Tamaño descargado
	mov ebx, 512 ; Tamaño de cada bloque
	mul ebx ; Multiplicar
	mov bytesDesc, eax ; Guardar bytes descargados
	
	mov esi, OFFSET bufferASCII ; Cargar buffer
	call convertirDecimal ; Convertir a texto
	mov edx, OFFSET bufferASCII ; Cargar cadena
	call WriteString ; Mostrar cadena
	call Crlf ; Salto de linea

	mov eax, 100000 ; Total de bytes
	sub eax, bytesDesc ; Restar descargados
	mov bytesPend, eax ; Guardar pendientes
	
	mov eax, bytesPend ; Cargar pendientes
	mov esi, OFFSET bufferASCII ; Cargar buffer
	call convertirDecimal ; Convertir a texto
	mov edx, OFFSET bufferASCII ; Cargar cadena
	call WriteString ; Mostrar cadena
	call Crlf ; Salto de linea

	mov eax, bytesDesc ; Cargar descargados
	mov ebx, 100 ; Multiplicar por 100
	mul ebx
	mov ebx, 100000 ; Total de bytes
	mov edx, 0 ; Limpiar edx
	div ebx ; Obtener porcentaje
	mov porcentaje, eax ; Guardar porcentaje
	
	mov esi, OFFSET bufferASCII ; Cargar buffer
	call convertirDecimal ; Convertir a texto
	mov edx, OFFSET bufferASCII ; Cargar cadena
	call WriteString ; Mostrar cadena
	call Crlf ; Salto de linea

	mov eax, bytesDesc ; Cargar descargados
	mov ebx, 1024 ; Tamaño del grupo
	mov edx, 0 ; Limpiar edx
	div ebx ; Dividir
	mov gruposComp, eax ; Guardar grupos
	mov residuo, edx ; Guardar sobrante

	mov esi, OFFSET bufferASCII ; Cargar buffer
	call convertirDecimal ; Convertir a texto
	mov edx, OFFSET bufferASCII ; Cargar cadena
	call WriteString
	call Crlf

	mov eax, residuo ; Cargar residuo
	mov esi, OFFSET bufferASCII ; Cargar buffer
	call convertirDecimal ; Convertir a texto
	mov edx, OFFSET bufferASCII ; Cargar cadena
	call WriteString
	call Crlf

	exit

main ENDP

convertirDecimal PROC
	mov ecx, 0 ; Inicializar contador
	mov ebx, 10 ; Divisor

convertirLoop:
	mov edx, 0 ; Limpiar edx
	div ebx ; Dividir entre 10
	push edx ; Guardar digito
	inc ecx ; Aumentar contador

	cmp eax, 0 ; Revisar resultado
	jne convertirLoop ; Repetir si no es 0

cadenaLoop:
	pop edx ; Recuperar digito
	add dl, '0' ; Convertir a ascii
	mov [esi], dl ; Guardar caracter
	inc esi ; Siguiente posicion
	loop cadenaLoop ; Repetir ciclo

	mov byte ptr [esi], 0 ; Fin de cadena

	ret

convertirDecimal ENDP

END main