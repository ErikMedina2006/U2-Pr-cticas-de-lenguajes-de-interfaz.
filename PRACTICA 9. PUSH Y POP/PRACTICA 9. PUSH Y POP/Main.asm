;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 9. PUSH Y POP
;Descripción: En este programa vemos como funciona el ingreso de datos en una pila el retiro y el copiado de estos
;Y como se comporta asi como el retiro de valores
INCLUDE Irvine32.inc

.data
.code
main PROC

    mov eax, 40 
    push eax ;Guarda el valor de EAX en la pila

    nop

    mov eax, 0 
    pop ebx ;Saca el valor de del tope de la pila y lo guarda en EBX

    nop

    mov eax, 10 
    push eax    ;Se guarda el valor de EAX en la cima de la pila

    mov eax, 20 
    push eax    ;Se guarda el valor de EAX en la cima de la pila

    mov eax, 30 
    push eax    ;Se guarda el valor de EAX en la cima de la pila

    nop
    ;Saca cada valor de la cima y lo guarda en una direccion distinta
    pop eax 
    pop ebx 
    pop ecx 

    nop

    mov eax, 100 
    mov ebx, 200 
    ;Aqui se invierten los valores pasa de EAX tome el valor de EBX y EBX toma el valor de EAX
    push eax    ;Guarda el valor que contiene EAX en la pila
    push ebx    ;Guarda el valor que contiene EBX en la pila

    pop ebx     ;Saca el valor de la cima de la pila y lo guarda guarda en EBX
    pop eax     ;Saca el valor de la cima de la pila y lo guarda guarda en EAX

    nop

    mov eax, 50 
    mov ebx, 100 

    call aumentarDiez   ;Salta al procedimiento aumentarDiez

    nop

    exit
main ENDP
aumentarDiez PROC

    add eax, 10 ;Toma el valor de eax y le suma 10

    ret ;Regresa a la instruccion antes de la llamada

aumentarDiez ENDP
END main