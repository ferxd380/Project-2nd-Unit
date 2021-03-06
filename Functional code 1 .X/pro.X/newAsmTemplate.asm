;ETIQUETAS	   DIRECTIVAS Y NEMONICOS	   VARIABLES	    COMENTARIOS
;-------------------------OBLIGATORIO PARA EL PIC ------------------------------
		   __CONFIG _CP_OFF& _WDT_OFF& _PWRTE_ON&_XT_OSC;para el grabador
		    LIST	p=16F84A;	    designar el modelo del pic
		    INCLUDE<P16F84A.INC>;	    definir a que pic manupulare
		    RADIX	HEX;		    definir el lenguaje a usar
;------------------------Declaracion de registros-------------------------------
PB		    EQU 0X06;			  asignar al puerto un su nombre
PA		    EQU 0X05
TRISA		    EQU 0X85
TRISB		    EQU 0X86
ESTADO		    EQU 0X03;			  se agrega el bit de estado
RET		    EQU	0x0c;			  se agregan tres variables para 
RET2		    EQU	0x0d;			  poder crear un retardo y ocupar
RET3		    EQU	0x0e;			  cantidaes de tiempo.		    		    
;---------------------------Cabecera de inicio------- --------------------------
		    ORG	0X00
		    GOTO INICIO
		    ORG	0X06
;---------------------------Cuerpo del programa---------------------------------
INICIO		  bsf	  ESTADO,5
		  clrf    TRISB
		  movlw   b'11111'
		  movwf   TRISA 
		  bcf	  ESTADO,5
		  
REINICIO	  clrf	  PB
		  call	  LEER
		  
REINICIO2	  clrf	    PB
		  call	    LEER2
		  
APAGADO
		  btfsc	    PA,2
		  goto	    ENCENDER
		  movlw	    b'0000001'
		  movwf	    PB
		  call	    RETARDO
		  clrf	    PB
		  goto	    LEER
		  
ENCENDER	
		  movlw	    b'0000010'
		  movwf	    PB
		  call	    RETARDO
		  clrf	    PB
		  btfsc	    PA,0
		  goto	    LEER2
;-------------------------------------------------------------------------------
RETARDO;					la funcion retardo crea acciones 
;						de relleno para ocupar un tiempo 
;						determinado.
		    movlw   0x01 
		    movwf   RET
LAZO2
		    movlw   0x03
		    movwf   RET2
LAZO1
		    movlw   0x03
		    movwf   RET3
LAZO
		    decfsz  RET3,1
		    goto    LAZO
		    decfsz  RET2,1
		    goto    LAZO1
		    decfsz  RET,1
		    goto    LAZO2
		    RETURN
;						   las funciones leer determinan 
;						   el estado del puerto RA0 y 
;						   relizar el proceso determida 
;						   para el estado alto y el estado bajo.
LEER		    
		    clrf    PB
		    btfsc   PA,0
		    goto    ENCENDER
		    goto    LEER
		    RETURN		    
LEER2		    
		    clrf    PB
		    btfsc   PA,0
		    goto    LEER2
		    goto    APAGADO
		    RETURN
		    END 


