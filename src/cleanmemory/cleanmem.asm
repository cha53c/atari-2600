	processor 6502
	seg code
	org $F000		; define code origin

start:
	sei				; disable interrupt
	cld				; disable decimal mode
	ldx #$FF		; load x with $FF
	txs				; transfer x to stack register

; Clear Zero Page region ($00 - $FF)
; the entire TIA registers and RAM

	lda #0
	ldx #$FF

memLoop:
	sta $0,x		; store zero at address $0 + x
	dex				; x--
	bne memLoop		; loop if z-flag not set BUG this will not clear byte $00 

; Fill ROM size to exactly 4kb
	org $FFFC		; atari look here after reset
	.word start		; set to start of program
	.word start		; interrupt vector at $FFFE (unused in VCS)

