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
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r4, #0
	ldrh	r3, [r2]
	orr	r3, r3, #256
	ldr	r5, .L4+4
	strh	r4, [r2, #16]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #18]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2144
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L4+32
	ldr	r3, .L4+36
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	STATE_startPal
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
	push	{r4, r5, r6, lr}
	mov	r2, #5888
	mov	r5, #67108864
	ldr	r4, .L8
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L8+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #40192
	ldr	r2, .L8+8
	mov	r3, #192
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	strh	r1, [r5, #10]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+24
	mov	r3, #48
	strh	r2, [r5, #12]	@ movhi
	ldr	r1, .L8+28
	ldr	r2, .L8+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L8+36
	ldr	r1, .L8+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+44
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	clocktowerPal
	.word	7944
	.word	clocktowerTiles
	.word	100722688
	.word	clocktowerMap
	.word	-25852
	.word	cityTiles
	.word	100679680
	.word	100718592
	.word	cityMap
	.word	initGame
	.size	initialize, .-initialize
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
	ldr	r3, .L15
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L15+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L16:
	.align	2
.L15:
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #0
	ldrh	r3, [r2]
	orr	r3, r3, #256
	ldr	r4, .L19+4
	strh	r1, [r2, #16]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L19+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1600
	ldr	r2, .L19+12
	ldr	r1, .L19+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L19+20
	ldr	r1, .L19+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L19+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L19+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	hideSprites
	.word	DMANow
	.word	STATE_instructionsPal
	.word	100696064
	.word	STATE_instructionsTiles
	.word	100726784
	.word	STATE_instructionsMap
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
	push	{r4, lr}
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L23+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r0, #5632
	mov	r2, #2
	ldr	r3, .L23+12
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	hideSprites
	.word	DMANow
	.word	clocktowerPal
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L37
	ldr	r5, .L37+4
	ldr	r0, [r4]
	ldrh	r3, [r5]
	add	r0, r0, #1
	tst	r3, #1
	str	r0, [r4]
	beq	.L26
	ldr	r2, .L37+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L35
.L26:
	tst	r3, #2
	beq	.L25
	ldr	r3, .L37+8
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L36
.L25:
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	ldr	r0, [r4]
	ldr	r3, .L37+12
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L35:
	ldr	r3, .L37+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r5]
	b	.L26
.L38:
	.align	2
.L37:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	start, .-start
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions.part.2, %function
instructions.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L45
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToGame
	ldr	r3, .L45+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	buttons
	.word	initGame
	.size	instructions.part.2, .-instructions.part.2
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
	@ link register save eliminated.
	ldr	r3, .L49
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instructions.part.2
.L50:
	.align	2
.L49:
	.word	oldButtons
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
	@ link register save eliminated.
	ldr	r3, .L61
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L52
	ldr	r2, .L61+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L60
.L52:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L61+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L60:
	b	goToGame
.L62:
	.align	2
.L61:
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L65
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldrh	r3, [r2]
	orr	r3, r3, #256
	ldr	r4, .L65+4
	strh	r3, [r2]	@ movhi
	ldr	r1, .L65+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L65+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1536
	ldr	r2, .L65+16
	ldr	r1, .L65+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L65+24
	ldr	r1, .L65+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L65+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L66:
	.align	2
.L65:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	STATE_pausePal
	.word	100696064
	.word	STATE_pauseTiles
	.word	100726784
	.word	STATE_pauseMap
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
	push	{r4, lr}
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldrh	r3, [r2]
	orr	r3, r3, #256
	ldr	r4, .L69+4
	strh	r3, [r2]	@ movhi
	ldr	r1, .L69+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L69+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1104
	ldr	r2, .L69+16
	ldr	r1, .L69+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L69+24
	ldr	r1, .L69+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L69+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L70:
	.align	2
.L69:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	STATE_winPal
	.word	100696064
	.word	STATE_winTiles
	.word	100726784
	.word	STATE_winMap
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
	ldr	r3, .L83
	ldr	r4, .L83+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L72
	ldr	r2, .L83+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L81
.L72:
	tst	r3, #1
	beq	.L71
	ldr	r3, .L83+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L82
.L71:
	pop	{r4, lr}
	bx	lr
.L82:
	pop	{r4, lr}
	b	goToWin
.L81:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L72
.L84:
	.align	2
.L83:
	.word	updateGame
	.word	oldButtons
	.word	drawGame
	.word	buttons
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
	ldr	r3, .L101
	mov	lr, pc
	bx	r3
	ldr	fp, .L101+4
	ldr	r5, .L101+8
	ldr	r10, .L101+12
	ldr	r8, .L101+16
	ldr	r9, .L101+20
	ldr	r7, .L101+24
	ldr	r6, .L101+28
	ldr	r4, .L101+32
.L86:
	ldrh	r0, [fp]
	strh	r0, [r5]	@ movhi
	ldr	r2, [r10]
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L86
.L89:
	.word	.L88
	.word	.L90
	.word	.L91
	.word	.L92
	.word	.L93
.L93:
	tst	r0, #8
	beq	.L86
	tst	r3, #8
	bne	.L86
	ldr	r3, .L101+36
	mov	lr, pc
	bx	r3
	b	.L86
.L92:
	mov	lr, pc
	bx	r6
	b	.L86
.L90:
	tst	r0, #8
	beq	.L86
	mov	lr, pc
	bx	r9
	b	.L86
.L88:
	mov	lr, pc
	bx	r8
	b	.L86
.L91:
	mov	lr, pc
	bx	r7
	b	.L86
.L102:
	.align	2
.L101:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	instructions.part.2
	.word	game
	.word	pause
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
