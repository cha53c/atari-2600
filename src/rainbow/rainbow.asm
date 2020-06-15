  processor 6502

  include "vcs.h"
  include "marco.h"

  seg code
  org $F000

Start:
  CLEAN_START

;; Start a new frame by turning on VBLANK and VSYNC
NextFrame:
  lda #2
  sta VBLANK    ; turn on VBLANK
  sta VSYNC     ; turn on VSYNC


;; Generate 3 lines of VSYNC
  sta WSYNC
  sta WSYNC
  sta WSYNC
 
  lds #0
  sta VSYNC     ; turn off VSYNC

;; draw 37 recommended scan lines

  ldx #37 
LoopVBlank:
  sta WSYNC
  dex           ; x--
  bne LoopVBlank ; loop while x != 0 

  lda #0
  sta VBLANK    ;turn off VBLANK

  
