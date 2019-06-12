;;;;
; Asteroids VR
; Game for the VR peripheral:
; https://github.com/nickbild/vectron_vr
; of the Vectron 64 computer:
; https://github.com/nickbild/vectron_64
; Nick Bild - nick.bild@gmail.com
;
; Reserved memory:
; $0000 - LCD enable
; $0001 - Unused -- read it to disable any IC (except RAM).
; $0002 - Current LCD cursor position.
; $0003 - Flag to indicate if next scan code should be skipped.
; $0004 - TFT LCD DC
; $0005 - TFT LCD Clock AND SPI shift register clock
; $0006 - TFT LCD Clock only
; $0007 - TFT LCD #1 (left eye) CS
; $0008 - TFT LCD #2 (right eye) CS
; $0009 - SPI shift register load
; $000A - TFT LCD reset
;
; Active asteroid.
; $000B - Asteroid active flag
; $000C - Asteroid color
; $000D - Asteroid bottommost y coordinate
; $000E - Asteroid leftmost x coordinate, y
; $000F - Asteroid leftmost x coordinate, y+1
; $0010 - Asteroid leftmost x coordinate, y+2
; $0011 - Asteroid leftmost x coordinate, y+3
; $0012 - Asteroid leftmost x coordinate, y+4
; $0013 - Asteroid leftmost x coordinate, y+5
; $0014 - Asteroid leftmost x coordinate, y+6
; $0015 - Asteroid leftmost x coordinate, y+7
; $0016 - Asteroid leftmost x coordinate, y+8
; $0017 - Asteroid leftmost x coordinate, y+9
; $0018 - Asteroid leftmost x coordinate, y+10
; $0019 - Asteroid leftmost x coordinate, y+11
; $001A - Asteroid leftmost x coordinate, y+12
; $001B - Asteroid leftmost x coordinate, y+13
; $001C - Asteroid leftmost x coordinate, y+14
; $001D - Asteroid leftmost x coordinate, y+15
; $001E - Asteroid leftmost x coordinate, y+16
; $001F - Asteroid leftmost x coordinate, y+17
; $0020 - Asteroid leftmost x coordinate, y+18
;
; Asteroid 1.
; $0021 - Asteroid active flag
; $0022 - Asteroid color
; $0023 - Asteroid bottommost y coordinate
; $0024 - Asteroid leftmost x coordinate, y
; $0025 - Asteroid leftmost x coordinate, y+1
; $0026 - Asteroid leftmost x coordinate, y+2
; $0027 - Asteroid leftmost x coordinate, y+3
; $0028 - Asteroid leftmost x coordinate, y+4
; $0029 - Asteroid leftmost x coordinate, y+5
; $002A - Asteroid leftmost x coordinate, y+6
; $002B - Asteroid leftmost x coordinate, y+7
; $002C - Asteroid leftmost x coordinate, y+8
; $002D - Asteroid leftmost x coordinate, y+9
; $002E - Asteroid leftmost x coordinate, y+10
; $002F - Asteroid leftmost x coordinate, y+11
; $0030 - Asteroid leftmost x coordinate, y+12
; $0031 - Asteroid leftmost x coordinate, y+13
; $0032 - Asteroid leftmost x coordinate, y+14
; $0033 - Asteroid leftmost x coordinate, y+15
; $0034 - Asteroid leftmost x coordinate, y+16
; $0035 - Asteroid leftmost x coordinate, y+17
; $0036 - Asteroid leftmost x coordinate, y+18
;
; Asteroid 2 left.
; $0037 - Asteroid active flag
; $0038 - Asteroid color
; $0039 - Asteroid bottommost y coordinate
; $003A - Asteroid leftmost x coordinate, y
; $003B - Asteroid leftmost x coordinate, y+1
; $003C - Asteroid leftmost x coordinate, y+2
; $003D - Asteroid leftmost x coordinate, y+3
; $003E - Asteroid leftmost x coordinate, y+4
; $003F - Asteroid leftmost x coordinate, y+5
; $0040 - Asteroid leftmost x coordinate, y+6
; $0041 - Asteroid leftmost x coordinate, y+7
; $0042 - Asteroid leftmost x coordinate, y+8
; $0043 - Asteroid leftmost x coordinate, y+9
; $0044 - Asteroid leftmost x coordinate, y+10
; $0045 - Asteroid leftmost x coordinate, y+11
; $0046 - Asteroid leftmost x coordinate, y+12
; $0047 - Asteroid leftmost x coordinate, y+13
; $0048 - Asteroid leftmost x coordinate, y+14
; $0049 - Asteroid leftmost x coordinate, y+15
; $004A - Asteroid leftmost x coordinate, y+16
; $004B - Asteroid leftmost x coordinate, y+17
; $004C - Asteroid leftmost x coordinate, y+18
;
; Asteroid 3 left.
; $004D - Asteroid active flag
; $004E - Asteroid color
; $004F - Asteroid bottommost y coordinate
; $0050 - Asteroid leftmost x coordinate, y
; $0051 - Asteroid leftmost x coordinate, y+1
; $0052 - Asteroid leftmost x coordinate, y+2
; $0053 - Asteroid leftmost x coordinate, y+3
; $0054 - Asteroid leftmost x coordinate, y+4
; $0055 - Asteroid leftmost x coordinate, y+5
; $0056 - Asteroid leftmost x coordinate, y+6
; $0057 - Asteroid leftmost x coordinate, y+7
; $0058 - Asteroid leftmost x coordinate, y+8
; $0059 - Asteroid leftmost x coordinate, y+9
; $005A - Asteroid leftmost x coordinate, y+10
; $005B - Asteroid leftmost x coordinate, y+11
; $005C - Asteroid leftmost x coordinate, y+12
; $005D - Asteroid leftmost x coordinate, y+13
; $005E - Asteroid leftmost x coordinate, y+14
; $005F - Asteroid leftmost x coordinate, y+15
; $0060 - Asteroid leftmost x coordinate, y+16
; $0061 - Asteroid leftmost x coordinate, y+17
; $0062 - Asteroid leftmost x coordinate, y+18
;
; Asteroid 2 right.
; $0063 - Asteroid active flag
; $0064 - Asteroid color
; $0065 - Asteroid bottommost y coordinate
; $0066 - Asteroid leftmost x coordinate, y
; $0067 - Asteroid leftmost x coordinate, y+1
; $0068 - Asteroid leftmost x coordinate, y+2
; $0069 - Asteroid leftmost x coordinate, y+3
; $006A - Asteroid leftmost x coordinate, y+4
; $006B - Asteroid leftmost x coordinate, y+5
; $006C - Asteroid leftmost x coordinate, y+6
; $006D - Asteroid leftmost x coordinate, y+7
; $006E - Asteroid leftmost x coordinate, y+8
; $006F - Asteroid leftmost x coordinate, y+9
; $0070 - Asteroid leftmost x coordinate, y+10
; $0071 - Asteroid leftmost x coordinate, y+11
; $0072 - Asteroid leftmost x coordinate, y+12
; $0073 - Asteroid leftmost x coordinate, y+13
; $0074 - Asteroid leftmost x coordinate, y+14
; $0075 - Asteroid leftmost x coordinate, y+15
; $0076 - Asteroid leftmost x coordinate, y+16
; $0077 - Asteroid leftmost x coordinate, y+17
; $0078 - Asteroid leftmost x coordinate, y+18
;
; Asteroid 3 right.
; $0079 - Asteroid active flag
; $007A - Asteroid color
; $007B - Asteroid bottommost y coordinate
; $007C - Asteroid leftmost x coordinate, y
; $007D - Asteroid leftmost x coordinate, y+1
; $007E - Asteroid leftmost x coordinate, y+2
; $007F - Asteroid leftmost x coordinate, y+3
; $0080 - Asteroid leftmost x coordinate, y+4
; $0081 - Asteroid leftmost x coordinate, y+5
; $0082 - Asteroid leftmost x coordinate, y+6
; $0083 - Asteroid leftmost x coordinate, y+7
; $0084 - Asteroid leftmost x coordinate, y+8
; $0085 - Asteroid leftmost x coordinate, y+9
; $0086 - Asteroid leftmost x coordinate, y+10
; $0087 - Asteroid leftmost x coordinate, y+11
; $0088 - Asteroid leftmost x coordinate, y+12
; $0089 - Asteroid leftmost x coordinate, y+13
; $008A - Asteroid leftmost x coordinate, y+14
; $008B - Asteroid leftmost x coordinate, y+15
; $008C - Asteroid leftmost x coordinate, y+16
; $008D - Asteroid leftmost x coordinate, y+17
; $008E - Asteroid leftmost x coordinate, y+18
;
; $0100-$01FF - 6502 stack
; $7FBE-$7FBF - Temporary location for LCD data manipulation.
; $7FC0-$7FFF - Data to write to LCD.
;               Each character (16 x 2 lines) is represented by
;               2 consecutive bytes (4-bit mode).
;               Most sig. 4 bits are for LCD data.
;               Least sig. 4 bits - only bit 3 used (tied to RS pin).
;
; $FFF8 - Clock keyboard shift register and enable line buffer.
; $FFF9 - Reset binary counter (counts bits received from PS/2 keyboard packets).
;
; $FFFA - NMI IRQ Vector
; $FFFB - NMI IRQ Vector
; $FFFC - Reset Vector - Stores start address of this ROM.
; $FFFD - Reset Vector
; $FFFE - IRQ Vector - Keyboard ISR address.
; $FFFF - IRQ Vector
;;;;

		processor 6502

; Named variables in RAM.
		ORG $0002

CursorPosition
		.byte #$00
SkipNextScanCodeFlag
		.byte #$00
TftDC
    .byte #$00
TftClkBoth
    .byte #$00
TftClockLCD
    .byte #$00
TftCs1
    .byte #$00
TftCs2
    .byte #$00
SpiSrLd
    .byte #$00
TftReset
    .byte #$00

; Start at beginning of ROM.
StartExe	ORG $8000
		sei

		jsr InitLcd
		jsr ZeroLCDRam
		jsr ResetKeyboardCounter

		; Initialize LCD cursor position to 0.
		lda #$00
		sta CursorPosition

		; Do not skip the first scan code.
		lda #$00
		sta SkipNextScanCodeFlag

    jsr InitTftLcd

		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		; Draw common background.
		jsr DrawBackground
		jsr DrawCrosshairs
		; Draw separate (3D) BG for each screen.
		lda #$01
		sta TftCs2
		sta $0001
		jsr DrawBackgroundLeft
		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001
		jsr DrawBackgroundRight

		lda #$00
		sta TftCs1

		; Initialize asteroid 1.
		lda #$FF
		sta $22

		lda #$64
		sta $23

		lda #$61
		sta $24
		lda #$62
		sta $25
		lda #$64
		sta $26
		lda #$65
		sta $27
		lda #$66
		sta $28
		lda #$67
		sta $29
		lda #$68
		sta $2A
		lda #$69
		sta $2B
		lda #$6A
		sta $2C
		lda #$6A
		sta $2D
		lda #$6A
		sta $2E
		lda #$69
		sta $2F
		lda #$68
		sta $30
		lda #$67
		sta $31
		lda #$66
		sta $32
		lda #$65
		sta $33
		lda #$64
		sta $34
		lda #$63
		sta $35
		lda #$62
		sta $36

		jsr LoadAsteroid1
		jsr DrawAsteroid

		; Disable screen 2.
		lda #$01
		sta TftCs2
		sta $0001

		; Initialize asteroid 2 left.
		lda #$FF
		sta $38

		lda #$98
		sta $39

		lda #$B1
		sta $3A
		lda #$B2
		sta $3B
		lda #$B4
		sta $3C
		lda #$B5
		sta $3D
		lda #$B6
		sta $3E
		lda #$B7
		sta $3F
		lda #$B8
		sta $40
		lda #$B9
		sta $41
		lda #$BA
		sta $42
		lda #$BA
		sta $43
		lda #$BA
		sta $44
		lda #$B9
		sta $45
		lda #$B8
		sta $46
		lda #$B7
		sta $47
		lda #$B6
		sta $48
		lda #$B5
		sta $49
		lda #$B4
		sta $4A
		lda #$B3
		sta $4B
		lda #$B2
		sta $4C

		jsr LoadAsteroid2Left
		jsr DrawAsteroid

		; Initialize asteroid 3 left.
		lda #$FF
		sta $4E

		lda #$C0
		sta $4F

		lda #$31
		sta $50
		lda #$32
		sta $51
		lda #$34
		sta $52
		lda #$35
		sta $53
		lda #$36
		sta $54
		lda #$37
		sta $55
		lda #$38
		sta $56
		lda #$39
		sta $57
		lda #$3A
		sta $58
		lda #$3A
		sta $59
		lda #$3A
		sta $5A
		lda #$39
		sta $5B
		lda #$38
		sta $5C
		lda #$37
		sta $5D
		lda #$36
		sta $5E
		lda #$35
		sta $5F
		lda #$34
		sta $60
		lda #$33
		sta $61
		lda #$32
		sta $62

		jsr LoadAsteroid3Left
		jsr DrawAsteroid

		; Enable only screen 2.
		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001

; Initialize asteroid 2 right.
		lda #$FF
		sta $64

		lda #$98
		sta $65

		lda #$B3
		sta $66
		lda #$B4
		sta $67
		lda #$B6
		sta $68
		lda #$B7
		sta $69
		lda #$B8
		sta $6A
		lda #$B9
		sta $6B
		lda #$BA
		sta $6C
		lda #$BB
		sta $6D
		lda #$BC
		sta $6E
		lda #$BC
		sta $6F
		lda #$BC
		sta $70
		lda #$BB
		sta $71
		lda #$BA
		sta $72
		lda #$B9
		sta $73
		lda #$B8
		sta $74
		lda #$B7
		sta $75
		lda #$B6
		sta $76
		lda #$B5
		sta $77
		lda #$B4
		sta $78

		jsr LoadAsteroid2Right
		jsr DrawAsteroid

		; Initialize asteroid 3 right.
		lda #$FF
		sta $7A

		lda #$C0
		sta $7B

		lda #$33
		sta $7C
		lda #$34
		sta $7D
		lda #$36
		sta $7E
		lda #$37
		sta $7F
		lda #$38
		sta $80
		lda #$39
		sta $81
		lda #$3A
		sta $82
		lda #$3B
		sta $83
		lda #$3C
		sta $84
		lda #$3C
		sta $85
		lda #$3C
		sta $86
		lda #$3B
		sta $87
		lda #$3A
		sta $88
		lda #$39
		sta $89
		lda #$38
		sta $8A
		lda #$37
		sta $8B
		lda #$36
		sta $8C
		lda #$35
		sta $8D
		lda #$34
		sta $8E

		jsr LoadAsteroid3Right
		jsr DrawAsteroid

		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		cli

MainLoop
		jmp MainLoop

;;;
; Long Delay
;;;

Delay		ldx #$FF
DelayLoop1	ldy #$FF
DelayLoop2	dey
		bne DelayLoop2
		dex
		bne DelayLoop1
		rts

;;;
; Short Delay
;;;

DelayShort	ldx #$80
DelayShortLoop1	dex
		bne DelayShortLoop1
		rts

;;;
; Send high pulse to LCD enable pin.
;;;

LcdCePulse	sta $01
		jsr DelayShort
		sta $00
		jsr DelayShort
		sta $01
		jsr DelayShort
		rts

;;;
; Character LCD initialization sequence.
;;;

InitLcd		jsr Delay

		lda #$30			; 00110000 - data 0011, RS 0
		jsr LcdCePulse
		jsr Delay
		lda #$30
		jsr LcdCePulse
		jsr Delay
		lda #$30
		jsr LcdCePulse
		lda #$20
		jsr LcdCePulse
		jsr DelayShort

; Set 8 bit, 2 line, 5x8.
		lda #$20
		jsr LcdCePulse
		lda #$80
		jsr LcdCePulse

; Display on.
		lda #$00
		jsr LcdCePulse
		lda #$C0
		jsr LcdCePulse

; Clear display.
		lda #$00
		jsr LcdCePulse
		lda #$10
		jsr LcdCePulse
		jsr Delay

; Entry mode.
		lda #$00
		jsr LcdCePulse
		lda #$60
		jsr LcdCePulse

		rts

;;;
; Write LCD-reserved RAM addresses to LCD.
;;;

WriteLCD	lda #$80		; Line 1 : 1000 (line1) 0000 (RS 0)
 		jsr LcdCePulse
		lda #$00		; Position 0 : 0000 (position 0) 0000 (RS 0)
		jsr LcdCePulse

		ldy #$00
Line1Loop	lda $7FC0,y
		jsr LcdCePulse
		iny
		cpy #$20
		bcc Line1Loop

		lda #$C0		; Line 2 : 1100 (line2) 0000 (RS 0)
 		jsr LcdCePulse
		lda #$00		; Position 0 : 0000 (position 0) 0000 (RS 0)
		jsr LcdCePulse

		ldy #$00
Line2Loop	lda $7FE0,y
		jsr LcdCePulse
		iny
		cpy #$20
		bcc Line2Loop

		rts

;;;
; Zero out LCD reserved RAM (set all positions to space character).
;;;

ZeroLCDRam	ldx #$00
ZeroLoop	lda #$28
		sta $7FC0,x
		inx
		lda #$08
		sta $7FC0,x
		inx
		cpx #$40
		bcc ZeroLoop

		rts

;;;
; Reset binary counter tracking receipt of complete packets from keyboard.
;;;

ResetKeyboardCounter
		lda $0001
		lda $FFF9
		lda $0001

		rts

;;;
; Read in all of the initialization data from the keyboard and discard it.
;;;

SkipKeyboardInit
		ldy #$00
KBInitLoop	jsr ResetKeyboardCounter
		jsr DelayShort
		iny
		cpy #$20
		bcc KBInitLoop

		rts

;;;
; Keyboard Interrupt Service Routine.
;;;

KbIsr
		pha
		.byte #$DA ; phx - mnemonic unknown to DASM.
		.byte #$5A ; phy

		; Is this scan code flagged to be skipped?
		ldx SkipNextScanCodeFlag
		cpx #$01
		bne ContinueKbIsr
		jmp SkipScanCodeAndResetSkip
ContinueKbIsr

		; Display shift register contents on output pins,
		; and enable line buffer.
		; Read shift register contents into accumulator.
		lda $FFF8

		; Skip key up scan codes.
		; Remeber to skip the next scan code after them.
		cmp #$F0
		bne DoNotSkipScanCode
		ldx #$01
		stx SkipNextScanCodeFlag
		jmp SkipScanCode

DoNotSkipScanCode

		; Convert scan code into LCD code.
		sbc #$14
		tax
		lda ScanCodeLookup,x

		cmp #$41 ; A
		beq IsLeft
		jmp NotLeft

IsLeft
		; Asteroid 1.
		inc $24
		inc $25
		inc $26
		inc $27
		inc $28
		inc $29
		inc $2A
		inc $2B
		inc $2C
		inc $2D
		inc $2E
		inc $2F
		inc $30
		inc $31
		inc $32
		inc $33
		inc $34
		inc $35
		inc $36

		; Asteroid 2 left.
		inc $3A
		inc $3B
		inc $3C
		inc $3D
		inc $3E
		inc $3F
		inc $40
		inc $41
		inc $42
		inc $43
		inc $44
		inc $45
		inc $46
		inc $47
		inc $48
		inc $49
		inc $4A
		inc $4B
		inc $4C

		; Asteroid 3 left.
		inc $50
		inc $51
		inc $52
		inc $53
		inc $54
		inc $55
		inc $56
		inc $57
		inc $58
		inc $59
		inc $5A
		inc $5B
		inc $5C
		inc $5D
		inc $5E
		inc $5F
		inc $60
		inc $61
		inc $62

		; Asteroid 2 right.
		inc $66
		inc $67
		inc $68
		inc $69
		inc $6A
		inc $6B
		inc $6C
		inc $6D
		inc $6E
		inc $6F
		inc $70
		inc $71
		inc $72
		inc $73
		inc $74
		inc $75
		inc $76
		inc $77
		inc $78

		; Asteroid 3 right.
		inc $7C
		inc $7D
		inc $7E
		inc $7F
		inc $80
		inc $81
		inc $82
		inc $83
		inc $84
		inc $85
		inc $86
		inc $87
		inc $88
		inc $89
		inc $8A
		inc $8B
		inc $8C
		inc $8D
		inc $8E

		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		jsr LoadAsteroid1
		jsr DrawAsteroid

		; Disable right screen.
		lda #$01
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Left
		jsr DrawAsteroid

		jsr LoadAsteroid3Left
		jsr DrawAsteroid

		; Enable only right screen.
		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Right
		jsr DrawAsteroid

		jsr LoadAsteroid3Right
		jsr DrawAsteroid

		jmp EndKbInput

NotLeft
		cmp #$53 ; S
		beq IsRight
		jmp NotRight

IsRight

		; Asteroid 1.
		dec $24
		dec $25
		dec $26
		dec $27
		dec $28
		dec $29
		dec $2A
		dec $2B
		dec $2C
		dec $2D
		dec $2E
		dec $2F
		dec $30
		dec $31
		dec $32
		dec $33
		dec $34
		dec $35
		dec $36

		; Asteroid 2 left.
		dec $3A
		dec $3B
		dec $3C
		dec $3D
		dec $3E
		dec $3F
		dec $40
		dec $41
		dec $42
		dec $43
		dec $44
		dec $45
		dec $46
		dec $47
		dec $48
		dec $49
		dec $4A
		dec $4B
		dec $4C

		; Asteroid 3 left.
		dec $50
		dec $51
		dec $52
		dec $53
		dec $54
		dec $55
		dec $56
		dec $57
		dec $58
		dec $59
		dec $5A
		dec $5B
		dec $5C
		dec $5D
		dec $5E
		dec $5F
		dec $60
		dec $61
		dec $62

		; Asteroid 2 right.
		dec $66
		dec $67
		dec $68
		dec $69
		dec $6A
		dec $6B
		dec $6C
		dec $6D
		dec $6E
		dec $6F
		dec $70
		dec $71
		dec $72
		dec $73
		dec $74
		dec $75
		dec $76
		dec $77
		dec $78

		; Asteroid 3 right.
		dec $7C
		dec $7D
		dec $7E
		dec $7F
		dec $80
		dec $81
		dec $82
		dec $83
		dec $84
		dec $85
		dec $86
		dec $87
		dec $88
		dec $89
		dec $8A
		dec $8B
		dec $8C
		dec $8D
		dec $8E

		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		jsr LoadAsteroid1
		jsr DrawAsteroid

		; Disable right screen.
		lda #$01
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Left
		jsr DrawAsteroid

		jsr LoadAsteroid3Left
		jsr DrawAsteroid

		; Enable only right screen.
		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Right
		jsr DrawAsteroid

		jsr LoadAsteroid3Right
		jsr DrawAsteroid

		jmp EndKbInput

NotRight
		cmp #$51 ; Q
		bne NotUp

		inc $23
		inc $39
		inc $4F
		inc $65
		inc $7B

		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		jsr LoadAsteroid1
		jsr DrawAsteroid

		; Disable right screen.
		lda #$01
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Left
		jsr DrawAsteroid

		jsr LoadAsteroid3Left
		jsr DrawAsteroid

		; Enable only right screen.
		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Right
		jsr DrawAsteroid

		jsr LoadAsteroid3Right
		jsr DrawAsteroid

		jmp EndKbInput

NotUp
		cmp #$5A ; Z
		bne NotDown

		dec $23
		dec $39
		dec $4F
		dec $65
		dec $7B

		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		jsr LoadAsteroid1
		jsr DrawAsteroid

		; Disable right screen.
		lda #$01
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Left
		jsr DrawAsteroid

		jsr LoadAsteroid3Left
		jsr DrawAsteroid

		; Enable only right screen.
		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Right
		jsr DrawAsteroid

		jsr LoadAsteroid3Right
		jsr DrawAsteroid

		jmp EndKbInput

NotDown
		cmp #$4C ; L
		beq IsL
		jmp NotL
IsL

		lda $2C
		cmp #$77
		bcc NoCollision1

		sbc #$1C
		cmp #$77
		bcs NoCollision1

		lda $23
		cmp #$98
		bcs NoCollision1

		adc #$12
		cmp #$98
		bcc NoCollision1

		; Astroid/crosshairs collision.
		lda #$88
		sta $22

		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		jsr LoadAsteroid1
		jsr DrawAsteroid

		; Make asteroid disappear.
		jsr Delay
		jsr Delay
		jsr Delay
		lda #$00
		sta $22
		jsr LoadAsteroid1
		jsr DrawAsteroid

NoCollision1

		lda $42
		cmp #$77
		bcc NoCollision2

		sbc #$1C
		cmp #$77
		bcs NoCollision2

		lda $39
		cmp #$98
		bcs NoCollision2

		adc #$12
		cmp #$98
		bcc NoCollision2

		; Astroid/crosshairs collision.
		lda #$88
		sta $38
		sta $64

		; Enable left screen.
		lda #$00
		sta TftCs1
		sta $0001
		; Disable right screen.
		lda #$01
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Left
		jsr DrawAsteroid

		; Enable only right screen.
		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Right
		jsr DrawAsteroid

		; Make asteroid disappear.
		jsr Delay
		jsr Delay
		jsr Delay
		lda #$00
		sta $38
		sta $64
		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001
		jsr LoadAsteroid2Left
		jsr DrawAsteroid
		jsr LoadAsteroid2Right
		jsr DrawAsteroid

NoCollision2

		lda $58
		cmp #$77
		bcc NoCollision3

		sbc #$1C
		cmp #$77
		bcs NoCollision3

		lda $4F
		cmp #$98
		bcs NoCollision3

		adc #$12
		cmp #$98
		bcc NoCollision3

		; Astroid/crosshairs collision.
		lda #$88
		sta $4E
		sta $7A

		; Enable left screen.
		lda #$00
		sta TftCs1
		sta $0001
		; Disable right screen.
		lda #$01
		sta TftCs2
		sta $0001

		jsr LoadAsteroid3Left
		jsr DrawAsteroid

		; Enable only right screen.
		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001

		jsr LoadAsteroid3Right
		jsr DrawAsteroid

		; Make asteroid disappear.
		jsr Delay
		jsr Delay
		jsr Delay
		lda #$00
		sta $4E
		sta $7A
		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001
		jsr LoadAsteroid3Left
		jsr DrawAsteroid
		jsr LoadAsteroid3Right
		jsr DrawAsteroid

NoCollision3

NotL
		; TEMPORARY
		cmp #$4B ; K
		bne NotK

		lda #$FF
		sta $22
		sta $38
		sta $4E
		sta $64
		sta $7A

		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		jsr LoadAsteroid1
		jsr DrawAsteroid

		lda #$00
		sta TftCs1
		sta $0001
		lda #$01
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Left
		jsr DrawAsteroid
		jsr LoadAsteroid3Left
		jsr DrawAsteroid

		lda #$01
		sta TftCs1
		sta $0001
		lda #$00
		sta TftCs2
		sta $0001

		jsr LoadAsteroid2Right
		jsr DrawAsteroid
		jsr LoadAsteroid3Right
		jsr DrawAsteroid

		jmp EndKbInput
NotK

EndKbInput

		; Enable both screens.
		lda #$00
		sta TftCs1
		sta $0001
		sta TftCs2
		sta $0001

		jsr DrawCrosshairs

SkipScanCodeAndResetSkip
		; Do not skip the next scan code.
		ldx #$00
		stx SkipNextScanCodeFlag

		; Finished ISR, reset binary counter.
SkipScanCode
		lda $FFF9
		lda $0001

		.byte #$7A ; ply
		.byte #$FA ; plx
		pla

		rti

; Initialize the TFT LCDs.
InitTftLcd
    ; DC high.
    lda #$01
    sta TftDC

    ; Reset screens.
    sta TftReset
    jsr Delay
    sta $0001
    jsr Delay

    ; Enable both screens.
    lda #$00
    sta TftCs1
    sta $0001
    sta TftCs2
    sta $0001

    ; SW Reset.
    lda #$01
    jsr WriteCommandLcd
    jsr Delay

    ; 0xEF, 3, 0x03, 0x80, 0x02,

    ; writeCommand(0xEF, cs);
    lda #$EF
    jsr WriteCommandLcd

    ; writeData(0x03, cs);
    lda #$03
    jsr WriteDataLcd

    ; writeData(0x80, cs);
    lda #$80
    jsr WriteDataLcd

    ; writeData(0x02, cs);
    lda #$02
    jsr WriteDataLcd

    ; 0xCF, 3, 0x00, 0xC1, 0x30,

    ; writeCommand(0xCF, cs);
    lda #$CF
    jsr WriteCommandLcd

    ; writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ; writeData(0xC1, cs);
    lda #$C1
    jsr WriteDataLcd

    ; writeData(0x30, cs);
    lda #$30
    jsr WriteDataLcd

    ; 0xED, 4, 0x64, 0x03, 0x12, 0x81,

    ; writeCommand(0xED, cs);
    lda #$ED
    jsr WriteCommandLcd

    ; writeData(0x64, cs);
    lda #$64
    jsr WriteDataLcd

    ; writeData(0x03, cs);
    lda #$03
    jsr WriteDataLcd

    ; writeData(0x12, cs);
    lda #$12
    jsr WriteDataLcd

    ; writeData(0x81, cs);
    lda #$81
    jsr WriteDataLcd

    ; 0xE8, 3, 0x85, 0x00, 0x78,

    ;writeCommand(0xE8, cs);
    lda #$E8
    jsr WriteCommandLcd

    ;writeData(0x85, cs);
    lda #$85
    jsr WriteDataLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ;writeData(0x78, cs);
    lda #$78
    jsr WriteDataLcd

    ; 0xCB, 5, 0x39, 0x2C, 0x00, 0x34, 0x02,

    ;writeCommand(0xCB, cs);
    lda #$CB
    jsr WriteCommandLcd

    ;writeData(0x39, cs);
    lda #$39
    jsr WriteDataLcd

    ;writeData(0x2C, cs);
    lda #$2C
    jsr WriteDataLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ;writeData(0x34, cs);
    lda #$34
    jsr WriteDataLcd

    ;writeData(0x02, cs);
    lda #$02
    jsr WriteDataLcd

    ; 0xF7, 1, 0x20,

    ;writeCommand(0xF7, cs);
    lda #$F7
    jsr WriteCommandLcd

    ;writeData(0x20, cs);
    lda #$20
    jsr WriteDataLcd

    ; 0xEA, 2, 0x00, 0x00,

    ;writeCommand(0xEA, cs);
    lda #$EA
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ; ILI9341_PWCTR1  , 1, 0x23,             // Power control VRH[5:0]

    ;writeCommand(0xC0, cs);
    lda #$C0
    jsr WriteCommandLcd

    ;writeData(0x23, cs);
    lda #$23
    jsr WriteDataLcd

    ; ILI9341_PWCTR2  , 1, 0x10,             // Power control SAP[2:0];BT[3:0]

    ;writeCommand(0xC1, cs);
    lda #$C1
    jsr WriteCommandLcd

    ;writeData(0x10, cs);
    lda #$10
    jsr WriteDataLcd

    ; ILI9341_VMCTR1  , 2, 0x3e, 0x28,       // VCM control

    ;writeCommand(0xC5, cs);
    lda #$C5
    jsr WriteCommandLcd

    ;writeData(0x3E, cs);
    lda #$3E
    jsr WriteDataLcd

    ;writeData(0x28, cs);
    lda #$28
    jsr WriteDataLcd

    ; ILI9341_VMCTR2  , 1, 0x86,             // VCM control2

    ;writeCommand(0xC7, cs);
    lda #$C7
    jsr WriteCommandLcd

    ;writeData(0x86, cs);
    lda #$86
    jsr WriteDataLcd

    ; ILI9341_MADCTL  , 1, 0x48,             // Memory Access Control

    ;writeCommand(0x36, cs);
    lda #$36
    jsr WriteCommandLcd

    ;writeData(0x48, cs);
    lda #$48
    jsr WriteDataLcd

    ; ILI9341_VSCRSADD, 1, 0x00,             // Vertical scroll zero

    ;writeCommand(0x37, cs);
    lda #$37
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ; ILI9341_PIXFMT  , 1, 0x55,

    ;writeCommand(0x3A, cs);
    lda #$3A
    jsr WriteCommandLcd

    ;writeData(0x55, cs);
    lda #$55
    jsr WriteDataLcd

    ; ILI9341_FRMCTR1 , 2, 0x00, 0x18,

    ;writeCommand(0xB1, cs);
    lda #$B1
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ;writeData(0x18, cs);
    lda #$18
    jsr WriteDataLcd

    ; ILI9341_DFUNCTR , 3, 0x08, 0x82, 0x27, // Display Function Control

    ;writeCommand(0x86, cs);
    lda #$86
    jsr WriteCommandLcd

    ;writeData(0x08, cs);
    lda #$08
    jsr WriteDataLcd

    ;writeData(0x82, cs);
    lda #$82
    jsr WriteDataLcd

    ;writeData(0x27, cs);
    lda #$27
    jsr WriteDataLcd

    ; 0xF2, 1, 0x00,                         // 3Gamma Function Disable

    ;writeCommand(0xF2, cs);
    lda #$F2
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ; ILI9341_GAMMASET , 1, 0x01,             // Gamma curve selected

    ;writeCommand(0x26, cs);
    lda #$26
    jsr WriteCommandLcd

    ;writeData(0x01, cs);
    lda #$01
    jsr WriteDataLcd

    ; ILI9341_GMCTRP1 , 15, 0x0F, 0x31, 0x2B, 0x0C, 0x0E, 0x08, // Set Gamma
    ;   0x4E, 0xF1, 0x37, 0x07, 0x10, 0x03, 0x0E, 0x09, 0x00,

    ;writeCommand(0xE0, cs);
    lda #$E0
    jsr WriteCommandLcd

    ;writeData(0x0F, cs);
    lda #$0F
    jsr WriteDataLcd

    ;writeData(0x31, cs);
    lda #$31
    jsr WriteDataLcd

    ;writeData(0x2B, cs);
    lda #$2B
    jsr WriteDataLcd

    ;writeData(0x0C, cs);
    lda #$0C
    jsr WriteDataLcd

    ;writeData(0x0E, cs);
    lda #$0E
    jsr WriteDataLcd

    ;writeData(0x08, cs);
    lda #$08
    jsr WriteDataLcd

    ;writeData(0x4E, cs);
    lda #$4E
    jsr WriteDataLcd

    ;writeData(0xF1, cs);
    lda #$F1
    jsr WriteDataLcd

    ;writeData(0x37, cs);
    lda #$37
    jsr WriteDataLcd

    ;writeData(0x07, cs);
    lda #$07
    jsr WriteDataLcd

    ;writeData(0x10, cs);
    lda #$10
    jsr WriteDataLcd

    ;writeData(0x03, cs);
    lda #$03
    jsr WriteDataLcd

    ;writeData(0x0E, cs);
    lda #$0E
    jsr WriteDataLcd

    ;writeData(0x09, cs);
    lda #$09
    jsr WriteDataLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ; ILI9341_GMCTRN1 , 15, 0x00, 0x0E, 0x14, 0x03, 0x11, 0x07, // Set Gamma
    ;   0x31, 0xC1, 0x48, 0x08, 0x0F, 0x0C, 0x31, 0x36, 0x0F,

    ;writeCommand(0xE1, cs);
    lda #$E1
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    lda #$00
    jsr WriteDataLcd

    ;writeData(0x0E, cs);
    lda #$0E
    jsr WriteDataLcd

    ;writeData(0x14, cs);
    lda #$14
    jsr WriteDataLcd

    ;writeData(0x03, cs);
    lda #$03
    jsr WriteDataLcd

    ;writeData(0x11, cs);
    lda #$11
    jsr WriteDataLcd

    ;writeData(0x07, cs);
    lda #$07
    jsr WriteDataLcd

    ;writeData(0x31, cs);
    lda #$31
    jsr WriteDataLcd

    ;writeData(0xC1, cs);
    lda #$C1
    jsr WriteDataLcd

    ;writeData(0x48, cs);
    lda #$48
    jsr WriteDataLcd

    ;writeData(0x08, cs);
    lda #$08
    jsr WriteDataLcd

    ;writeData(0x0F, cs);
    lda #$0F
    jsr WriteDataLcd

    ;writeData(0x0C, cs);
    lda #$0C
    jsr WriteDataLcd

    ;writeData(0x31, cs);
    lda #$31
    jsr WriteDataLcd

    ;writeData(0x36, cs);
    lda #$36
    jsr WriteDataLcd

    ;writeData(0x0F, cs);
    lda #$0F
    jsr WriteDataLcd

    ; ILI9341_SLPOUT  , 0x80,                // Exit Sleep

    ;writeCommand(0x11, cs);
    lda #$11
    jsr WriteCommandLcd

    jsr Delay

    ;  ILI9341_DISPON  , 0x80,                // Display on

    ;writeCommand(0x29, cs);
    lda #$29
    jsr WriteCommandLcd

    ; 0x00                                   // End of list

    ;writeCommand(0x00, cs);
    lda #$00
    jsr WriteCommandLcd

    ; Disable both screens.
    lda #$01
    sta TftCs1
    sta $0001
    sta TftCs2
    sta $0001

    rts

WriteCommandLcd
    ; DC low.
    ldx #$00
    stx TftDC

    jsr WriteDataLcd

    ; DC high.
    ldx #$01
    stx TftDC

    rts

WriteDataLcd
    sta SpiSrLd
    sta $0001

    ; Clock LCD only.
    sta TftClockLCD
    sta $0001

    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

    rts

; Load asteroids into active asteroid memory slot.
LoadAsteroid1
		lda $21
		sta $0B
		lda $22
		sta $0C
		lda $23
		sta $0D
		lda $24
		sta $0E
		lda $25
		sta $0F
		lda $26
		sta $10
		lda $27
		sta $11
		lda $28
		sta $12
		lda $29
		sta $13
		lda $2A
		sta $14
		lda $2B
		sta $15
		lda $2C
		sta $16
		lda $2D
		sta $17
		lda $2E
		sta $18
		lda $2F
		sta $19
		lda $30
		sta $1A
		lda $31
		sta $1B
		lda $32
		sta $1C
		lda $33
		sta $1D
		lda $34
		sta $1E
		lda $35
		sta $1F
		lda $36
		sta $20

		rts

LoadAsteroid2Left
		lda $37
		sta $0B
		lda $38
		sta $0C
		lda $39
		sta $0D
		lda $3A
		sta $0E
		lda $3B
		sta $0F
		lda $3C
		sta $10
		lda $3D
		sta $11
		lda $3E
		sta $12
		lda $3F
		sta $13
		lda $40
		sta $14
		lda $41
		sta $15
		lda $42
		sta $16
		lda $43
		sta $17
		lda $44
		sta $18
		lda $45
		sta $19
		lda $46
		sta $1A
		lda $47
		sta $1B
		lda $48
		sta $1C
		lda $49
		sta $1D
		lda $4A
		sta $1E
		lda $4B
		sta $1F
		lda $4C
		sta $20

		rts

LoadAsteroid3Left
		lda $4D
		sta $0B
		lda $4E
		sta $0C
		lda $4F
		sta $0D
		lda $50
		sta $0E
		lda $51
		sta $0F
		lda $52
		sta $10
		lda $53
		sta $11
		lda $54
		sta $12
		lda $55
		sta $13
		lda $56
		sta $14
		lda $57
		sta $15
		lda $58
		sta $16
		lda $59
		sta $17
		lda $5A
		sta $18
		lda $5B
		sta $19
		lda $5C
		sta $1A
		lda $5D
		sta $1B
		lda $5E
		sta $1C
		lda $5F
		sta $1D
		lda $60
		sta $1E
		lda $61
		sta $1F
		lda $62
		sta $20

		rts

LoadAsteroid2Right
		lda $63
		sta $0B
		lda $64
		sta $0C
		lda $65
		sta $0D
		lda $66
		sta $0E
		lda $67
		sta $0F
		lda $68
		sta $10
		lda $69
		sta $11
		lda $6A
		sta $12
		lda $6B
		sta $13
		lda $6C
		sta $14
		lda $6D
		sta $15
		lda $6E
		sta $16
		lda $6F
		sta $17
		lda $70
		sta $18
		lda $71
		sta $19
		lda $72
		sta $1A
		lda $73
		sta $1B
		lda $74
		sta $1C
		lda $75
		sta $1D
		lda $76
		sta $1E
		lda $77
		sta $1F
		lda $78
		sta $20

		rts

LoadAsteroid3Right
		lda $79
		sta $0B
		lda $7A
		sta $0C
		lda $7B
		sta $0D
		lda $7C
		sta $0E
		lda $7D
		sta $0F
		lda $7E
		sta $10
		lda $7F
		sta $11
		lda $80
		sta $12
		lda $81
		sta $13
		lda $82
		sta $14
		lda $83
		sta $15
		lda $84
		sta $16
		lda $85
		sta $17
		lda $86
		sta $18
		lda $87
		sta $19
		lda $88
		sta $1A
		lda $89
		sta $1B
		lda $8A
		sta $1C
		lda $8B
		sta $1D
		lda $8C
		sta $1E
		lda $8D
		sta $1F
		lda $8E
		sta $20

		rts

; Speed above all, this is frequently redrawn.
; Come on 6502, you can do it!
DrawAsteroid
		;;;;
		; Row 0 - all black pixels for lower cost movements.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0E
		sbc #$0C
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0E
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		sbc #$01
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		sbc #$01
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		lda #$00
		ldx #$1A
AsteroidLoop0
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		dex
		bne AsteroidLoop0

		;;;;
		; Row 1
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0E
		sbc #$0C
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0E
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$16
AsteroidLoop1
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		dex
		bne AsteroidLoop1

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 2
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0F
		sbc #$0E
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0F
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$01
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$01
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$1A
AsteroidLoop2
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop2

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 3
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $10
		sbc #$10
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $10
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$02
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$02
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$1E
AsteroidLoop3
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop3

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 4
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $11
		sbc #$12
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $11
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$03
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$03
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$22
AsteroidLoop4
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop4

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 5
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $12
		sbc #$14
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $12
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$04
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$04
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$26
AsteroidLoop5
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop5

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 6
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $13
		sbc #$16
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $13
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$05
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$05
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$2A
AsteroidLoop6
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop6

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 7
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $14
		sbc #$18
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $14
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$06
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$06
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$2E
AsteroidLoop7
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop7

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 8
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $15
		sbc #$1A
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $15
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$07
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$07
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$32
AsteroidLoop8
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop8

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 9
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $16
		sbc #$1C
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $16
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$08
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$08
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$36
AsteroidLoop9
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop9

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 10
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $17
		sbc #$1C
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $17
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$09
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$09
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$36
AsteroidLoop10
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop10

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 11
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $18
		sbc #$1C
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $18
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0A
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0A
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$36
AsteroidLoop11
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop11

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 12
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $19
		sbc #$1A
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $19
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0B
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0B
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$32
AsteroidLoop12
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop12

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 13
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $1A
		sbc #$18
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $1A
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0C
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0C
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$2E
AsteroidLoop13
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop13

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 14
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $1B
		sbc #$16
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $1B
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0D
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0D
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$2A
AsteroidLoop14
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop14

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 15
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $1C
		sbc #$14
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $1C
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0E
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0E
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$26
AsteroidLoop15
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop15

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 16
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $1D
		sbc #$12
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $1D
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0F
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$0F
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$22
AsteroidLoop16
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop16

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 17
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $1E
		sbc #$10
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $1E
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$10
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$10
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$1E
AsteroidLoop17
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop17

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 18
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $1F
		sbc #$0E
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $1F
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$11
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$11
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$1A
AsteroidLoop18
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop18

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 19
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $20
		sbc #$0C
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $20
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$12
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$12
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		lda $0C
		ldx #$16
AsteroidLoop19
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop19

		; Black pixel padding (for lower cost movements).
		lda #$00
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
		sta SpiSrLd
    sta $0001
    ; Clock LCD only.
    sta TftClockLCD
    sta $0001
    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001

		;;;;
		; Row 19+1 - all black pixels for lower cost movements.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $20
		sbc #$0C
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $20
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$13
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda $0D
		adc #$13
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		lda #$00
		ldx #$18
AsteroidLoop19p1
		sta SpiSrLd
		sta $0001

		; Clock LCD only.
		sta TftClockLCD
		sta $0001

		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		dex
		bne AsteroidLoop19p1

		rts

; Draw a common background for both screens.
DrawBackground
		;;;
		; Cockpit - Bottom.
		;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$EF
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$32
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 48*255=12240 (0s are skipped, so add 1 to loop counters)
		ldx #$31
LoopBgData1	ldy #$FF
LoopBgData2
				lda #$63
				jsr WriteDataLcd
				lda #$2C
				jsr WriteDataLcd

				dey
				bne LoopBgData2
				dex
				bne LoopBgData1

		;;;;
		; Cockpit - Right side.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0A
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$33
		jsr WriteDataLcd
		lda #$01
		jsr WriteDataLcd
		lda #$35
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 12*238=2856 (2849 needed).
		ldx #$0D
LoopBgData3	ldy #$EF
LoopBgData4
				lda #$63
				jsr WriteDataLcd
				lda #$2C
				jsr WriteDataLcd

				dey
				bne LoopBgData4
				dex
				bne LoopBgData3

		;;;;
		; Cockpit - Left side.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$E5
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$EF
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$33
		jsr WriteDataLcd
		lda #$01
		jsr WriteDataLcd
		lda #$35
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 12*238=2856 (2849 needed).
		ldx #$0D
LoopBgData5	ldy #$EF
LoopBgData6
				lda #$63
				jsr WriteDataLcd
				lda #$2C
				jsr WriteDataLcd

				dey
				bne LoopBgData6
				dex
				bne LoopBgData5

		;;;;
		; Cockpit - Top.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$EF
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$01
		jsr WriteDataLcd
		lda #$36
		jsr WriteDataLcd
		lda #$01
		jsr WriteDataLcd
		lda #$3F
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 10*240=2400
		ldx #$0B
LoopBgData7	ldy #$F1
LoopBgData8
				lda #$63
				jsr WriteDataLcd
				lda #$2C
				jsr WriteDataLcd

				dey
				bne LoopBgData8
				dex
				bne LoopBgData7

		;;;;
		; Space 1.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0B
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$E4
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$33
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$65
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		lda #$00 ; color data
		ldx #$0B
LoopSpaceData1	ldy #$E2
LoopSpaceData2
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd

				dey
				bne LoopSpaceData2
				dex
				bne LoopSpaceData1

		;;;;
		; Space 2.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0B
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$E4
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$66
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$98
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		lda #$00 ; color data
		ldx #$0B
LoopSpaceData3	ldy #$E2
LoopSpaceData4
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd

				dey
				bne LoopSpaceData4
				dex
				bne LoopSpaceData3

		;;;;
		; Space 3.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0B
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$E4
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$99
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$CB
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		lda #$00 ; color data
		ldx #$0B
LoopSpaceData5	ldy #$E2
LoopSpaceData6
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd

				dey
				bne LoopSpaceData6
				dex
				bne LoopSpaceData5

		;;;;
		; Space 4.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0B
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$E4
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$CC
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$FE
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		lda #$00 ; color data
		ldx #$0B
LoopSpaceData7	ldy #$E2
LoopSpaceData8
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd

				dey
				bne LoopSpaceData8
				dex
				bne LoopSpaceData7

		;;;;
		; Space 5.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0B
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$E4
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$CC
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$FE
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		lda #$00 ; color data
		ldx #$0B
LoopSpaceData9	ldy #$E2
LoopSpaceData10
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd

				dey
				bne LoopSpaceData10
				dex
				bne LoopSpaceData9

		;;;;
		; Space 6.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0B
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$E4
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$FF
		jsr WriteDataLcd
		lda #$01
		jsr WriteDataLcd
		lda #$35
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		; 240×10=2400 (2398 needed).
		lda #$00 ; color data
		ldx #$0B
LoopSpaceData11	ldy #$F1
LoopSpaceData12
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd
				jsr WriteDataLcd

				dey
				bne LoopSpaceData12
				dex
				bne LoopSpaceData11

		rts

DrawBackgroundLeft
		;;;;
		; Button 1.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$50
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$5A
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0A
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$14
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData1l
				lda #$E8
				jsr WriteDataLcd
				lda #$E3
				jsr WriteDataLcd
				dey
				bne LoopButtonData1l

		;;;;
		; Button 2.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$50
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$5A
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$19
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$23
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData2l
				lda #$02
				jsr WriteDataLcd
				lda #$EC
				jsr WriteDataLcd
				dey
				bne LoopButtonData2l

		;;;;
		; Button 3.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$50
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$5A
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$28
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$32
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData3l
				lda #$22
				jsr WriteDataLcd
				lda #$9C
				jsr WriteDataLcd
				dey
				bne LoopButtonData3l

		;;;;
		; Button 4.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$95
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$9F
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$28
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$32
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData4l
				lda #$0C
				jsr WriteDataLcd
				lda #$E2
				jsr WriteDataLcd
				dey
				bne LoopButtonData4l

		;;;;
		; Yoke center.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$63
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$8B
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$17
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$1B
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$CE
		lda #$00
LoopYokeData1l
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData1l

		;;;;
		; Yoke left.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$87
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$8D
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$19
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$1F
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$5C
		lda #$00
LoopYokeData2l
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData2l

		;;;;
		; Yoke right.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$61
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$67
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$19
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$1F
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$5C
		lda #$00
LoopYokeData3l
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData3l

		rts

DrawBackgroundRight
		;;;;
		; Button 1.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$50
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$5A
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$0A
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$14
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData1r
				lda #$E8
				jsr WriteDataLcd
				lda #$E3
				jsr WriteDataLcd
				dey
				bne LoopButtonData1r

		;;;;
		; Button 2.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$53
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$5D
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$19
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$23
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData2r
				lda #$02
				jsr WriteDataLcd
				lda #$EC
				jsr WriteDataLcd
				dey
				bne LoopButtonData2r

		;;;;
		; Button 3.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$50
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$5A
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$28
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$32
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData3r
				lda #$22
				jsr WriteDataLcd
				lda #$9C
				jsr WriteDataLcd
				dey
				bne LoopButtonData3r

		;;;;
		; Button 4.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$95
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$9F
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$28
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$32
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData4r
				lda #$0C
				jsr WriteDataLcd
				lda #$E2
				jsr WriteDataLcd
				dey
				bne LoopButtonData4r

		;;;;
		; Yoke center.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$66
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$8E
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$17
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$1B
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$CE
		lda #$00
LoopYokeData1r
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData1r

		;;;;
		; Yoke left.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$8A
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$90
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$19
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$1F
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$5C
		lda #$00
LoopYokeData2r
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData2r

		;;;;
		; Yoke right.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$64
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$6A
		jsr WriteDataLcd

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		jsr WriteDataLcd
		lda #$19
		jsr WriteDataLcd
		lda #$00
		jsr WriteDataLcd
		lda #$1F
		jsr WriteDataLcd

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$5C
		lda #$00
LoopYokeData3r
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData3r

		rts

DrawCrosshairs
		;;;;
		; Vertical.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$77
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$00
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$78
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$95
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$00
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$9A
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$0C
LoopCrosshairsVertical
				lda #$E8
				sta SpiSrLd
				sta $0001
				; Clock LCD only.
				sta TftClockLCD
				sta $0001
				; Clock LCD and SR together 7 more times.
				sta TftClkBoth
				sta $0001

				lda #$61
				sta SpiSrLd
				sta $0001
				; Clock LCD only.
				sta TftClockLCD
				sta $0001
				; Clock LCD and SR together 7 more times.
				sta TftClkBoth
				sta $0001

				dey
				bne LoopCrosshairsVertical

		;;;;
		; Horizontal.
		;;;;

		; Column address set.
		lda #$2A
		jsr WriteCommandLcd
		lda #$00
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$74
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$00
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$7B
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		; Row address set.
		lda #$2B
		jsr WriteCommandLcd
		lda #$00
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$97
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$00
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001
		lda #$98
		sta SpiSrLd
		sta $0001
		; Clock LCD only.
		sta TftClockLCD
		sta $0001
		; Clock LCD and SR together 7 more times.
		sta TftClkBoth
		sta $0001

		; RAM write.
		lda #$2C
		jsr WriteCommandLcd

		ldy #$10
LoopCrosshairsHorizontal
				lda #$E8
				sta SpiSrLd
				sta $0001
				; Clock LCD only.
				sta TftClockLCD
				sta $0001
				; Clock LCD and SR together 7 more times.
				sta TftClkBoth
				sta $0001

				lda #$61
				sta SpiSrLd
				sta $0001
				; Clock LCD only.
				sta TftClockLCD
				sta $0001
				; Clock LCD and SR together 7 more times.
				sta TftClkBoth
				sta $0001

				dey
				bne LoopCrosshairsHorizontal

		rts

; PS/2 Code Set 2 Scan Code Lookup Table
; Subtract $14 from scan code to determine
; byte offset into this table.
; Value at lookup location is character
; LCD data corresponding to scan code.
ScanCodeLookup
		.byte #$51	; Q
		.byte #$31	; 1
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$5A	; Z
		.byte #$53	; S
		.byte #$41	; A
		.byte #$57	; W
		.byte #$32	; 2
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$43	; C
		.byte #$58	; X
		.byte #$44	; D
		.byte #$45	; E
		.byte #$34	; 4
		.byte #$33	; 3
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$20	; <space>
		.byte #$56	; V
		.byte #$46	; F
		.byte #$54	; T
		.byte #$52	; R
		.byte #$35	; 5
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$4E	; N
		.byte #$42	; B
		.byte #$48	; H
		.byte #$47	; G
		.byte #$59	; Y
		.byte #$36	; 6
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$4d	; M
		.byte #$4a	; J
		.byte #$55	; U
		.byte #$37	; 7
		.byte #$38	; 8
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$2C	; ,
		.byte #$4B	; K
		.byte #$49	; I
		.byte #$4F	; O
		.byte #$30	; 0
		.byte #$39	; 9
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$2E	; .
		.byte #$2F	; /
		.byte #$4C	; L
		.byte #$3B	; ;
		.byte #$50	; P
		.byte #$2D	; -
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$27	; '
		.byte #$20	; unused
		.byte #$5B	; [
		.byte #$3D	; =
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$20	; unused
		.byte #$20	; <enter>

; Store the location of key program sections.
		ORG $FFFC
ResetVector
		.word StartExe		; Start of execution.
IrqVector
		.word KbIsr				; Interrupt service routine.
