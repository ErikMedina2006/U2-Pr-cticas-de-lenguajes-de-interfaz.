;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 12. DESPLAZAMIENTO Y ROTACION
;Descripción: Lo que se hace en esta practica es tener un valor binario en un registro como AL y lo que 
;hacemos es rotar su valor como puede ser a un lado o al otro y tambien vemos la rotacion con signos  o con constantes
INCLUDE Irvine32.inc

.data

.code

main PROC
    mov eax, 0 
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    ; 1 - SHL: desplazar a la izquierda

    mov al, 10000000b ; Valor inicial
    shl al, 1 ; Desplazar 1 bit

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    ; 2 - SHR: desplazar a la derecha

    mov al, 00001101b ; Valor inicial
    shr al, 1 ; Desplazar 1 bit

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    ; 3 - SAR: desplazamiento con signo

    mov al, -9 ; Guardar -9
    sar al, 1 ; Desplazar con signo

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    ; 4 - DESPLAZAMIENTO CON CONSTANTE

    mov al, 00001111b ; Valor inicial
    shl al, 2 ; Desplazar 2 bits

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    ; 5 - DESPLAZAMIENTO CON CL

    mov al, 00010100b ; Valor inicial
    mov cl, 2 ; Cantidad de posiciones
    shr al, cl ; Desplazar bits

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    ; 6 - ROR, ROL, RCL, RCR

    ; ROR

    mov al, 10000001b ; Valor inicial
    ror al, 1 ; Rotar derecha

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    ; ROL

    mov al, 10000001b ; Valor inicial
    rol al, 1 ; Rotar izquierda

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    ; RCL

    clc ; Limpiar CF
    mov al, 10000001b ; Valor inicial
    rcl al, 1 ; Rotar con CF

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    ; RCR

    clc ; Limpiar CF
    mov al, 10000001b ; Valor inicial
    rcr al, 1 ; Rotar con CF

    call DumpRegs ; Mostrar registros
    call WriteBin ; Mostrar binario

    exit

main ENDP

END main