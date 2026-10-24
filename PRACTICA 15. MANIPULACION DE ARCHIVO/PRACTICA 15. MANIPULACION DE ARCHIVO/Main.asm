;Materia: Lenguajes de Interfaz
;Alumno: Medina Pacheco Erik Vladimir
;Horario: 10 Am - 11 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 15. MANIPULACION DE ARCHIVO
;Descripción: En este prrograma hacemos la creacion modificacion cierre y validamos si se cumplen las funciones mencionadas si no puede tener valores invalidos
INCLUDE Irvine32.inc

 .data
    nombreArchivo BYTE "Inventario.txt", 0  ;Nombre del archivo que sera creado
    texto BYTE "125", 0 ;Longitud que se planea escribir en el archivo
    archivoHandle DWORD ?   ;Variable para almacenar el identificador

    ;Mensajes que seran impresos en consola
    mensajeExito BYTE "Archivo guardado correctamente.", 0
    mensajeError BYTE "No se pudo guardar el archivo.", 0
    
.code
main PROC
    ; 1. Crear archivo txt.
    mov edx, OFFSET nombreArchivo   ;Carga en direccion con el nombre del archivo
    call CreateOutputFile   ;Llamada para la creacion del archivo

    cmp eax, INVALID_HANDLE_VALUE   ;Compara el valor de EAX en caso que se de un error al momento de crear el archivo
    je error    ;Salto a la etiqueta en caso que sean iguales

    mov archivoHandle, eax  ;Si tuvo exito guarda el identificador del archivo en la variable archivoHandle

    ; 2. Escribir caracteres en archivo txt.
    mov eax, archivoHandle  ;Carga eb EAX el identificador del archivo
    call CloseFile  ;Cierra el archivo

    test eax, eax   ;Realiza una operacion logica de AND entre EAX y EAX sin alterar su valor y conocer el valor de ZF
    jz error    ;Si el valor de la ZF fue de 0 salta a la etiqueta error

    mov edx, OFFSET mensajeExito    ;Carga en EDX el mensaje de exito
    call WriteString    ;Imprime en consola el mensaje de mensajeEXito
    jmp fin ;Salto incondicional a fin

errorEscritura: ;Etiqueta en caso de error en la escritura
    mov eax, archivoHandle
    call CloseFile  ;CIerra el archivo

error:  ;Etiqueta en caso de error
    mov edx, OFFSET mensajeError
    call WriteString

fin:    ;Etiqueta del final del programa
    exit    ;Fin del programa
    
main ENDP

END main