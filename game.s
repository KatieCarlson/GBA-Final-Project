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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L65
	ldrh	r1, [r3, #48]
	ldr	r6, .L65+4
	ldr	lr, .L65+8
	ldr	r5, .L65+12
	ldr	r10, .L65+16
	ands	ip, r1, #64
	sub	sp, sp, #28
	str	r2, [lr]
	str	r2, [r5]
	ldr	r1, [r6, #8]
	ldr	r0, [r6, #12]
	ldrh	r3, [r10]
	bne	.L23
	ldr	r7, [r6]
	cmp	r7, r2
	movle	r2, ip
	ble	.L23
	sub	r4, r1, #1
	lsl	r9, r4, #8
	add	ip, r9, r0
	ldr	r8, .L65+20
	lsl	ip, ip, #1
	ldrh	r2, [r8, ip]
	cmp	r2, #0
	beq	.L23
	ldr	r2, [r6, #24]
	add	r2, r9, r2
	add	r2, r2, r0
	add	r2, r8, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	beq	.L23
	cmp	r7, #79
	movgt	r2, #0
	movle	r2, #1
	mvn	ip, #0
	cmp	r3, #0
	moveq	r2, #0
	mov	r1, r4
	str	r4, [r6, #8]
	str	ip, [lr]
	rsb	r2, r2, #0
.L23:
	ldr	ip, .L65
	ldrh	ip, [ip, #48]
	tst	ip, #128
	bne	.L62
	ldr	r7, [r6]
	ldr	ip, [r6, #28]
	add	r4, r7, ip
	cmp	r4, #320
	blt	.L26
.L62:
	lsl	r2, r2, #16
	lsr	r2, r2, #16
.L25:
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r10]	@ movhi
	ldr	ip, .L65
	ldrh	ip, [ip, #48]
	ldr	lr, .L65+24
	ands	ip, ip, #32
	ldrh	r4, [lr]
	movne	ip, #0
	bne	.L29
	ldr	r7, [r6, #4]
	cmp	r7, #0
	ble	.L29
	sub	r8, r0, #1
	add	ip, r8, r1, lsl #8
	ldr	r9, .L65+20
	lsl	ip, ip, #1
	ldrh	ip, [r9, ip]
	cmp	ip, #0
	beq	.L29
	ldr	ip, [r6, #28]
	add	ip, r1, ip
	sub	ip, ip, #1
	add	ip, r8, ip, lsl #8
	lsl	ip, ip, #1
	ldrh	ip, [r9, ip]
	cmp	ip, #0
	beq	.L29
	cmp	r7, #119
	movgt	ip, #0
	movle	ip, #1
	mvn	lr, #0
	cmp	r4, #0
	moveq	ip, #0
	mov	r0, r8
	str	r8, [r6, #12]
	str	lr, [r5]
	rsb	ip, ip, #0
.L29:
	ldr	lr, .L65
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L64
	ldr	fp, [r6, #4]
	ldr	lr, [r6, #24]
	add	r8, fp, lr
	cmp	r8, #239
	ble	.L32
.L64:
	lsl	ip, ip, #16
	lsr	ip, ip, #16
.L31:
	ldr	lr, .L65+28
	add	ip, ip, r4
	add	r3, r3, r2
	ldrh	lr, [lr]
	lsl	r2, ip, #16
	lsl	r3, r3, #16
	ldr	ip, .L65+24
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	tst	lr, #2
	strh	r2, [ip]	@ movhi
	strh	r3, [r10]	@ movhi
	beq	.L35
	ldr	ip, .L65+32
	ldrh	ip, [ip]
	ands	ip, ip, #2
	bne	.L35
	str	ip, [sp, #20]
	ldr	r4, .L65+36
	ldr	r9, .L65+40
.L40:
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L41
	mov	r7, #0
	mov	r8, #8
	mov	fp, #1
	ldr	r5, .L65+36
.L39:
	mov	r3, #1
	ldr	r2, [r5, #68]
	ldr	ip, [r4, #16]
	ldr	lr, [r4, #20]
	add	ip, ip, r2
	ldr	r2, [r5, #72]
	add	r2, lr, r2
	stm	sp, {r2, ip}
	str	r8, [sp, #12]
	str	r8, [sp, #8]
	mov	r2, r3
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	add	r7, r7, #1
	beq	.L37
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldr	r3, [sp, #20]
	moveq	r3, fp
	str	r3, [r4, #4]
.L37:
	ldr	r3, [r4]
	cmp	r3, r7
	add	r5, r5, #44
	ldr	r1, [r6, #8]
	ldr	r0, [r6, #12]
	bgt	.L39
.L41:
	ldr	r3, .L65+44
	add	r4, r4, #288
	cmp	r3, r4
	bne	.L40
	ldr	r2, .L65+24
	ldrh	r3, [r10]
	ldrh	r2, [r2]
.L35:
	sub	r1, r1, r3
	sub	r0, r0, r2
	str	r1, [r6]
	str	r0, [r6, #4]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L26:
	add	ip, ip, r1
	lsl	ip, ip, #8
	add	r8, ip, r0
	ldr	r9, .L65+20
	lsl	r8, r8, #1
	ldrh	r4, [r9, r8]
	cmp	r4, #0
	beq	.L62
	ldr	r4, [r6, #24]
	add	ip, ip, r4
	add	r4, ip, r0
	add	r4, r9, r4, lsl #1
	ldrh	ip, [r4, #-2]
	cmp	ip, #0
	beq	.L62
	cmp	r7, #80
	movle	ip, #0
	movgt	ip, #1
	cmp	r3, #352
	mov	r4, #1
	movcs	ip, #0
	add	r1, r1, r4
	cmp	ip, #0
	str	r1, [r6, #8]
	str	r4, [lr]
	movne	r2, r4
	beq	.L62
	b	.L25
.L32:
	add	lr, lr, r0
	add	r9, lr, r1, lsl #8
	ldr	r8, .L65+20
	lsl	r9, r9, #1
	ldrh	r9, [r8, r9]
	cmp	r9, #0
	beq	.L64
	ldr	r9, [r6, #28]
	add	r9, r1, r9
	sub	r9, r9, #1
	add	lr, lr, r9, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r8, lr]
	cmp	lr, #0
	lsleq	lr, ip, #16
	lsreq	ip, lr, #16
	beq	.L31
	cmp	fp, #120
	movle	r7, #0
	movgt	r7, #1
	cmp	r4, #15
	mov	lr, #1
	movhi	r7, #0
	add	r0, r0, lr
	cmp	r7, #0
	str	r0, [r6, #12]
	str	lr, [r5]
	movne	ip, lr
	beq	.L64
	b	.L31
.L66:
	.align	2
.L65:
	.word	67109120
	.word	player
	.word	vselDel
	.word	hselDel
	.word	vOff
	.word	collisionmapBitmap
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	pieceParents
	.word	collision
	.word	pieceParents+1152
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, .L69
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
	ldr	r1, .L69+4
	ldr	r0, [r3]
	orr	r3, r2, lr, lsl #12
	orr	r2, ip, #16384
	strh	r3, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L70:
	.align	2
.L69:
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
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #128
	mov	r2, #128
	ldr	r1, .L75
	ldr	r3, .L75+4
	mov	r0, sp
	mov	lr, pc
	bx	r3
	mov	r5, #1
	mov	r2, sp
	mov	r1, #0
	mov	ip, #8
	ldr	r0, .L75+8
	ldr	r3, .L75+12
	ldr	r0, [r0]
	add	r6, sp, #128
.L72:
	ldm	r2, {r4, lr}
	add	r2, r2, #8
	cmp	r2, r6
	str	r0, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r1, [r3, #32]
	str	r5, [r3, #36]
	str	ip, [r3, #40]
	str	r1, [r3, #44]
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	add	r0, r0, #1
	add	r3, r3, #52
	bne	.L72
	add	sp, sp, #128
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.word	memcpy
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
	ldr	ip, .L79
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
.L80:
	.align	2
.L79:
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
	ldr	r2, .L82
	ldr	r3, .L82+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	ip, [r0, #8]
	ldr	r1, [r0, #12]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	stm	r0, {r2, r3}
	bx	lr
.L83:
	.align	2
.L82:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #0
	mov	r5, #16
	mov	r0, r7
	mov	r10, #4
	mov	r9, #25
	mov	ip, #8
	ldr	r2, .L90
	ldr	r3, .L90+4
	ldrh	r8, [r2]
	ldrh	r6, [r3]
	ldr	r1, .L90+8
	rsb	r8, r8, #200
	rsb	r6, r6, #128
.L86:
	mov	r3, r1
	mov	r2, #0
	sub	lr, r5, #7
	add	r4, r7, #30
	str	r10, [r1]
	str	r0, [r1, #4]
	str	r9, [r1, #16]
	str	r5, [r1, #20]
	str	r8, [r1, #8]
	str	r6, [r1, #12]
	str	r0, [r1, #24]
	str	r0, [r1, #28]
	str	r0, [r1, #52]
	str	r0, [r1, #60]
	str	lr, [r1, #56]
	str	r4, [r1, #64]
.L85:
	str	r2, [r3, #68]
	add	lr, r2, r4
	add	r2, r2, #1
	cmp	r2, #4
	str	r0, [r3, #72]
	str	ip, [r3, #84]
	str	ip, [r3, #88]
	str	lr, [r3, #108]
	add	r3, r3, #44
	bne	.L85
	add	r5, r5, #1
	cmp	r5, #20
	add	r1, r1, #288
	add	r6, r6, #8
	add	r7, r7, #10
	bne	.L86
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	vOff
	.word	hOff
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
	ble	.L94
	mov	r3, r0
	mov	ip, #0
	add	r1, r0, #52
	ldm	r1, {r1, r4}
	ldr	r2, [r0, #60]
	add	r4, r4, r1, lsl #5
	orr	r4, r4, r2, lsl #12
	lsl	r4, r4, #16
	ldrh	r7, [r0, #8]
	ldrh	r8, [r0, #12]
	ldr	r5, .L99
	lsr	r4, r4, #16
.L96:
	ldr	r2, [r3, #108]
	add	r0, r3, #68
	ldm	r0, {r0, r1}
	lsl	r2, r2, #3
	add	ip, ip, #1
	add	lr, r5, r2
	add	r0, r7, r0, lsl #3
	add	r1, r8, r1, lsl #3
	cmp	ip, r6
	strh	r0, [r5, r2]	@ movhi
	strh	r1, [lr, #2]	@ movhi
	strh	r4, [lr, #4]	@ movhi
	add	r3, r3, #44
	bne	.L96
.L94:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L100:
	.align	2
.L99:
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
	ldr	r3, .L105
	ldr	ip, .L105+4
	add	r6, r3, #832
.L102:
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
	bne	.L102
	ldr	r0, .L105+8
	bl	drawPieceParent
	ldr	r0, .L105+12
	bl	drawPieceParent
	ldr	r0, .L105+16
	bl	drawPieceParent
	ldr	r0, .L105+20
	bl	drawPieceParent
	mov	r3, #67108864
	ldr	r2, .L105+24
	ldrh	r0, [r2]
	ldr	r1, .L105+28
	strh	r0, [r3, #20]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #22]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #24]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #26]	@ movhi
	ldr	r3, .L105+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L105+36
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L105+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	board
	.word	shadowOAM
	.word	pieceParents
	.word	pieceParents+288
	.word	pieceParents+576
	.word	pieceParents+864
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
	ldr	r2, .L112
	ldr	r3, .L112+4
	push	{r4, lr}
	ldr	lr, [r0, #4]
	ldr	ip, [r0, #16]
	ldr	r1, [r0, #20]
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	cmp	lr, #1
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	ldr	ip, [r0, #24]
	ldr	r1, [r0, #28]
	beq	.L111
	add	r2, r2, ip
	add	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	pop	{r4, lr}
	bx	lr
.L111:
	ldr	r4, .L112+8
	ldr	lr, .L112+12
	ldr	r4, [r4]
	ldr	lr, [lr]
	add	ip, ip, r4
	add	r1, r1, lr
	add	r2, ip, r2
	add	r3, r1, r3
	str	r2, [r0, #8]
	str	ip, [r0, #24]
	str	r3, [r0, #12]
	str	r1, [r0, #28]
	pop	{r4, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	vOff
	.word	hOff
	.word	vselDel
	.word	hselDel
	.size	updatePieceParent, .-updatePieceParent
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
	ldr	r1, .L118
	ldr	r2, .L118+4
	ldr	r3, .L118+8
	ldrh	lr, [r1]
	ldrh	ip, [r2]
	add	r0, r3, #832
.L115:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	rsb	r1, lr, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	stm	r3, {r1, r2}
	add	r3, r3, #52
	cmp	r0, r3
	bne	.L115
	ldr	r0, .L118+12
	bl	updatePieceParent
	ldr	r0, .L118+16
	bl	updatePieceParent
	ldr	r0, .L118+20
	bl	updatePieceParent
	ldr	r0, .L118+24
	pop	{r4, lr}
	b	updatePieceParent
.L119:
	.align	2
.L118:
	.word	vOff
	.word	hOff
	.word	board
	.word	pieceParents
	.word	pieceParents+288
	.word	pieceParents+576
	.word	pieceParents+864
	.size	updateGame, .-updateGame
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	hselDel,4,4
	.comm	vselDel,4,4
	.global	boardSpriteNumStart
	.comm	pieceParents,1152,4
	.comm	board,832,4
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
	.word	42
	.word	19
	.word	42
	.word	20
	.word	43
	.word	17
	.word	43
	.word	18
	.word	43
	.word	19
	.word	43
	.word	20
	.word	44
	.word	17
	.word	44
	.word	18
	.word	44
	.word	19
	.word	44
	.word	20
	.word	45
	.word	17
	.word	45
	.word	18
	.word	45
	.word	19
	.word	45
	.word	20
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	boardSpriteNumStart, %object
	.size	boardSpriteNumStart, 4
boardSpriteNumStart:
	.word	1
	.ident	"GCC: (devkitARM release 47) 7.1.0"
