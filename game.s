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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	lr, #16
	mov	r1, #1
	mov	r4, #3
	ldr	r0, .L4+20
	ldr	r3, .L4+24
	ldrh	ip, [r0]
	ldrh	r0, [r3]
	ldr	r3, .L4+28
	add	ip, ip, #72
	add	r0, r0, #112
	str	r4, [r3, #48]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r1, [r3, #64]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	vOff
	.word	hOff
	.word	player
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L20
	ldr	r3, .L20+4
	ldr	r5, [r4, #32]
	smull	r0, r1, r5, r3
	asr	r3, r5, #31
	rsb	r3, r3, r1, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r2, [r4, #36]
	bne	.L7
	ldr	r0, [r4, #44]
	ldr	r3, .L20+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L7:
	ldr	r3, .L20+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L20+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L20+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L10
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	beq	.L13
.L12:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L10:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L19
.L13:
	mov	r3, #2
	str	r3, [r4, #36]
	b	.L12
.L19:
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L12
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	ldrh	r2, [r3, #48]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L49+4
	ldr	lr, .L49+8
	ands	r2, r2, #64
	ldr	ip, [r1, #8]
	ldr	r0, [r1, #12]
	ldrh	r5, [lr]
	movne	r2, #0
	bne	.L23
	ldr	r4, [r1]
	cmp	r4, #0
	ble	.L23
	sub	r7, ip, #1
	lsl	r3, r7, #8
	add	r2, r3, r0
	ldr	r8, .L49+12
	lsl	r2, r2, #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	beq	.L23
	ldr	r2, [r1, #24]
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r8, r3, lsl #1
	ldrh	r2, [r3, #-2]
	cmp	r2, #0
	beq	.L23
	cmp	r4, #79
	movgt	r2, #0
	movle	r2, #1
	cmp	r5, #0
	moveq	r2, #0
	mov	ip, r7
	str	r7, [r1, #8]
	rsb	r2, r2, #0
.L23:
	ldr	r3, .L49
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L46
	ldr	r8, [r1]
	ldr	r3, [r1, #28]
	add	r6, r8, r3
	cmp	r6, #320
	blt	.L26
.L46:
	lsl	r2, r2, #16
	lsr	r6, r2, #16
.L25:
	add	r5, r6, r5
	lsl	r5, r5, #16
	lsr	r5, r5, #16
	strh	r5, [lr]	@ movhi
	ldr	r3, .L49
	ldrh	r3, [r3, #48]
	ldr	r4, .L49+16
	ands	r3, r3, #32
	ldrh	r7, [r4]
	movne	r3, #0
	bne	.L29
	ldr	r9, [r1, #4]
	cmp	r9, #0
	ble	.L29
	sub	r10, r0, #1
	add	r3, r10, ip, lsl #8
	ldr	fp, .L49+12
	lsl	r3, r3, #1
	ldrh	r3, [fp, r3]
	cmp	r3, #0
	beq	.L29
	ldr	r8, [r1, #28]
	add	r8, ip, r8
	sub	r8, r8, #1
	add	r8, r10, r8, lsl #8
	lsl	r8, r8, #1
	ldrh	r3, [fp, r8]
	cmp	r3, #0
	beq	.L29
	cmp	r9, #119
	movgt	r3, #0
	movle	r3, #1
	cmp	r7, #0
	moveq	r3, #0
	mov	r0, r10
	str	r10, [r1, #12]
	rsb	r3, r3, #0
.L29:
	ldr	r2, .L49
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L48
	ldr	fp, [r1, #4]
	ldr	r2, [r1, #24]
	add	r9, fp, r2
	cmp	r9, #239
	bgt	.L48
	add	r2, r2, r0
	add	r10, r2, ip, lsl #8
	ldr	r9, .L49+12
	lsl	r10, r10, #1
	ldrh	r10, [r9, r10]
	cmp	r10, #0
	beq	.L47
	ldr	r10, [r1, #28]
	add	r10, ip, r10
	sub	r10, r10, #1
	add	r2, r2, r10, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r9, r2]
	cmp	r2, #0
	beq	.L47
	cmp	fp, #120
	movle	r8, #0
	movgt	r8, #1
	cmp	r7, #15
	movhi	r8, #0
	add	r0, r0, #1
	cmp	r8, #0
	str	r0, [r1, #12]
	movne	r3, #1
	bne	.L31
.L47:
	lsl	r2, r3, #16
	lsr	r3, r2, #16
	b	.L31
.L48:
	lsl	r3, r3, #16
	lsr	r3, r3, #16
.L31:
	add	r3, r3, r7
	add	r2, r5, r6
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	sub	r0, r0, r3
	sub	ip, ip, r2
	strh	r3, [r4]	@ movhi
	strh	r2, [lr]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	str	r0, [r1, #4]
	str	ip, [r1]
	b	animatePlayer
.L26:
	add	r3, r3, ip
	lsl	r3, r3, #8
	add	r6, r3, r0
	ldr	r7, .L49+12
	lsl	r6, r6, #1
	ldrh	r6, [r7, r6]
	cmp	r6, #0
	beq	.L46
	ldr	r6, [r1, #24]
	add	r3, r3, r6
	add	r3, r3, r0
	add	r3, r7, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L46
	cmp	r8, #80
	movle	r4, #0
	movgt	r4, #1
	cmp	r5, #352
	movcs	r4, #0
	cmp	r4, #0
	add	ip, ip, #1
	lsleq	r6, r2, #16
	str	ip, [r1, #8]
	lsreq	r6, r6, #16
	movne	r6, #1
	b	.L25
.L50:
	.align	2
.L49:
	.word	67109120
	.word	player
	.word	vOff
	.word	collisionmapBitmap
	.word	hOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	ldr	r1, .L57
	ldr	r2, .L57+4
	ldr	r3, .L57+8
	ldrh	r0, [r1]
	ldrh	ip, [r2]
	add	lr, r3, #260
.L52:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	rsb	r1, r0, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	stm	r3, {r1, r2}
	add	r3, r3, #52
	cmp	r3, lr
	bne	.L52
	ldr	r3, .L57+12
	add	lr, r3, #240
.L53:
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	rsb	r1, r0, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	add	r3, r3, #60
	cmp	r3, lr
	bne	.L53
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	vOff
	.word	hOff
	.word	board
	.word	pieceParents
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L61
	ldr	r0, [r3, #44]
	ldr	ip, [r3, #28]
	ldr	r2, [r3, #36]
	ldr	r1, [r3, #24]
	push	{r4, lr}
	mul	lr, ip, r0
	mul	r4, r1, r2
	cmp	lr, #0
	add	ip, lr, #7
	movge	r0, lr
	movlt	r0, ip
	cmp	r4, #0
	add	r1, r4, #7
	movge	r1, r4
	ldr	ip, [r3, #56]
	ldr	r2, [r3, #60]
	add	r0, ip, r0, asr #3
	add	r2, r2, r1, asr #3
	ldr	lr, [r3, #64]
	ldr	ip, [r3, #4]
	add	r2, r2, r0, lsl #5
	ldr	r1, .L61+4
	ldr	r0, [r3]
	orr	r3, r2, lr, lsl #12
	orr	r2, ip, #16384
	strh	r3, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBoard
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoard, %function
initBoard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #40
	mov	r4, sp
	ldr	r5, .L67
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	r5, {r0, r1}
	mov	ip, #0
	stm	r4, {r0, r1}
	mov	lr, #8
	mov	r6, #1
	mov	r1, sp
	ldr	r3, .L67+4
	ldr	r2, [r3]
	ldr	r3, .L67+8
	add	r5, r2, #5
.L64:
	str	r2, [r3, #48]
	ldr	r4, [r1]
	ldr	r0, [r1, #4]
	add	r2, r2, #1
	cmp	r2, r5
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r6, [r3, #36]
	str	lr, [r3, #40]
	str	ip, [r3, #44]
	str	r4, [r3, #8]
	str	r0, [r3, #12]
	add	r1, r1, #8
	add	r3, r3, #52
	bne	.L64
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	board
	.size	initBoard, .-initBoard
	.align	2
	.global	drawBoardSquare
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoardSquare, %function
drawBoardSquare:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r1, r0, #36
	ldm	r1, {r1, r3}
	ldr	r2, [r0, #48]
	ldr	ip, .L71
	add	r3, r3, r1, lsl #5
	ldr	r1, [r0, #44]
	str	lr, [sp, #-4]!
	lsl	r2, r2, #3
	ldr	lr, [r0]
	ldr	r0, [r0, #4]
	orr	r3, r3, r1, lsl #12
	add	r1, ip, r2
	strh	lr, [ip, r2]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L72:
	.align	2
.L71:
	.word	shadowOAM
	.size	drawBoardSquare, .-drawBoardSquare
	.align	2
	.global	updateBoardSquare
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoardSquare, %function
updateBoardSquare:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L74
	ldr	r3, .L74+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	ip, [r0, #8]
	ldr	r1, [r0, #12]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	stm	r0, {r2, r3}
	bx	lr
.L75:
	.align	2
.L74:
	.word	vOff
	.word	hOff
	.size	updateBoardSquare, .-updateBoardSquare
	.align	2
	.global	initPieceParents
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPieceParents, %function
initPieceParents:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, #0
	mov	r4, #30
	mov	r2, r5
	mov	r6, #50
	mov	r7, #4
	mov	ip, #8
	ldr	r0, .L82
.L78:
	mov	r3, r0
	mov	r1, #0
	add	lr, r5, #9
	str	r7, [r0]
	str	r2, [r0, #4]
	str	r6, [r0, #16]
	str	r6, [r0, #20]
	str	r2, [r0, #24]
	str	r2, [r0, #28]
	str	r2, [r0, #32]
	str	r2, [r0, #36]
	str	r2, [r0, #40]
	str	r2, [r0, #44]
	str	r2, [r0, #52]
	str	r5, [r0, #56]
	str	lr, [r0, #48]
.L77:
	str	r1, [r3, #60]
	add	lr, r1, r4
	add	r1, r1, #1
	cmp	r1, #4
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	ip, [r3, #76]
	str	ip, [r3, #80]
	str	r2, [r3, #84]
	str	lr, [r3, #100]
	add	r3, r3, #44
	bne	.L77
	add	r5, r5, #1
	cmp	r5, #4
	add	r0, r0, #60
	add	r6, r6, #8
	add	r4, r4, #10
	bne	.L78
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	pieceParents
	.size	initPieceParents, .-initPieceParents
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initPlayer
	bl	initBoard
	pop	{r4, lr}
	b	initPieceParents
	.size	initGame, .-initGame
	.align	2
	.global	drawPieceParent
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPieceParent, %function
drawPieceParent:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, [r0]
	cmp	r6, #0
	ble	.L86
	mov	r3, r0
	mov	ip, #0
	add	r1, r0, #44
	ldm	r1, {r1, r4}
	ldr	r2, [r0, #52]
	add	r4, r4, r1, lsl #5
	orr	r4, r4, r2, lsl #12
	lsl	r4, r4, #16
	ldrh	r7, [r0, #8]
	ldrh	r8, [r0, #12]
	ldr	r5, .L91
	lsr	r4, r4, #16
.L88:
	ldr	r2, [r3, #100]
	add	r0, r3, #60
	ldm	r0, {r0, r1}
	lsl	r2, r2, #3
	add	ip, ip, #1
	add	lr, r5, r2
	add	r0, r7, r0
	add	r1, r8, r1
	cmp	ip, r6
	strh	r0, [r5, r2]	@ movhi
	strh	r1, [lr, #2]	@ movhi
	strh	r4, [lr, #4]	@ movhi
	add	r3, r3, #44
	bne	.L88
.L86:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	shadowOAM
	.size	drawPieceParent, .-drawPieceParent
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	ldr	r3, .L97
	ldr	ip, .L97+4
	add	r6, r3, #260
.L94:
	add	r0, r3, #36
	ldm	r0, {r0, r2, r5}
	ldr	r1, [r3, #48]
	ldm	r3, {r4, lr}
	lsl	r1, r1, #3
	add	r2, r2, r0, lsl #5
	add	r3, r3, #52
	add	r0, ip, r1
	orr	r2, r2, r5, lsl #12
	cmp	r6, r3
	strh	r4, [ip, r1]	@ movhi
	strh	lr, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bne	.L94
	ldr	r0, .L97+8
	bl	drawPieceParent
	ldr	r0, .L97+12
	bl	drawPieceParent
	ldr	r0, .L97+16
	bl	drawPieceParent
	ldr	r0, .L97+20
	bl	drawPieceParent
	mov	r3, #67108864
	ldr	r2, .L97+24
	ldrh	r0, [r2]
	ldr	r1, .L97+28
	strh	r0, [r3, #20]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #22]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #24]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #26]	@ movhi
	ldr	r3, .L97+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L97+36
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L97+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	board
	.word	shadowOAM
	.word	pieceParents
	.word	pieceParents+60
	.word	pieceParents+120
	.word	pieceParents+180
	.word	hOff
	.word	vOff
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	updatePieceParent
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePieceParent, %function
updatePieceParent:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L100
	ldr	r3, .L100+4
	ldr	ip, [r0, #16]
	ldrh	r2, [r2]
	ldr	r1, [r0, #20]
	ldrh	r3, [r3]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L101:
	.align	2
.L100:
	.word	vOff
	.word	hOff
	.size	updatePieceParent, .-updatePieceParent
	.align	2
	.global	initPieceKids
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPieceKids, %function
initPieceKids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, [r0]
	cmp	r4, #0
	ble	.L102
	mov	r2, #0
	mov	ip, #8
	mov	r1, r2
	mov	r3, r0
	ldr	r0, [r0, #56]
	add	r0, r0, #3
	add	r0, r0, r0, lsl #2
	lsl	r0, r0, #1
.L104:
	str	r2, [r3, #60]
	add	lr, r0, r2
	add	r2, r2, #1
	cmp	r2, r4
	str	r1, [r3, #64]
	str	r1, [r3, #68]
	str	r1, [r3, #72]
	str	ip, [r3, #76]
	str	ip, [r3, #80]
	str	r1, [r3, #84]
	str	lr, [r3, #100]
	add	r3, r3, #44
	bne	.L104
.L102:
	pop	{r4, lr}
	bx	lr
	.size	initPieceKids, .-initPieceKids
	.comm	vOff,2,2
	.comm	hOff,2,2
	.global	boardSpriteNumStart
	.comm	pieceParents,240,4
	.comm	board,260,4
	.comm	player,68,4
	.comm	shadowOAM,1024,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	42
	.word	17
	.word	42
	.word	18
	.word	43
	.word	17
	.word	43
	.word	18
	.word	44
	.word	17
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	boardSpriteNumStart, %object
	.size	boardSpriteNumStart, 4
boardSpriteNumStart:
	.word	1
	.ident	"GCC: (devkitARM release 47) 7.1.0"
