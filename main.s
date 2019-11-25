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
	push	{r4, lr}
	ldr	r2, .L8
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
	mov	r3, #16384
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+24
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
	mov	r4, #0
	ldr	r2, .L19
	ldr	r3, .L19+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L19+8
	orr	r3, r3, #4352
	strh	r1, [r2, #8]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #16]	@ movhi
	mov	r3, #256
	strh	r4, [r2, #18]	@ movhi
	ldr	r1, .L19+12
	ldr	r4, .L19+16
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1600
	ldr	r2, .L19+20
	ldr	r1, .L19+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L19+28
	ldr	r1, .L19+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #97
	mov	r2, #98
	ldr	r0, .L19+36
	ldr	ip, .L19+40
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
	ldr	r3, .L19+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
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
	ldr	r0, .L23
	push	{r4, lr}
	ldr	r3, .L23+4
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+8
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L23+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #192
	mov	r2, #100663296
	ldr	r1, .L23+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L23+20
	ldr	r1, .L23+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #48
	ldr	r2, .L23+28
	ldr	r1, .L23+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L23+36
	ldr	r1, .L23+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L23+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
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
	ldr	r4, .L67
	ldr	r5, .L67+4
	ldr	r2, [r4]
	ldrh	r3, [r5]
	ldr	r6, .L67+8
	add	r2, r2, #1
	tst	r3, #64
	str	r2, [r4]
	and	r3, r3, #128
	ldr	r2, [r6]
	beq	.L26
	ldr	r1, .L67+12
	ldrh	r1, [r1]
	ands	r0, r1, #64
	bne	.L26
	cmp	r2, #0
	beq	.L27
	cmp	r3, #0
	str	r0, [r6]
	beq	.L30
	tst	r1, #128
	bne	.L30
.L29:
	mov	r3, #1
	str	r3, [r6]
.L34:
	mov	r1, #129
	mov	r2, #98
	ldr	r3, .L67+16
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L35:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L67+16
	mov	r0, #3
	ldr	r7, .L67+20
	mov	lr, pc
	bx	r7
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L25
	ldr	r3, .L67+12
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L25
	ldr	r3, [r6]
	cmp	r3, #0
	ldr	r0, [r4]
	ldr	r3, .L67+24
	beq	.L66
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToInstructions
.L26:
	cmp	r3, #0
	beq	.L33
	ldr	r3, .L67+12
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L33
	cmp	r2, #0
	beq	.L29
.L32:
	mov	r3, #0
	str	r3, [r6]
.L30:
	mov	r1, #97
	mov	r2, #98
	ldr	r3, .L67+16
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L35
.L33:
	cmp	r2, #0
	bne	.L34
	b	.L30
.L25:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToGame
.L27:
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r6]
	beq	.L34
	tst	r1, #128
	beq	.L32
	b	.L34
.L68:
	.align	2
.L67:
	.word	seed
	.word	oldButtons
	.word	cursor
	.word	buttons
	.word	shadowOAM
	.word	DMANow
	.word	srand
	.size	start, .-start
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions.part.1, %function
instructions.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L75
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToGame
	ldr	r3, .L75+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	buttons
	.word	initGame
	.size	instructions.part.1, .-instructions.part.1
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
	ldr	r3, .L79
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instructions.part.1
.L80:
	.align	2
.L79:
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L123
	ldrh	r3, [r4]
	ldr	r5, .L123+4
	tst	r3, #64
	ldr	r2, [r5]
	and	r3, r3, #128
	beq	.L82
	ldr	r1, .L123+8
	ldrh	r1, [r1]
	ands	r0, r1, #64
	bne	.L82
	cmp	r2, #0
	beq	.L83
	cmp	r3, #0
	str	r0, [r5]
	beq	.L86
	tst	r1, #128
	bne	.L86
.L85:
	mov	r3, #1
	str	r3, [r5]
.L90:
	mov	r1, #121
	mov	r2, #124
	ldr	r3, .L123+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L91:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L123+12
	mov	r0, #3
	ldr	r6, .L123+16
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L81
	ldr	r3, .L123+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L81
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L122
	pop	{r4, r5, r6, lr}
	b	goToStart
.L82:
	cmp	r3, #0
	beq	.L89
	ldr	r3, .L123+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L89
	cmp	r2, #0
	beq	.L85
.L88:
	mov	r3, #0
	str	r3, [r5]
.L86:
	mov	r1, #89
	mov	r2, #124
	ldr	r3, .L123+12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L91
.L89:
	cmp	r2, #0
	bne	.L90
	b	.L86
.L81:
	pop	{r4, r5, r6, lr}
	bx	lr
.L122:
	pop	{r4, r5, r6, lr}
	b	goToGame
.L83:
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r5]
	beq	.L90
	tst	r1, #128
	beq	.L88
	b	.L90
.L124:
	.align	2
.L123:
	.word	oldButtons
	.word	cursor
	.word	buttons
	.word	shadowOAM
	.word	DMANow
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
	ldr	r2, .L127
	ldr	r3, .L127+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L127+8
	orr	r3, r3, #4352
	strh	r1, [r2, #8]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #16]	@ movhi
	mov	r3, #256
	strh	r4, [r2, #18]	@ movhi
	ldr	r1, .L127+12
	ldr	r4, .L127+16
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L127+20
	ldr	r2, .L127+24
	ldr	r1, .L127+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L127+32
	ldr	r1, .L127+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #97
	mov	r2, #98
	ldr	r0, .L127+40
	ldr	ip, .L127+44
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
	ldr	r3, .L127+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L128:
	.align	2
.L127:
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
	ldr	r2, .L131
	push	{r4, lr}
	ldr	r3, .L131+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r3]
	ldr	r1, .L131+8
	orr	r2, r2, #4352
	ldr	r4, .L131+12
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L131+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1104
	ldr	r2, .L131+20
	ldr	r1, .L131+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L131+28
	ldr	r1, .L131+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L131+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L131+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L132:
	.align	2
.L131:
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
	ldr	r3, .L142
	mov	lr, pc
	bx	r3
	ldr	r3, .L142+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L142+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L134
	ldr	r3, .L142+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L140
.L134:
	ldr	r3, .L142+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L141
	pop	{r4, lr}
	bx	lr
.L141:
	pop	{r4, lr}
	b	goToWin
.L140:
	bl	goToPause
	b	.L134
.L143:
	.align	2
.L142:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	fitted
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
	ldr	r8, .L160+16
	ldr	r9, .L160+20
	ldr	r7, .L160+24
	ldr	r6, .L160+28
	ldr	r4, .L160+32
.L145:
	ldrh	r0, [fp]
	strh	r0, [r5]	@ movhi
	ldr	r2, [r10]
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L145
.L148:
	.word	.L147
	.word	.L149
	.word	.L150
	.word	.L151
	.word	.L152
.L152:
	tst	r0, #8
	beq	.L145
	tst	r3, #8
	bne	.L145
	ldr	r3, .L160+36
	mov	lr, pc
	bx	r3
	b	.L145
.L151:
	mov	lr, pc
	bx	r6
	b	.L145
.L149:
	tst	r0, #8
	beq	.L145
	mov	lr, pc
	bx	r9
	b	.L145
.L147:
	mov	lr, pc
	bx	r8
	b	.L145
.L150:
	mov	lr, pc
	bx	r7
	b	.L145
.L161:
	.align	2
.L160:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	instructions.part.1
	.word	game
	.word	pause
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	cursor,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
