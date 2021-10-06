#include "p16F628a.inc"    
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    

RES_VECT  CODE    0x0000           
    
    BCF PORTA,0		
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		
    CALL time
    BCF PORTA,1
    CALL time
  
    GOTO    START               

MAIN_PROG CODE                     

i EQU 0x20
j EQU 0x21
k EQU 0x30
m EQU 0x31

START
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0 
    CLRF TRISB
    CLRF TRISA
    BCF STATUS, RP0
    
    BCF PORTA,1
    BCF PORTA,0
    
INITLCD
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    
INICIO	 
    call Nombre
    call Tiempo_1
    nop
    nop
    call Datos_Materia
    call Tiempo_1
    nop
    nop
    call Mensaje
    call Tiempo_1
    GOTO INICIO
    
    
    
Nombre:
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x84	;LCD position ; 80 inicio columna 1, acaba en 8F, se puede guardar hasta BF
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'l'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'a'
    MOVWF PORTB
    CALL exec

    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC1		;LCD position ; C0 inicio columna 2, acaba en CF
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'V'
    MOVWF PORTB
    CALL exec 

    MOVLW 'i'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'd'
    MOVWF PORTB
    CALL exec 

    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'l'
    MOVWF PORTB
    CALL exec 

    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'm'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'h'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    
    return

Datos_Materia:
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x84	;LCD position ; 80 inicio columna 1
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'A'
    MOVWF PORTB
    CALL exec

    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW '7'
    MOVWF PORTB
    CALL exec
    
    MOVLW '0'
    MOVWF PORTB
    CALL exec
    
    MOVLW '0'
    MOVWF PORTB
    CALL exec
    BCF PORTA,0		
    CALL time
    
    MOVLW 0xC1		;LCD position ; C0 inicio columna 2
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec 

    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 't'
    MOVWF PORTB
    CALL exec 

    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec 

    MOVLW 'i'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'i'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'c'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    
    return

Mensaje:
        
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x84	;LCD position ; 80 inicio columna 1
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'B'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'u'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'e'
    MOVWF PORTB
    CALL exec

    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    

    
    BCF PORTA,0		
    CALL time
    
    MOVLW 0xC1		;LCD position ; C0 inicio columna 2
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec 

    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'c'
    MOVWF PORTB
    CALL exec 

    MOVLW 'h'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'e'
    MOVWF PORTB
    CALL exec 

    MOVLW 's'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    return

    
    

exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN

Tiempo_1: 
    nop
    nop
    nop
    nop
    nop
    movlw d'128' 
    movwf m
    
mloop:
    nop
    nop
    decfsz m,f
    goto mloop
    movlw d'245' 
    movwf i
    
iloop: 
    nop
    nop
    movlw d'187' 
    movwf j
    
jloop:
    movlw d'5' 
    movwf k
kloop:
    decfsz k,f
    goto kloop
    decfsz j,f
    goto jloop
    decfsz i,f
    goto iloop
    return 
    
    END