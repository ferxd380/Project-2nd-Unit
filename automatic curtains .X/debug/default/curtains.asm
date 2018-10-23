;ETIQUETAS DIRECTIVAS Y NEMONICOS  VARIABLES COMENTARIOS 
 __CONFIG _CP_OFF& _WDT_OFF& _PWRTE_ON&_XT_OSC	
		LIST			    p=16F84A 
		INCLUDE<P16F84A.INC>
		RADIX			    HEX	   
;--------------------------DECLARACION-------------------------
PA		EQU			    0X05  
TA		EQU			    0X05
PB		EQU			    0X06	
		
;--------------------------INICIO-------------------------------
		ORG			    0X00    
		goto			    INICIO  
		ORG			    0X05    
;--------------------------PROGRAMA-------------------------------




