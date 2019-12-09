	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r5, .L4
	mov	r3, #1
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	ldr	r0, .L4+12
	ldr	r6, .L4+16
	mov	lr, pc
	bx	r6
	ldr	r0, [r5]
	ldr	r1, .L4+20
	smull	r2, r3, r0, r1
	sub	r3, r3, r0, asr #31
	ldr	r2, .L4+24
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	ldr	r3, .L4+28
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	ldr	r2, .L4+32
	add	r3, r3, #1
	str	r3, [r5]
	mov	lr, pc
	bx	r2
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L4+36
	orr	r3, r3, #4608
	strh	r1, [r2, #10]	@ movhi
	ldr	r5, .L4+40
	strh	r4, [r2, #20]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #22]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+48
	ldr	r2, .L4+52
	ldr	r1, .L4+56
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L4+60
	ldr	r1, .L4+64
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #97
	mov	r2, #98
	mov	ip, #49
	ldr	r0, .L4+68
	mov	r3, #512
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	mov	r2, #117440512
	strh	ip, [r0, #4]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L4+72
	ldr	r3, .L4+76
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	puzzle
	.word	11025
	.word	1976156
	.word	StartTheme
	.word	playSoundA
	.word	1431655766
	.word	cursor
	.word	initGame
	.word	hideSprites
	.word	8072
	.word	DMANow
	.word	STATE_startPal
	.word	13984
	.word	100696064
	.word	STATE_startTiles
	.word	100726784
	.word	STATE_startMap
	.word	shadowOAM
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #0
	mov	ip, #4608
	mov	r2, #40192
	ldr	r0, .L8
	push	{r4, lr}
	ldr	lr, .L8+4
	strh	ip, [r1]	@ movhi
	ldr	ip, .L8+8
	str	r3, [r0]
	ldr	r0, .L8+12
	str	r3, [lr]
	str	r3, [ip]
	ldr	r4, .L8+16
	strh	r2, [r1, #12]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #14]	@ movhi
	ldr	r2, .L8+20
	ldr	r1, .L8+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+28
	ldr	r1, .L8+32
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	clockHands
	.word	clockHandsSlower
	.word	puzzle
	.word	-25852
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L15
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L16:
	.align	2
.L15:
	.word	buttons
	.word	stopSound
	.size	win.part.0, .-win.part.0
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L20:
	.align	2
.L19:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r5, #1
	ldr	r1, .L23
	ldr	r2, .L23+4
	ldr	r3, .L23+8
	str	r4, [r1]
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	ip, #7424
	mov	r0, #67108864
	mov	r2, #4864
	ldr	r3, .L23+12
	strh	r2, [r0]	@ movhi
	strh	r3, [r0, #10]	@ movhi
	mov	r2, #100663296
	strh	r4, [r0, #20]	@ movhi
	mov	r3, #3328
	strh	r4, [r0, #22]	@ movhi
	ldr	r1, .L23+16
	strh	ip, [r0, #8]	@ movhi
	ldr	r4, .L23+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L23+24
	ldr	r1, .L23+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L23+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+36
	ldr	r2, .L23+40
	ldr	r1, .L23+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L23+48
	ldr	r1, .L23+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #139
	mov	r2, #175
	mov	ip, #49
	ldr	r0, .L23+56
	mov	r3, #512
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	strh	ip, [r0, #4]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+60
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	cursor
	.word	instructionsNum
	.word	hideSprites
	.word	8072
	.word	instructionsText1Tiles
	.word	DMANow
	.word	100722688
	.word	instructionsText1Map
	.word	STATE_instructions1Pal
	.word	5152
	.word	100696064
	.word	STATE_instructions1Tiles
	.word	100726784
	.word	STATE_instructions1Map
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #67108864
	mov	r1, #7168
	ldr	ip, .L27
	ldr	r0, .L27+4
	push	{r4, lr}
	str	r3, [ip]
	str	r3, [r0]
	strh	r1, [r2]	@ movhi
	ldr	r3, .L27+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+12
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L27+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2144
	mov	r2, #100663296
	ldr	r1, .L27+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L27+24
	ldr	r1, .L27+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+32
	ldr	r2, .L27+36
	ldr	r1, .L27+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L27+44
	ldr	r1, .L27+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L27+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	cursor
	.word	winV
	.word	hideSprites
	.word	DMANow
	.word	clocktowerPal
	.word	clocktowerTiles
	.word	100722688
	.word	clocktowerMap
	.word	4496
	.word	100679680
	.word	cityTiles
	.word	100718592
	.word	cityMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L74
	ldr	r3, [r1]
	ldr	r2, .L74+4
	add	r3, r3, #1
	ldr	r0, .L74+8
	cmp	r3, r2
	push	{r4, r5, r6, lr}
	ldr	r2, [r0]
	str	r3, [r1]
	bgt	.L30
	ldr	r1, .L74+12
	smull	r4, r5, r3, r1
	asr	r3, r3, #31
	rsb	r3, r3, r5, asr #11
	lsl	r3, r3, #22
	add	r3, r3, #5242880
	lsr	r3, r3, #16
.L31:
	cmp	r2, #8
	moveq	r1, #0
	mov	ip, #84
	ldr	r4, .L74+16
	lsl	r2, r2, #6
	streq	r1, [r0]
	add	r2, r2, #276
	ldr	r1, .L74+20
	ldrh	r0, [r4]
	add	r2, r2, #2
	strh	r2, [r1, #20]	@ movhi
	ldr	r5, .L74+24
	ldr	r2, .L74+28
	tst	r0, #64
	strh	r3, [r1, #12]	@ movhi
	and	r0, r0, #128
	strh	ip, [r1, #8]	@ movhi
	strh	ip, [r1, #16]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	strh	r2, [r1, #18]	@ movhi
	ldr	r3, [r5]
	beq	.L33
	ldr	r2, .L74+32
	ldrh	r2, [r2]
	ands	ip, r2, #64
	bne	.L33
	cmp	r3, #0
	beq	.L34
	cmp	r0, #0
	str	ip, [r5]
	beq	.L37
	tst	r2, #128
	beq	.L36
.L37:
	mov	r2, #97
	mov	r3, #98
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
.L42:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L74+20
	mov	r0, #3
	ldr	r6, .L74+36
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L29
	ldr	r3, .L74+32
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L29
	ldr	r2, [r5]
	ldr	r3, .L74+40
	cmp	r2, #0
	ldr	r0, [r3]
	ldr	r3, .L74+44
	beq	.L73
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L33:
	cmp	r0, #0
	beq	.L40
	ldr	r2, .L74+32
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L40
	cmp	r3, #0
	beq	.L36
.L39:
	mov	r3, #0
	str	r3, [r5]
	b	.L37
.L40:
	cmp	r3, #0
	beq	.L37
.L41:
	mov	r2, #129
	mov	r3, #98
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	b	.L42
.L29:
	pop	{r4, r5, r6, lr}
	bx	lr
.L30:
	mov	ip, #0
	add	r2, r2, #1
	mov	r3, #80
	str	r2, [r0]
	str	ip, [r1]
	b	.L31
.L73:
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+48
	mov	lr, pc
	bx	r3
	ldr	r4, .L74+52
	mov	r3, #1
	ldr	r2, .L74+56
	ldr	r1, .L74+60
	ldr	r0, .L74+64
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToGame
.L34:
	mov	r3, #1
	cmp	r0, #0
	str	r3, [r5]
	beq	.L41
	tst	r2, #128
	beq	.L39
	b	.L41
.L36:
	mov	r3, #1
	mov	r2, #129
	str	r3, [r5]
	mov	r3, #98
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	b	.L42
.L75:
	.align	2
.L74:
	.word	clockHands
	.word	36000
	.word	clockHandsSlower
	.word	1954687339
	.word	oldButtons
	.word	shadowOAM
	.word	cursor
	.word	16421
	.word	buttons
	.word	DMANow
	.word	seed
	.word	srand
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1410560
	.word	MainGameTheme
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L91
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L91+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, r5, r6, lr}
	ldr	r4, .L91+8
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L89
	cmp	r3, #2
	beq	.L90
	ldr	r3, .L91+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L91+16
	mov	r3, #1
	ldr	r2, .L91+20
	ldr	r1, .L91+24
	ldr	r0, .L91+28
	mov	lr, pc
	bx	r5
	bl	goToGame
.L79:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L90:
	ldr	r5, .L91+32
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L91+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L91+40
	ldr	r2, .L91+44
	ldr	r1, .L91+48
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L91+52
	ldr	r1, .L91+56
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #3584
	mov	r2, #100663296
	ldr	r1, .L91+60
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L91+64
	ldr	r1, .L91+68
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #139
	mov	r2, #120
.L88:
	mov	ip, #49
	ldr	r0, .L91+72
	mov	r3, #512
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	strh	ip, [r0, #4]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	b	.L79
.L89:
	ldr	r5, .L91+32
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L91+76
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #5184
	ldr	r2, .L91+44
	ldr	r1, .L91+80
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L91+52
	ldr	r1, .L91+84
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #3104
	mov	r2, #100663296
	ldr	r1, .L91+88
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L91+64
	ldr	r1, .L91+92
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #139
	mov	r2, #175
	b	.L88
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	buttons
	.word	instructionsNum
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1410560
	.word	MainGameTheme
	.word	DMANow
	.word	STATE_instructions3Pal
	.word	5664
	.word	100696064
	.word	STATE_instructions3Tiles
	.word	100726784
	.word	STATE_instructions3Map
	.word	instructionsText3Tiles
	.word	100722688
	.word	instructionsText3Map
	.word	shadowOAM
	.word	STATE_instructions2Pal
	.word	STATE_instructions2Tiles
	.word	STATE_instructions2Map
	.word	instructionsText2Tiles
	.word	instructionsText2Map
	.size	instructions, .-instructions
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L135
	ldrh	r3, [r4]
	ldr	r5, .L135+4
	tst	r3, #64
	ldr	r2, [r5]
	and	r3, r3, #128
	beq	.L94
	ldr	r1, .L135+8
	ldrh	r1, [r1]
	ands	r0, r1, #64
	bne	.L94
	cmp	r2, #0
	beq	.L95
	cmp	r3, #0
	str	r0, [r5]
	beq	.L98
	tst	r1, #128
	bne	.L98
.L97:
	mov	r3, #1
	str	r3, [r5]
.L102:
	mov	r1, #121
	mov	r2, #124
	ldr	r3, .L135+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L103:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L135+12
	mov	r0, #3
	ldr	r6, .L135+16
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L135+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L93
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L134
	ldr	r3, .L135+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L94:
	cmp	r3, #0
	beq	.L101
	ldr	r3, .L135+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L101
	cmp	r2, #0
	beq	.L97
.L100:
	mov	r3, #0
	str	r3, [r5]
.L98:
	mov	r1, #89
	mov	r2, #124
	ldr	r3, .L135+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L103
.L101:
	cmp	r2, #0
	bne	.L102
	b	.L98
.L93:
	pop	{r4, r5, r6, lr}
	bx	lr
.L134:
	ldr	r3, .L135+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L95:
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r5]
	beq	.L102
	tst	r1, #128
	beq	.L100
	b	.L102
.L136:
	.align	2
.L135:
	.word	oldButtons
	.word	cursor
	.word	buttons
	.word	shadowOAM
	.word	DMANow
	.word	stopSound
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r2, .L139
	ldr	r3, .L139+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r2, #4608
	ldr	r3, .L139+8
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	mov	r2, #83886080
	strh	r4, [r1, #20]	@ movhi
	mov	r3, #256
	strh	r4, [r1, #22]	@ movhi
	mov	r0, #3
	ldr	r4, .L139+12
	ldr	r1, .L139+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L139+20
	ldr	r2, .L139+24
	ldr	r1, .L139+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L139+32
	ldr	r1, .L139+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #97
	mov	r2, #98
	mov	ip, #49
	ldr	r0, .L139+40
	mov	r3, #512
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	mov	r2, #117440512
	strh	ip, [r0, #4]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L139+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L140:
	.align	2
.L139:
	.word	cursor
	.word	hideSprites
	.word	8072
	.word	DMANow
	.word	STATE_pausePal
	.word	12512
	.word	100696064
	.word	STATE_pauseTiles
	.word	100726784
	.word	STATE_pauseMap
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L143
	push	{r4, lr}
	ldr	r3, .L143+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #4608
	ldr	r2, .L143+8
	ldr	r4, .L143+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L143+16
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #15296
	ldr	r2, .L143+20
	ldr	r1, .L143+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L143+28
	ldr	r1, .L143+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #97
	mov	r2, #130
	mov	ip, #49
	ldr	r0, .L143+36
	mov	r3, #512
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	mov	r2, #117440512
	strh	ip, [r0, #4]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L143+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L144:
	.align	2
.L143:
	.word	cursor
	.word	hideSprites
	.word	8072
	.word	DMANow
	.word	STATE_winPal
	.word	100696064
	.word	STATE_winTiles
	.word	100726784
	.word	STATE_winMap
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L156
	mov	lr, pc
	bx	r3
	ldr	r3, .L156+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L156+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L146
	ldr	r3, .L156+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L153
.L146:
	ldr	r3, .L156+16
	ldr	r3, [r3]
	ldr	r5, .L156+20
	cmp	r3, #0
	ldr	r4, [r5]
	bne	.L147
	cmp	r4, #0
	beq	.L154
.L147:
	cmp	r4, #0
	ble	.L145
	add	r4, r4, #1
	cmp	r4, #200
	str	r4, [r5]
	beq	.L155
.L145:
	pop	{r4, r5, r6, lr}
	bx	lr
.L155:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L154:
	ldr	r3, .L156+24
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L156+28
	ldr	r4, .L156+32
	ldr	r1, .L156+36
	ldr	r0, .L156+40
	mov	lr, pc
	bx	r4
	ldr	r4, [r5]
	add	r4, r4, #1
	str	r4, [r5]
	b	.L147
.L153:
	ldr	r3, .L156+44
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L146
.L157:
	.align	2
.L156:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	fitted
	.word	winV
	.word	stopSound
	.word	11025
	.word	playSoundA
	.word	59370
	.word	PuzzleDoneChime
	.word	pauseSound
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L171
	mov	lr, pc
	bx	r3
	ldr	r2, .L171+4
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	ldr	fp, .L171+8
	ldr	r5, .L171+12
	ldr	r10, .L171+16
	ldr	r9, .L171+20
	ldr	r8, .L171+24
	ldr	r7, .L171+28
	ldr	r6, .L171+32
	ldr	r4, .L171+36
.L159:
	ldrh	r2, [fp]
	strh	r2, [r5]	@ movhi
	ldr	r3, [r10]
	ldrh	r1, [r4, #48]
	strh	r1, [fp]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L159
.L162:
	.word	.L161
	.word	.L163
	.word	.L164
	.word	.L165
	.word	.L166
.L166:
	tst	r2, #8
	beq	.L159
	ldr	r3, .L171+40
	mov	lr, pc
	bx	r3
	b	.L159
.L165:
	mov	lr, pc
	bx	r6
	b	.L159
.L163:
	mov	lr, pc
	bx	r8
	b	.L159
.L161:
	mov	lr, pc
	bx	r9
	b	.L159
.L164:
	mov	lr, pc
	bx	r7
	b	.L159
.L172:
	.align	2
.L171:
	.word	initialize
	.word	seed
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	instructions
	.word	game
	.word	pause
	.word	67109120
	.word	win.part.0
	.size	main, .-main
	.comm	buffer,41,4
	.comm	clockHandsSlower,4,4
	.comm	clockHands,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	winV,4,4
	.comm	puzzle,4,4
	.comm	instructionsNum,4,4
	.comm	cursor,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
