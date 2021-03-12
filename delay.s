global	delay, delay2, delay3, delaySetup

; Delay Module. Delay counters are stored in 0x17, 0x18 and 0x19 of access bank (can be changed) - out of the way of other key locations
; Delay setup called with delaySetup --> counters are set to 0xFF
    
delay:				    ; Outermost delay loop
	call	delay2		    ; Call middle delay loop
        decfsz  0x17, A             ; Decrement counter at 0x10 (access)
	bra     delay               ; If not 0, loop back
	movlw   0xFF                ; Reset loop counter
	movwf   0x17          
	return                      ; Jump back to execution	
	
delay2:				    ; Middle delay loop
	call    delay3              ; Call innermost delay loop
        decfsz  0x18, A             ; Decrement counter at 0x20 (access)
	bra     delay2              ; If not 0, loop back
	movlw   0xFF                ; Reset loop counter
	movwf   0x18          
	return                      ; Jump back to execution    
	
delay3:				    ; Innermost delay loop
        decfsz  0x19, A             ; Decrement counter at 0x30 (access)
	bra     delay3              ; If not 0, loop back
	movlw   0xFF                ; Reset loop counter
	movwf   0x19          
	return                      ; Jump back to execution  

delaySetup:
	movlw   0xFF                ; Setting up delay loops
	movwf   0x17, A             ; Moving 0xFF to all delay counters
	movlw   0xFF                
	movwf   0x18, A                
	movlw   0xFF		    
	movwf   0x19, A	


