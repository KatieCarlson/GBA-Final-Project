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
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L4+8
	orr	r3, r3, #4352
	strh	r1, [r2, #8]	@ movhi
	ldr	r5, .L4+12
	strh	r4, [r2, #16]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #18]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+20
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #97
	mov	r2, #98
	ldr	r0, .L4+40
	ldr	ip, .L4+44
	strh	r3, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	mov	r3, #512
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
	.word	4137
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
	mov	r1, #4352
	ldr	r2, .L8
	push	{r4, lr}
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #12]	@ movhi
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
	push	{r4, lr}
	mov	r4, #0
	ldr	r2, .L23
	ldr	r3, .L23+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L23+8
	orr	r3, r3, #4352
	strh	r1, [r2, #8]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #16]	@ movhi
	mov	r3, #256
	strh	r4, [r2, #18]	@ movhi
	ldr	r1, .L23+12
	ldr	r4, .L23+16
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1600
	ldr	r2, .L23+20
	ldr	r1, .L23+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L23+28
	ldr	r1, .L23+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #97
	mov	r2, #98
	ldr	r0, .L23+36
	ldr	ip, .L23+40
	strh	r3, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	mov	r3, #512
	mov	r2, #117440512
	strh	ip, [r0, #4]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L23+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	cursor
	.word	hideSprites
	.word	8072
	.word	STATE_instructionsPal
	.word	DMANow
	.word	100696064
	.word	STATE_instructionsTiles
	.word	100726784
	.word	STATE_instructionsMap
	.word	shadowOAM
	.word	4137
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
	mov	r1, #5632
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
	.word	1641600
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
	ldr	r3, .L82
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L82+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L82+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L82+12
	mov	r3, #1
	ldr	r2, .L82+16
	ldr	r1, .L82+20
	ldr	r0, .L82+24
	mov	lr, pc
	bx	r4
	bl	goToGame
	ldr	r3, .L82+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1641600
	.word	MainGameTheme
	.word	initGame
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
	ldr	r4, .L126
	ldrh	r3, [r4]
	ldr	r5, .L126+4
	tst	r3, #64
	ldr	r2, [r5]
	and	r3, r3, #128
	beq	.L85
	ldr	r1, .L126+8
	ldrh	r1, [r1]
	ands	r0, r1, #64
	bne	.L85
	cmp	r2, #0
	beq	.L86
	cmp	r3, #0
	str	r0, [r5]
	beq	.L89
	tst	r1, #128
	bne	.L89
.L88:
	mov	r3, #1
	str	r3, [r5]
.L93:
	mov	r1, #121
	mov	r2, #124
	ldr	r3, .L126+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L94:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L126+12
	mov	r0, #3
	ldr	r6, .L126+16
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L84
	ldr	r3, .L126+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L84
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L125
	ldr	r3, .L126+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L85:
	cmp	r3, #0
	beq	.L92
	ldr	r3, .L126+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L92
	cmp	r2, #0
	beq	.L88
.L91:
	mov	r3, #0
	str	r3, [r5]
.L89:
	mov	r1, #89
	mov	r2, #124
	ldr	r3, .L126+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L94
.L92:
	cmp	r2, #0
	bne	.L93
	b	.L89
.L84:
	pop	{r4, r5, r6, lr}
	bx	lr
.L125:
	ldr	r3, .L126+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L86:
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r5]
	beq	.L93
	tst	r1, #128
	beq	.L91
	b	.L93
.L127:
	.align	2
.L126:
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
	ldr	r2, .L130
	ldr	r3, .L130+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L130+8
	orr	r3, r3, #4352
	strh	r1, [r2, #8]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #16]	@ movhi
	mov	r3, #256
	strh	r4, [r2, #18]	@ movhi
	ldr	r1, .L130+12
	ldr	r4, .L130+16
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L130+20
	ldr	r2, .L130+24
	ldr	r1, .L130+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L130+32
	ldr	r1, .L130+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #97
	mov	r2, #98
	ldr	r0, .L130+40
	ldr	ip, .L130+44
	strh	r3, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	mov	r1, r0
	mov	r3, #512
	mov	r2, #117440512
	strh	ip, [r0, #4]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L130+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L131:
	.align	2
.L130:
	.word	cursor
	.word	hideSprites
	.word	8072
	.word	STATE_pausePal
	.word	DMANow
	.word	12512
	.word	100696064
	.word	STATE_pauseTiles
	.word	100726784
	.word	STATE_pauseMap
	.word	shadowOAM
	.word	4137
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
	ldr	r2, .L134
	push	{r4, lr}
	ldr	r3, .L134+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L134+8
	orr	r2, r2, #4352
	ldr	r4, .L134+12
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L134+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1104
	ldr	r2, .L134+20
	ldr	r1, .L134+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L134+28
	ldr	r1, .L134+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L134+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L134+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L135:
	.align	2
.L134:
	.word	cursor
	.word	hideSprites
	.word	7944
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
	ldr	r3, .L145
	mov	lr, pc
	bx	r3
	ldr	r3, .L145+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L145+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L137
	ldr	r3, .L145+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L143
.L137:
	ldr	r3, .L145+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L144
	pop	{r4, lr}
	bx	lr
.L144:
	ldr	r3, .L145+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToWin
.L143:
	ldr	r3, .L145+24
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L137
.L146:
	.align	2
.L145:
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
	ldr	r3, .L160
	mov	lr, pc
	bx	r3
	ldr	fp, .L160+4
	ldr	r5, .L160+8
	ldr	r10, .L160+12
	ldr	r9, .L160+16
	ldr	r8, .L160+20
	ldr	r7, .L160+24
	ldr	r6, .L160+28
	ldr	r4, .L160+32
.L148:
	ldrh	r2, [fp]
	strh	r2, [r5]	@ movhi
	ldr	r3, [r10]
	ldrh	r1, [r4, #48]
	strh	r1, [fp]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L148
.L151:
	.word	.L150
	.word	.L152
	.word	.L153
	.word	.L154
	.word	.L155
.L155:
	tst	r2, #8
	beq	.L148
	ldr	r3, .L160+36
	mov	lr, pc
	bx	r3
	b	.L148
.L154:
	mov	lr, pc
	bx	r6
	b	.L148
.L152:
	mov	lr, pc
	bx	r8
	b	.L148
.L150:
	mov	lr, pc
	bx	r9
	b	.L148
.L153:
	mov	lr, pc
	bx	r7
	b	.L148
.L161:
	.align	2
.L160:
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
	.comm	cursor,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
