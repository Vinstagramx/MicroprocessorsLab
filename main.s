	#include <xc.inc>

psect	code, abs
	
main:
	org	0x0
	goto	start

	org	0x100		    ; Main code starts here at address 0x100
start:
;	movlw 	0x0
;	movwf	TRISC, A	    ; Port C all outputs
	movlw	0x1		    ; move 1 into W register
	movwf	TRISD, A	    ; Set TRISD to all 1s - input
	movlb	0x0f		    ; RDPU not in access RAM
	bsf	RDPU		    ; Turn on Port D pull-ups (weak pull-up)
	bra 	test
loop:
;	movff 	0x06, PORTC
	movff	0x06, PORTD
	incf 	0x06, W, A
test:
	movwf	0x06, A		    ; Test for end of loop condition
	movlw 	0x63
	cpfsgt 	0x06, A
	bra 	loop		    ; Not yet finished goto start of loop again
	goto 	0x0		    ; Re-run program from start

	end	main
