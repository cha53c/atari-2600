  processor 6502

  include "vcs.h"
  include "macro.h"

  seg code
  org $f000		; defines the orignin of the ROM at $f000

START:
	CLEAN_START ; macro to safely clear the memory
; set background lumminosity to colour yellow

  lda #$1E		; load colour (NTSC yellow) 
  sta COLUBK 	; store colour background address $09
  jmp START     ; 

; fill ROM size to exactly 4k
  org $FFFC		; define origin of $FFFC
  .word START	; reset vector at $FFFC where program starts
  .word START   ; interrupt vector and $FFFE (unused)
