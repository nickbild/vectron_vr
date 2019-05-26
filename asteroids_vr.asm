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

		; Is this scan code flagged to be skipped?
		ldx SkipNextScanCodeFlag
		cpx #$01
		beq SkipScanCodeAndResetSkip

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

		; Store data in memory location read by LCD.
		sta $7FBE
		sta $7FBF

		; Make sure RS (bit 3) is set to 1.
		lda #$0F
		ora $7FBE

		; If CursorPosition >= 64, reset it to 0.
		ldx CursorPosition
		cpx #$40
		bcc CursorPositionLessThan32
		ldx #$00
		stx CursorPosition
CursorPositionLessThan32

		ldx CursorPosition
		sta $7FC0,x
		inc CursorPosition

		; Move least sig. nibble to most sig. position, then make sure RS is 1.
		rol $7FBF
		rol $7FBF
		rol $7FBF
		rol $7FBF
		lda #$0F
		ora $7FBF

		ldx CursorPosition
		sta $7FC0,x
		inc CursorPosition

		jsr WriteLCD

SkipScanCodeAndResetSkip
		; Do not skip the next scan code.
		ldx #$00
		stx SkipNextScanCodeFlag

		; Finished ISR, reset binary counter.
SkipScanCode
		lda $FFF9
		lda $0001

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
    ldx #$01
    jsr WriteCommandLcd
    jsr Delay

    ; 0xEF, 3, 0x03, 0x80, 0x02,

    ; writeCommand(0xEF, cs);
    ldx #$EF
    jsr WriteCommandLcd

    ; writeData(0x03, cs);
    ldx #$03
    jsr WriteDataLcd

    ; writeData(0x80, cs);
    ldx #$80
    jsr WriteDataLcd

    ; writeData(0x02, cs);
    ldx #$02
    jsr WriteDataLcd

    ; 0xCF, 3, 0x00, 0xC1, 0x30,

    ; writeCommand(0xCF, cs);
    ldx #$CF
    jsr WriteCommandLcd

    ; writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ; writeData(0xC1, cs);
    ldx #$C1
    jsr WriteDataLcd

    ; writeData(0x30, cs);
    ldx #$30
    jsr WriteDataLcd

    ; 0xED, 4, 0x64, 0x03, 0x12, 0x81,

    ; writeCommand(0xED, cs);
    ldx #$ED
    jsr WriteCommandLcd

    ; writeData(0x64, cs);
    ldx #$64
    jsr WriteDataLcd

    ; writeData(0x03, cs);
    ldx #$03
    jsr WriteDataLcd

    ; writeData(0x12, cs);
    ldx #$12
    jsr WriteDataLcd

    ; writeData(0x81, cs);
    ldx #$81
    jsr WriteDataLcd

    ; 0xE8, 3, 0x85, 0x00, 0x78,

    ;writeCommand(0xE8, cs);
    ldx #$E8
    jsr WriteCommandLcd

    ;writeData(0x85, cs);
    ldx #$85
    jsr WriteDataLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ;writeData(0x78, cs);
    ldx #$78
    jsr WriteDataLcd

    ; 0xCB, 5, 0x39, 0x2C, 0x00, 0x34, 0x02,

    ;writeCommand(0xCB, cs);
    ldx #$CB
    jsr WriteCommandLcd

    ;writeData(0x39, cs);
    ldx #$39
    jsr WriteDataLcd

    ;writeData(0x2C, cs);
    ldx #$2C
    jsr WriteDataLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ;writeData(0x34, cs);
    ldx #$34
    jsr WriteDataLcd

    ;writeData(0x02, cs);
    ldx #$02
    jsr WriteDataLcd

    ; 0xF7, 1, 0x20,

    ;writeCommand(0xF7, cs);
    ldx #$F7
    jsr WriteCommandLcd

    ;writeData(0x20, cs);
    ldx #$20
    jsr WriteDataLcd

    ; 0xEA, 2, 0x00, 0x00,

    ;writeCommand(0xEA, cs);
    ldx #$EA
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ; ILI9341_PWCTR1  , 1, 0x23,             // Power control VRH[5:0]

    ;writeCommand(0xC0, cs);
    ldx #$C0
    jsr WriteCommandLcd

    ;writeData(0x23, cs);
    ldx #$23
    jsr WriteDataLcd

    ; ILI9341_PWCTR2  , 1, 0x10,             // Power control SAP[2:0];BT[3:0]

    ;writeCommand(0xC1, cs);
    ldx #$C1
    jsr WriteCommandLcd

    ;writeData(0x10, cs);
    ldx #$10
    jsr WriteDataLcd

    ; ILI9341_VMCTR1  , 2, 0x3e, 0x28,       // VCM control

    ;writeCommand(0xC5, cs);
    ldx #$C5
    jsr WriteCommandLcd

    ;writeData(0x3E, cs);
    ldx #$3E
    jsr WriteDataLcd

    ;writeData(0x28, cs);
    ldx #$28
    jsr WriteDataLcd

    ; ILI9341_VMCTR2  , 1, 0x86,             // VCM control2

    ;writeCommand(0xC7, cs);
    ldx #$C7
    jsr WriteCommandLcd

    ;writeData(0x86, cs);
    ldx #$86
    jsr WriteDataLcd

    ; ILI9341_MADCTL  , 1, 0x48,             // Memory Access Control

    ;writeCommand(0x36, cs);
    ldx #$36
    jsr WriteCommandLcd

    ;writeData(0x48, cs);
    ldx #$48
    jsr WriteDataLcd

    ; ILI9341_VSCRSADD, 1, 0x00,             // Vertical scroll zero

    ;writeCommand(0x37, cs);
    ldx #$37
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ; ILI9341_PIXFMT  , 1, 0x55,

    ;writeCommand(0x3A, cs);
    ldx #$3A
    jsr WriteCommandLcd

    ;writeData(0x55, cs);
    ldx #$55
    jsr WriteDataLcd

    ; ILI9341_FRMCTR1 , 2, 0x00, 0x18,

    ;writeCommand(0xB1, cs);
    ldx #$B1
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ;writeData(0x18, cs);
    ldx #$18
    jsr WriteDataLcd

    ; ILI9341_DFUNCTR , 3, 0x08, 0x82, 0x27, // Display Function Control

    ;writeCommand(0x86, cs);
    ldx #$86
    jsr WriteCommandLcd

    ;writeData(0x08, cs);
    ldx #$08
    jsr WriteDataLcd

    ;writeData(0x82, cs);
    ldx #$82
    jsr WriteDataLcd

    ;writeData(0x27, cs);
    ldx #$27
    jsr WriteDataLcd

    ; 0xF2, 1, 0x00,                         // 3Gamma Function Disable

    ;writeCommand(0xF2, cs);
    ldx #$F2
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ; ILI9341_GAMMASET , 1, 0x01,             // Gamma curve selected

    ;writeCommand(0x26, cs);
    ldx #$26
    jsr WriteCommandLcd

    ;writeData(0x01, cs);
    ldx #$01
    jsr WriteDataLcd

    ; ILI9341_GMCTRP1 , 15, 0x0F, 0x31, 0x2B, 0x0C, 0x0E, 0x08, // Set Gamma
    ;   0x4E, 0xF1, 0x37, 0x07, 0x10, 0x03, 0x0E, 0x09, 0x00,

    ;writeCommand(0xE0, cs);
    ldx #$E0
    jsr WriteCommandLcd

    ;writeData(0x0F, cs);
    ldx #$0F
    jsr WriteDataLcd

    ;writeData(0x31, cs);
    ldx #$31
    jsr WriteDataLcd

    ;writeData(0x2B, cs);
    ldx #$2B
    jsr WriteDataLcd

    ;writeData(0x0C, cs);
    ldx #$0C
    jsr WriteDataLcd

    ;writeData(0x0E, cs);
    ldx #$0E
    jsr WriteDataLcd

    ;writeData(0x08, cs);
    ldx #$08
    jsr WriteDataLcd

    ;writeData(0x4E, cs);
    ldx #$4E
    jsr WriteDataLcd

    ;writeData(0xF1, cs);
    ldx #$F1
    jsr WriteDataLcd

    ;writeData(0x37, cs);
    ldx #$37
    jsr WriteDataLcd

    ;writeData(0x07, cs);
    ldx #$07
    jsr WriteDataLcd

    ;writeData(0x10, cs);
    ldx #$10
    jsr WriteDataLcd

    ;writeData(0x03, cs);
    ldx #$03
    jsr WriteDataLcd

    ;writeData(0x0E, cs);
    ldx #$0E
    jsr WriteDataLcd

    ;writeData(0x09, cs);
    ldx #$09
    jsr WriteDataLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ; ILI9341_GMCTRN1 , 15, 0x00, 0x0E, 0x14, 0x03, 0x11, 0x07, // Set Gamma
    ;   0x31, 0xC1, 0x48, 0x08, 0x0F, 0x0C, 0x31, 0x36, 0x0F,

    ;writeCommand(0xE1, cs);
    ldx #$E1
    jsr WriteCommandLcd

    ;writeData(0x00, cs);
    ldx #$00
    jsr WriteDataLcd

    ;writeData(0x0E, cs);
    ldx #$0E
    jsr WriteDataLcd

    ;writeData(0x14, cs);
    ldx #$14
    jsr WriteDataLcd

    ;writeData(0x03, cs);
    ldx #$03
    jsr WriteDataLcd

    ;writeData(0x11, cs);
    ldx #$11
    jsr WriteDataLcd

    ;writeData(0x07, cs);
    ldx #$07
    jsr WriteDataLcd

    ;writeData(0x31, cs);
    ldx #$31
    jsr WriteDataLcd

    ;writeData(0xC1, cs);
    ldx #$C1
    jsr WriteDataLcd

    ;writeData(0x48, cs);
    ldx #$48
    jsr WriteDataLcd

    ;writeData(0x08, cs);
    ldx #$08
    jsr WriteDataLcd

    ;writeData(0x0F, cs);
    ldx #$0F
    jsr WriteDataLcd

    ;writeData(0x0C, cs);
    ldx #$0C
    jsr WriteDataLcd

    ;writeData(0x31, cs);
    ldx #$31
    jsr WriteDataLcd

    ;writeData(0x36, cs);
    ldx #$36
    jsr WriteDataLcd

    ;writeData(0x0F, cs);
    ldx #$0F
    jsr WriteDataLcd

    ; ILI9341_SLPOUT  , 0x80,                // Exit Sleep

    ;writeCommand(0x11, cs);
    ldx #$11
    jsr WriteCommandLcd

    jsr Delay

    ;  ILI9341_DISPON  , 0x80,                // Display on

    ;writeCommand(0x29, cs);
    ldx #$29
    jsr WriteCommandLcd

    ; 0x00                                   // End of list

    ;writeCommand(0x00, cs);
    ldx #$00
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
    lda #$00
    sta TftDC

    jsr WriteDataLcd

    ; DC high.
    lda #$01
    sta TftDC

    rts

WriteDataLcd
    ; Command to SR.
    ; x register must contain data.
    stx SpiSrLd
    sta $0001

    ; Clock LCD only.
    sta TftClockLCD
    sta $0001

    ; Clock LCD and SR together 7 more times.
    sta TftClkBoth
    sta $0001
    sta TftClkBoth
    sta $0001
    sta TftClkBoth
    sta $0001
    sta TftClkBoth
    sta $0001
    sta TftClkBoth
    sta $0001
    sta TftClkBoth
    sta $0001
    sta TftClkBoth
    sta $0001

    rts

; Draw a common background for both screens.
DrawBackground
		;;;
		; Cockpit - Bottom.
		;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$EF
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$32
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 48*255=12240 (0s are skipped, so add 1 to loop counters)
		lda #$31
LoopBgData1	ldy #$FF
LoopBgData2
				ldx #$63
				jsr WriteDataLcd
				ldx #$2C
				jsr WriteDataLcd

				dey
				bne LoopBgData2
				.byte #$3A ; DEA
				bne LoopBgData1

		;;;;
		; Cockpit - Right side.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0A
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$33
		jsr WriteDataLcd
		ldx #$01
		jsr WriteDataLcd
		ldx #$35
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 12*238=2856 (2849 needed).
		lda #$0D
LoopBgData3	ldy #$EF
LoopBgData4
				ldx #$63
				jsr WriteDataLcd
				ldx #$2C
				jsr WriteDataLcd

				dey
				bne LoopBgData4
				.byte #$3A ; DEA
				bne LoopBgData3

		;;;;
		; Cockpit - Left side.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$E5
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$EF
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$33
		jsr WriteDataLcd
		ldx #$01
		jsr WriteDataLcd
		ldx #$35
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 12*238=2856 (2849 needed).
		lda #$0D
LoopBgData5	ldy #$EF
LoopBgData6
				ldx #$63
				jsr WriteDataLcd
				ldx #$2C
				jsr WriteDataLcd

				dey
				bne LoopBgData6
				.byte #$3A ; DEA
				bne LoopBgData5

		;;;;
		; Cockpit - Top.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$EF
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$01
		jsr WriteDataLcd
		ldx #$36
		jsr WriteDataLcd
		ldx #$01
		jsr WriteDataLcd
		ldx #$3F
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 10*240=2400
		lda #$0B
LoopBgData7	ldy #$F1
LoopBgData8
				ldx #$63
				jsr WriteDataLcd
				ldx #$2C
				jsr WriteDataLcd

				dey
				bne LoopBgData8
				.byte #$3A ; DEA
				bne LoopBgData7

		;;;;
		; Space 1.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0B
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$E4
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$33
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$65
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		ldx #$00 ; color data
		lda #$0B
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
				.byte #$3A ; DEA
				bne LoopSpaceData1

		;;;;
		; Space 2.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0B
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$E4
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$66
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$98
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		ldx #$00 ; color data
		lda #$0B
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
				.byte #$3A ; DEA
				bne LoopSpaceData3

		;;;;
		; Space 3.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0B
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$E4
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$99
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$CB
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		ldx #$00 ; color data
		lda #$0B
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
				.byte #$3A ; DEA
				bne LoopSpaceData5

		;;;;
		; Space 4.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0B
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$E4
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$CC
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$FE
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		ldx #$00 ; color data
		lda #$0B
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
				.byte #$3A ; DEA
				bne LoopSpaceData7

		;;;;
		; Space 5.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0B
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$E4
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$CC
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$FE
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 225×10=2250 (2244 needed).
		ldx #$00 ; color data
		lda #$0B
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
				.byte #$3A ; DEA
				bne LoopSpaceData9

		;;;;
		; Space 6.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0B
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$E4
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$FF
		jsr WriteDataLcd
		ldx #$01
		jsr WriteDataLcd
		ldx #$35
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		; 240×10=2400 (2398 needed).
		ldx #$00 ; color data
		lda #$0B
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
				.byte #$3A ; DEA
				bne LoopSpaceData11

		rts

DrawBackgroundLeft
		;;;;
		; Button 1.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$50
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$5A
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0A
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$14
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData1l
				ldx #$E8
				jsr WriteDataLcd
				ldx #$E3
				jsr WriteDataLcd
				dey
				bne LoopButtonData1l

		;;;;
		; Button 2.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$50
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$5A
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$19
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$23
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData2l
				ldx #$02
				jsr WriteDataLcd
				ldx #$EC
				jsr WriteDataLcd
				dey
				bne LoopButtonData2l

		;;;;
		; Button 3.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$50
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$5A
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$28
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$32
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData3l
				ldx #$22
				jsr WriteDataLcd
				ldx #$9C
				jsr WriteDataLcd
				dey
				bne LoopButtonData3l

		;;;;
		; Button 4.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$95
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$9F
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$28
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$32
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData4l
				ldx #$0C
				jsr WriteDataLcd
				ldx #$E2
				jsr WriteDataLcd
				dey
				bne LoopButtonData4l

		;;;;
		; Yoke center.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$63
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$8B
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$17
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$1B
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$CE
		ldx #$00
LoopYokeData1l
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData1l

		;;;;
		; Yoke left.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$87
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$8D
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$19
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$1F
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$5C
		ldx #$00
LoopYokeData2l
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData2l

		;;;;
		; Yoke right.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$61
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$67
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$19
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$1F
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$5C
		ldx #$00
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
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$50
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$5A
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$0A
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$14
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData1r
				ldx #$E8
				jsr WriteDataLcd
				ldx #$E3
				jsr WriteDataLcd
				dey
				bne LoopButtonData1r

		;;;;
		; Button 2.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$53
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$5D
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$19
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$23
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData2r
				ldx #$02
				jsr WriteDataLcd
				ldx #$EC
				jsr WriteDataLcd
				dey
				bne LoopButtonData2r

		;;;;
		; Button 3.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$50
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$5A
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$28
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$32
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData3r
				ldx #$22
				jsr WriteDataLcd
				ldx #$9C
				jsr WriteDataLcd
				dey
				bne LoopButtonData3r

		;;;;
		; Button 4.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$95
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$9F
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$28
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$32
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$7A
LoopButtonData4r
				ldx #$0C
				jsr WriteDataLcd
				ldx #$E2
				jsr WriteDataLcd
				dey
				bne LoopButtonData4r

		;;;;
		; Yoke center.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$66
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$8E
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$17
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$1B
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$CE
		ldx #$00
LoopYokeData1r
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData1r

		;;;;
		; Yoke left.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$8A
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$90
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$19
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$1F
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$5C
		ldx #$00
LoopYokeData2r
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData2r

		;;;;
		; Yoke right.
		;;;;

		; Column address set.
		ldx #$2A
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$64
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$6A
		jsr WriteDataLcd

		; Row address set.
		ldx #$2B
		jsr WriteCommandLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$19
		jsr WriteDataLcd
		ldx #$00
		jsr WriteDataLcd
		ldx #$1F
		jsr WriteDataLcd

		; RAM write.
		ldx #$2C
		jsr WriteCommandLcd

		ldy #$5C
		ldx #$00
LoopYokeData3r
				jsr WriteDataLcd
				jsr WriteDataLcd
				dey
				bne LoopYokeData3r

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
