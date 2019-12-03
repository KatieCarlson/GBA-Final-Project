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
	ldr	r2, .L4
	ldr	r3, .L4+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L4+12
	orr	r3, r3, #4608
	strh	r1, [r2, #10]	@ movhi
	ldr	r5, .L4+16
	strh	r4, [r2, #20]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #22]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+24
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #97
	mov	r2, #98
	mov	ip, #49
	ldr	r0, .L4+44
	mov	r3, #512
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	mov	r2, #117440512
	strh	ip, [r0, #4]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L4+48
	ldr	r3, .L4+52
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
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
	mov	r3, #67108864
	mov	r0, #40192
	mov	r1, #4608
	ldr	r2, .L8
	push	{r4, lr}
	strh	r0, [r3, #12]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	ldr	r4, .L8+4
	mov	r3, #256
	ldr	r2, .L8+8
	ldr	r1, .L8+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	-25852
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	setupSounds
	.word	setupInterrupts
	.word	initGame
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
	mov	r3, #3312
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
	mov	r3, #2112
	ldr	r2, .L23+36
	ldr	r1, .L23+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L23+44
	ldr	r1, .L23+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #139
	mov	r2, #175
	mov	ip, #49
	ldr	r0, .L23+52
	mov	r3, #512
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	strh	ip, [r0, #4]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+56
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
	mov	ip, #0
	mov	r2, #67108864
	mov	r1, #7168
	ldr	r0, .L27
	push	{r4, lr}
	ldr	r3, .L27+4
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+8
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L27+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #192
	mov	r2, #100663296
	ldr	r1, .L27+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L27+20
	ldr	r1, .L27+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #48
	ldr	r2, .L27+28
	ldr	r1, .L27+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L27+36
	ldr	r1, .L27+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L27+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	cursor
	.word	hideSprites
	.word	DMANow
	.word	clocktowerPal
	.word	clocktowerTiles
	.word	100722688
	.word	clocktowerMap
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L71
	ldr	r5, .L71+4
	ldr	r2, [r4]
	ldrh	r3, [r5]
	ldr	r6, .L71+8
	add	r2, r2, #1
	tst	r3, #64
	str	r2, [r4]
	and	r3, r3, #128
	ldr	r2, [r6]
	beq	.L30
	ldr	r1, .L71+12
	ldrh	r1, [r1]
	ands	r0, r1, #64
	bne	.L30
	cmp	r2, #0
	beq	.L31
	cmp	r3, #0
	str	r0, [r6]
	beq	.L34
	tst	r1, #128
	bne	.L34
.L33:
	mov	r3, #1
	str	r3, [r6]
.L38:
	mov	r1, #129
	mov	r2, #98
	ldr	r3, .L71+16
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L39:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L71+16
	mov	r0, #3
	ldr	r7, .L71+20
	mov	lr, pc
	bx	r7
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L29
	ldr	r3, .L71+12
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L29
	ldr	r3, [r6]
	cmp	r3, #0
	ldr	r0, [r4]
	ldr	r3, .L71+24
	beq	.L70
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToInstructions
.L30:
	cmp	r3, #0
	beq	.L37
	ldr	r3, .L71+12
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L37
	cmp	r2, #0
	beq	.L33
.L36:
	mov	r3, #0
	str	r3, [r6]
.L34:
	mov	r1, #97
	mov	r2, #98
	ldr	r3, .L71+16
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L39
.L37:
	cmp	r2, #0
	bne	.L38
	b	.L34
.L29:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L70:
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+32
	mov	r3, #1
	ldr	r2, .L71+36
	ldr	r1, .L71+40
	ldr	r0, .L71+44
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToGame
.L31:
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r6]
	beq	.L38
	tst	r1, #128
	beq	.L36
	b	.L38
.L72:
	.align	2
.L71:
	.word	seed
	.word	oldButtons
	.word	cursor
	.word	buttons
	.word	shadowOAM
	.word	DMANow
	.word	srand
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1641000
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
	ldr	r3, .L88
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L88+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, r5, r6, lr}
	ldr	r4, .L88+8
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L86
	cmp	r3, #2
	beq	.L87
	ldr	r3, .L88+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L88+16
	mov	r3, #1
	ldr	r2, .L88+20
	ldr	r1, .L88+24
	ldr	r0, .L88+28
	mov	lr, pc
	bx	r5
	bl	goToGame
	ldr	r3, .L88+32
	mov	lr, pc
	bx	r3
.L76:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L87:
	ldr	r5, .L88+36
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L88+40
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2592
	ldr	r2, .L88+44
	ldr	r1, .L88+48
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L88+52
	ldr	r1, .L88+56
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #3504
	mov	r2, #100663296
	ldr	r1, .L88+60
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L88+64
	ldr	r1, .L88+68
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #139
	mov	r2, #120
.L85:
	mov	ip, #49
	ldr	r0, .L88+72
	mov	r3, #512
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	strh	ip, [r0, #4]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	b	.L76
.L86:
	ldr	r5, .L88+36
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L88+76
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2112
	ldr	r2, .L88+44
	ldr	r1, .L88+80
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L88+52
	ldr	r1, .L88+84
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #3104
	mov	r2, #100663296
	ldr	r1, .L88+88
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L88+64
	ldr	r1, .L88+92
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #139
	mov	r2, #175
	b	.L85
.L89:
	.align	2
.L88:
	.word	oldButtons
	.word	buttons
	.word	instructionsNum
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1641000
	.word	MainGameTheme
	.word	initGame
	.word	DMANow
	.word	STATE_instructions3Pal
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
	ldr	r4, .L132
	ldrh	r3, [r4]
	ldr	r5, .L132+4
	tst	r3, #64
	ldr	r2, [r5]
	and	r3, r3, #128
	beq	.L91
	ldr	r1, .L132+8
	ldrh	r1, [r1]
	ands	r0, r1, #64
	bne	.L91
	cmp	r2, #0
	beq	.L92
	cmp	r3, #0
	str	r0, [r5]
	beq	.L95
	tst	r1, #128
	bne	.L95
.L94:
	mov	r3, #1
	str	r3, [r5]
.L99:
	mov	r1, #121
	mov	r2, #124
	ldr	r3, .L132+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L100:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L132+12
	mov	r0, #3
	ldr	r6, .L132+16
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L90
	ldr	r3, .L132+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L90
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L131
	ldr	r3, .L132+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L91:
	cmp	r3, #0
	beq	.L98
	ldr	r3, .L132+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L98
	cmp	r2, #0
	beq	.L94
.L97:
	mov	r3, #0
	str	r3, [r5]
.L95:
	mov	r1, #89
	mov	r2, #124
	ldr	r3, .L132+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L100
.L98:
	cmp	r2, #0
	bne	.L99
	b	.L95
.L90:
	pop	{r4, r5, r6, lr}
	bx	lr
.L131:
	ldr	r3, .L132+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L92:
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r5]
	beq	.L99
	tst	r1, #128
	beq	.L97
	b	.L99
.L133:
	.align	2
.L132:
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
	ldr	r2, .L136
	ldr	r3, .L136+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r2, #4608
	ldr	r3, .L136+8
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	mov	r2, #83886080
	strh	r4, [r1, #20]	@ movhi
	mov	r3, #256
	strh	r4, [r1, #22]	@ movhi
	mov	r0, #3
	ldr	r4, .L136+12
	ldr	r1, .L136+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L136+20
	ldr	r2, .L136+24
	ldr	r1, .L136+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L136+32
	ldr	r1, .L136+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #97
	mov	r2, #98
	mov	ip, #49
	ldr	r0, .L136+40
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
	ldr	r3, .L136+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L137:
	.align	2
.L136:
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
	ldr	r2, .L140
	push	{r4, lr}
	ldr	r3, .L140+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #4608
	ldr	r2, .L140+8
	ldr	r4, .L140+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L140+16
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #15296
	ldr	r2, .L140+20
	ldr	r1, .L140+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L140+28
	ldr	r1, .L140+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #97
	mov	r2, #130
	mov	ip, #49
	ldr	r0, .L140+36
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
	ldr	r3, .L140+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L141:
	.align	2
.L140:
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
	push	{r4, lr}
	ldr	r3, .L151
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L143
	ldr	r3, .L151+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L149
.L143:
	ldr	r3, .L151+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L150
	pop	{r4, lr}
	bx	lr
.L150:
	ldr	r3, .L151+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToWin
.L149:
	ldr	r3, .L151+24
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L143
.L152:
	.align	2
.L151:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	fitted
	.word	stopSound
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
	ldr	r3, .L166
	mov	lr, pc
	bx	r3
	ldr	fp, .L166+4
	ldr	r5, .L166+8
	ldr	r10, .L166+12
	ldr	r9, .L166+16
	ldr	r8, .L166+20
	ldr	r7, .L166+24
	ldr	r6, .L166+28
	ldr	r4, .L166+32
.L154:
	ldrh	r2, [fp]
	strh	r2, [r5]	@ movhi
	ldr	r3, [r10]
	ldrh	r1, [r4, #48]
	strh	r1, [fp]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L154
.L157:
	.word	.L156
	.word	.L158
	.word	.L159
	.word	.L160
	.word	.L161
.L161:
	tst	r2, #8
	beq	.L154
	ldr	r3, .L166+36
	mov	lr, pc
	bx	r3
	b	.L154
.L160:
	mov	lr, pc
	bx	r6
	b	.L154
.L158:
	mov	lr, pc
	bx	r8
	b	.L154
.L156:
	mov	lr, pc
	bx	r9
	b	.L154
.L159:
	mov	lr, pc
	bx	r7
	b	.L154
.L167:
	.align	2
.L166:
	.word	initialize
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
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	instructionsNum,4,4
	.comm	cursor,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
