;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 8. OPERACIONES ARITMETICAS
;Descripción: En estre programas vemos lo que son las sumas, restas, multiplicaciones y diviciones
INCLUDE Irvine32.inc

.data
.code

main PROC
    ;Se definen los valores en las direcciones corespondientes
    mov eax, 60
    mov ebx, 24
    ;Suma y resta
    add eax, ebx    ;Suma el valor de la direccion de EAX y EBX y lo guarda en EAX
    sub eax, 15     ;E resta 15 al valor de la direccion EAX
    nop

    mov eax, 12 
    mov al, 253 ;Toma el valor de 253 la direccion de AL

    add al, 4   ;Suma 4 al valor de AL
    nop

    
    mov eax, 0 
    mov al, 127 ;Se declara el valor maxino de AL

    add al, 1   ;Se suma 1 a AL que al sumarlo supera su limite activando OF
    nop
    
    ;Asgina los valores en las direcciones EAX y EBX
    mov eax, 25 
    mov ebx, 5 

    mul ebx ;Multiplica EAX * EBX
    nop

    mov eax, -7

    imul eax, eax, 3    ;Multiplica EAX * 3 y guarda el resultado en EAX

    nop

    mov eax, 94854 
    mov ebx, 94854 

    mul ebx ;Multiplica EAX * EBX
    nop
    ;Division
    mov eax, 130 
    mov edx, 0  ;Limpia el registro de EDX

    mov ebx, 13 
    div ebx     ;Divide EDX:EAX entre EBX
    nop

    mov eax, -130 
    cdq     ;Extiende el signo de EAX hacia EDX

    mov ebx, 13 
    idiv ebx    ;Divide el valor de EAX entre el valor negativo de EBX
    exit 
main ENDP

END main