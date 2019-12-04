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
	mov	lr, #32
	mov	r1, #1
	mov	r4, #3
	ldr	r0, .L4+20
	ldr	r3, .L4+24
	ldrh	ip, [r0]
	ldrh	r0, [r3]
	ldr	r3, .L4+28
	add	ip, ip, #64
	add	r0, r0, #104
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
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L24
	ldr	ip, [r3, #4]
	mvn	ip, ip, lsl #17
	push	{r4, r5, lr}
	ldr	r0, [r3, #44]
	ldr	lr, [r3, #28]
	ldr	r2, [r3, #36]
	ldr	r1, [r3, #24]
	mul	r4, lr, r0
	mul	r5, r1, r2
	cmp	r4, #0
	add	lr, r4, #7
	movge	r0, r4
	movlt	r0, lr
	cmp	r5, #0
	add	r1, r5, #7
	movge	r1, r5
	mvn	ip, ip, lsr #17
	ldr	lr, [r3, #56]
	ldr	r2, [r3, #60]
	add	r0, lr, r0, asr #3
	add	r2, r2, r1, asr #3
	ldr	lr, [r3, #64]
	ldr	r1, .L24+4
	add	r2, r2, r0, lsl #5
	ldr	r0, [r3]
	orr	r3, r2, lr, lsl #12
	strh	r3, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	turnPiece
	.syntax unified
	.arm
	.fpu softvfp
	.type	turnPiece, %function
turnPiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	sub	r3, r3, #1
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	lsl	r3, r3, #2
	add	r3, r3, #68
	add	r2, r0, r3
	ldr	r2, [r2, #4]
	ldr	ip, [r0, r3]
	str	lr, [sp, #-4]!
	add	r1, r0, #16
	sub	lr, r2, #3
	ldm	r1, {r1, r3}
	sub	r2, ip, r2
	add	lr, lr, ip
	ldr	ip, [r0]
	add	r2, r1, r2
	add	r3, r3, lr
	cmp	ip, #0
	str	r2, [r0, #16]
	str	r3, [r0, #20]
	ble	.L26
	mov	r2, #0
.L28:
	ldr	r3, [r0, #68]
	ldr	r1, [r0, #72]
	add	r2, r2, #1
	rsb	r3, r3, #3
	cmp	r2, ip
	str	r3, [r0, #72]
	str	r1, [r0, #68]
	add	r0, r0, #44
	bne	.L28
.L26:
	ldr	lr, [sp], #4
	bx	lr
	.size	turnPiece, .-turnPiece
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
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L92
	ldrh	r1, [r2]
	ldr	r4, .L92+4
	ldr	ip, .L92+8
	tst	r1, #1
	sub	sp, sp, #28
	str	r3, [r4]
	str	r3, [ip]
	beq	.L32
	ldr	r3, .L92+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L32
	ldr	r4, .L92+16
	add	r5, r4, #1152
.L34:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movgt	r0, r4
	blgt	turnPiece
.L33:
	add	r4, r4, #288
	cmp	r5, r4
	bne	.L34
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L32:
	ldr	r3, .L92+20
	ldrh	r3, [r3, #48]
	ldr	r2, .L92+24
	ands	r3, r3, #64
	ldrh	lr, [r2]
	beq	.L91
	mov	r3, #0
	ldr	fp, .L92+28
.L36:
	ldr	r2, .L92+20
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L89
	ldr	r5, [fp]
	ldr	r2, [fp, #28]
	add	r0, r5, r2
	cmp	r0, #320
	blt	.L39
.L89:
	lsl	r3, r3, #16
	lsr	r0, r3, #16
.L38:
	add	r3, r0, lr
	ldr	r2, .L92+24
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2]	@ movhi
	ldr	r2, .L92+20
	ldrh	r2, [r2, #48]
	ldr	lr, .L92+32
	ands	r2, r2, #32
	ldrh	r4, [lr]
	movne	r2, #0
	bne	.L42
	ldr	r5, [fp, #4]
	cmp	r5, #0
	ble	.L42
	add	r8, fp, #8
	ldm	r8, {r8, lr}
	sub	lr, lr, #1
	add	r7, lr, r8, lsl #8
	ldr	r6, .L92+36
	lsl	r7, r7, #1
	ldrh	r2, [r6, r7]
	cmp	r2, #0
	beq	.L42
	ldr	r2, [fp, #28]
	add	r2, r8, r2
	sub	r2, r2, #1
	add	r2, lr, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	cmp	r2, #0
	beq	.L42
	cmp	r5, #119
	movgt	r2, #0
	movle	r2, #1
	mvn	r5, #0
	cmp	r4, #0
	moveq	r2, #0
	str	lr, [fp, #12]
	str	r5, [ip]
	rsb	r2, r2, #0
.L42:
	ldr	lr, .L92+20
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L90
	ldr	r5, [fp, #4]
	ldr	lr, [fp, #24]
	add	r6, r5, lr
	cmp	r6, #239
	bgt	.L90
	add	r6, fp, #8
	ldm	r6, {r6, r8}
	add	lr, lr, r8
	add	r7, lr, r6, lsl #8
	ldr	r9, .L92+36
	lsl	r7, r7, #1
	ldrh	r7, [r9, r7]
	cmp	r7, #0
	beq	.L90
	ldr	r7, [fp, #28]
	add	r6, r6, r7
	sub	r6, r6, #1
	add	lr, lr, r6, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r9, lr]
	cmp	lr, #0
	beq	.L90
	cmp	r4, #15
	movhi	r6, #0
	movls	r6, #1
	cmp	r5, #120
	mov	lr, #1
	movle	r6, #0
	add	r8, r8, lr
	cmp	r6, #0
	str	r8, [fp, #12]
	str	lr, [ip]
	movne	r2, lr
	bne	.L44
.L90:
	lsl	r2, r2, #16
	lsr	r2, r2, #16
.L44:
	add	r4, r2, r4
	lsl	r4, r4, #16
	ldr	r2, .L92+32
	add	r3, r3, r0
	lsr	r4, r4, #16
	strh	r4, [r2]	@ movhi
	lsl	r3, r3, #16
	ldr	r2, .L92+24
	lsr	r3, r3, #16
	tst	r1, #2
	strh	r3, [r2]	@ movhi
	beq	.L48
	ldr	r2, .L92+12
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L48
	ldr	r10, .L92+16
.L62:
	ldr	r5, [r10, #4]
	cmp	r5, #0
	bne	.L49
	ldr	r3, [r10]
	cmp	r3, #0
	ble	.L51
	mov	r4, r10
	ldr	r6, .L92+40
	ldr	r8, .L92+44
	ldr	r7, .L92+48
	b	.L50
.L52:
	ldr	r3, [r10]
	cmp	r3, r5
	add	r4, r4, #44
	ble	.L51
.L50:
	mov	ip, #8
	mov	r3, #2
	ldr	r0, [r10, #16]
	ldr	lr, [r4, #68]
	ldr	r2, [r10, #20]
	ldr	r1, [r4, #72]
	add	lr, r0, lr
	ldr	r0, [r10, #24]
	add	r1, r2, r1
	ldr	r2, [r10, #28]
	add	r0, r0, lr, lsl #3
	add	r2, r2, r1, lsl #3
	ldr	r1, [fp, #8]
	str	r0, [sp, #4]
	ldr	r0, [fp, #12]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	ip, [sp, #8]
	mov	r2, r3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	add	r5, r5, #1
	beq	.L52
	mov	r3, #0
	mov	r2, r8
	mov	r1, #7488
	mov	r0, r7
	str	r5, [r10, #4]
	ldr	ip, .L92+52
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	cmp	r3, r5
	add	r4, r4, #44
	bgt	.L50
.L51:
	ldr	r3, .L92+56
	add	r10, r10, #288
	cmp	r10, r3
	bne	.L62
	ldr	r3, .L92+24
	ldr	r2, .L92+32
	ldrh	r3, [r3]
	ldrh	r4, [r2]
.L48:
	add	r1, fp, #8
	ldm	r1, {r1, r2}
	sub	r3, r1, r3
	sub	r4, r2, r4
	stm	fp, {r3, r4}
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L91:
	ldr	fp, .L92+28
	ldr	r5, [fp]
	cmp	r5, #0
	ble	.L36
	add	r2, fp, #8
	ldm	r2, {r2, r7}
	sub	r2, r2, #1
	lsl	r0, r2, #8
	add	r3, r0, r7
	ldr	r6, .L92+36
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	beq	.L36
	ldr	r3, [fp, #24]
	add	r3, r0, r3
	add	r3, r3, r7
	add	r3, r6, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L36
	cmp	r5, #79
	movgt	r3, #0
	movle	r3, #1
	cmp	lr, #0
	moveq	r3, #0
	mvn	r0, #0
	rsb	r3, r3, #0
	str	r2, [fp, #8]
	str	r0, [r4]
	b	.L36
.L39:
	ldr	r6, [fp, #8]
	ldr	r0, [fp, #12]
	add	r2, r2, r6
	lsl	r2, r2, #8
	add	r8, r2, r0
	ldr	r7, .L92+36
	lsl	r8, r8, #1
	ldrh	r8, [r7, r8]
	cmp	r8, #0
	beq	.L89
	ldr	r8, [fp, #24]
	add	r2, r2, r8
	add	r0, r2, r0
	add	r0, r7, r0, lsl #1
	ldrh	r2, [r0, #-2]
	cmp	r2, #0
	beq	.L89
	cmp	r5, #80
	movle	r2, #0
	movgt	r2, #1
	cmp	lr, #352
	movcs	r2, #0
	mov	r0, #1
	cmp	r2, #0
	add	r6, r6, r0
	str	r0, [r4]
	lsleq	r0, r3, #16
	str	r6, [fp, #8]
	lsreq	r0, r0, #16
	b	.L38
.L49:
	mov	r3, #0
	ldr	r2, .L92+44
	mov	r1, #2592
	ldr	r0, .L92+60
	ldr	ip, .L92+52
	mov	lr, pc
	bx	ip
	mov	ip, #0
	ldr	r2, [r10, #24]
	ldr	r3, [r10, #28]
	subs	r0, ip, r2
	and	r0, r0, #7
	and	r1, r2, #7
	rsbpl	r1, r0, #0
	subs	r0, ip, r3
	and	r0, r0, #7
	sub	r2, r2, r1
	and	r1, r3, #7
	rsbpl	r1, r0, #0
	ldr	r0, .L92+64
	sub	r3, r3, r1
	ldr	lr, [r0]
	str	r3, [r10, #28]
	ldr	r3, .L92+68
	cmp	lr, ip
	str	r2, [r10, #24]
	str	ip, [r10, #4]
	ldr	r9, [r3]
	ble	.L54
	str	fp, [sp, #20]
	mov	r1, ip
	mov	r0, r10
	mov	fp, lr
	ldr	r8, .L92+72
.L55:
	mov	r10, #0
	ldr	r5, .L92+16
.L61:
	ldr	r4, [r5]
	cmp	r4, #0
	ble	.L60
	ldr	lr, [r5, #28]
	add	r3, lr, #7
	cmp	lr, #0
	movlt	lr, r3
	mov	ip, r5
	ldr	r2, .L92+16
	add	r3, r4, r4, lsl #2
	add	r3, r4, r3, lsl #1
	ldr	r7, [r8, #12]
	add	r4, r2, r10
	ldr	r6, [r5, #20]
	str	r1, [sp, #16]
	asr	lr, lr, #3
	add	r4, r4, r3, lsl #2
.L57:
	ldr	r3, [ip, #72]
	add	r3, r6, r3
	add	r3, r3, lr
	cmp	r7, r3
	bne	.L56
	ldr	r2, [r5, #24]
	add	r3, r2, #7
	cmp	r2, #0
	movlt	r2, r3
	ldr	r1, [ip, #68]
	ldr	r3, [r5, #16]
	add	r3, r3, r1
	add	r3, r3, r2, asr #3
	ldr	r2, [r8, #8]
	cmp	r2, r3
	subeq	r9, r9, #1
.L56:
	add	ip, ip, #44
	cmp	r4, ip
	bne	.L57
	ldr	r1, [sp, #16]
.L60:
	add	r10, r10, #288
	cmp	r10, #1152
	add	r5, r5, #288
	bne	.L61
	add	r1, r1, #1
	cmp	r1, fp
	add	r8, r8, #52
	bne	.L55
	mov	r10, r0
	ldr	fp, [sp, #20]
.L54:
	ldr	r3, .L92+76
	str	r9, [r3]
	b	.L51
.L93:
	.align	2
.L92:
	.word	oldButtons
	.word	vselDel
	.word	hselDel
	.word	buttons
	.word	pieceParents
	.word	67109120
	.word	vOff
	.word	player
	.word	hOff
	.word	collisionmapBitmap
	.word	collision
	.word	11025
	.word	BlockUpSFX
	.word	playSoundB
	.word	pieceParents+1152
	.word	BlockDownSFX
	.word	.LANCHOR0
	.word	fittedReset
	.word	board
	.word	fitted
	.size	updatePlayer, .-updatePlayer
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
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #132
	ldr	r3, .L99
	mov	r0, sp
	mov	r2, #128
	ldr	r1, .L99+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+8
	ldr	r5, [r3]
	cmp	r5, #0
	ble	.L94
	mov	r2, sp
	mov	r0, #0
	mov	ip, #8
	mov	r7, #1
	mov	r6, #16
	ldr	r1, [r3, #4]
	ldr	r3, .L99+12
	add	r5, r5, r1
.L96:
	str	r1, [r3, #48]
	ldr	r4, [r2]
	ldr	lr, [r2, #4]
	add	r1, r1, #1
	cmp	r1, r5
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	str	r7, [r3, #36]
	str	r6, [r3, #40]
	str	r0, [r3, #44]
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	add	r2, r2, #8
	add	r3, r3, #52
	bne	.L96
.L94:
	add	sp, sp, #132
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	memcpy
	.word	.LANCHOR1
	.word	.LANCHOR0
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
	ldr	r1, [r0]
	cmp	r1, #160
	movle	r3, #0
	movgt	r3, #1
	ldr	r2, [r0, #28]
	rsb	r2, r2, #0
	cmp	r1, r2
	orrlt	r3, r3, #1
	cmp	r3, #0
	ldr	r3, [r0, #48]
	beq	.L102
	mov	r1, #512
	ldr	r2, .L107
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L102:
	push	{r4, r5, lr}
	add	r2, r0, #40
	ldr	r5, [r0, #36]
	ldm	r2, {r2, r4}
	ldr	ip, [r0, #4]
	ldr	lr, .L107
	lsl	r3, r3, #3
	lsl	r0, ip, #23
	add	r2, r2, r5, lsl #5
	add	ip, lr, r3
	orr	r2, r2, r4, lsl #12
	and	r1, r1, #255
	lsr	r0, r0, #23
	strh	r1, [lr, r3]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L108:
	.align	2
.L107:
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
	ldr	r2, .L110
	ldr	r3, .L110+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	ip, [r0, #8]
	ldr	r1, [r0, #12]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	stm	r0, {r2, r3}
	bx	lr
.L111:
	.align	2
.L110:
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #0
	mov	r5, #16
	mov	r0, r7
	mov	fp, #4
	mov	r10, #25
	mov	r8, #32
	mov	ip, #8
	ldr	r2, .L118
	ldr	r3, .L118+4
	ldrh	r9, [r2]
	ldrh	r6, [r3]
	ldr	r1, .L118+8
	rsb	r9, r9, #200
	rsb	r6, r6, #128
.L114:
	mov	r3, r1
	mov	r2, #0
	str	r5, [r1, #20]
	add	r4, r7, #30
	add	r5, r5, #1
	str	r5, [r1, #56]
	str	fp, [r1]
	str	r0, [r1, #4]
	str	r10, [r1, #16]
	str	r9, [r1, #8]
	str	r6, [r1, #12]
	str	r8, [r1, #44]
	str	r8, [r1, #40]
	str	r0, [r1, #24]
	str	r0, [r1, #28]
	str	r0, [r1, #52]
	str	r0, [r1, #60]
	str	r4, [r1, #64]
.L113:
	str	r2, [r3, #68]
	add	lr, r2, r4
	add	r2, r2, #1
	cmp	r2, #4
	str	r0, [r3, #72]
	str	ip, [r3, #84]
	str	ip, [r3, #88]
	str	lr, [r3, #108]
	add	r3, r3, #44
	bne	.L113
	cmp	r5, #20
	add	r1, r1, #288
	add	r6, r6, #8
	add	r7, r7, #10
	bne	.L114
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L119:
	.align	2
.L118:
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
	mov	r3, #0
	push	{r4, lr}
	ldr	r2, .L122
	ldr	lr, .L122+4
	ldr	r2, [r2]
	ldr	ip, .L122+8
	ldr	r0, .L122+12
	ldr	r1, .L122+16
	str	r2, [lr]
	str	r2, [ip]
	strh	r3, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	bl	initPlayer
	bl	initBoard
	pop	{r4, lr}
	b	initPieceParents
.L123:
	.align	2
.L122:
	.word	.LANCHOR0
	.word	fitted
	.word	fittedReset
	.word	vOff
	.word	hOff
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, [r0]
	cmp	r6, #0
	ble	.L124
	ldr	r4, [r0, #8]
	cmp	r4, #160
	movle	lr, #0
	movgt	lr, #1
	ldr	r3, [r0, #44]
	rsb	r3, r3, #0
	cmp	r4, r3
	orrlt	lr, lr, #1
	lsl	r4, r4, #16
	mov	r1, r0
	mov	ip, #0
	mov	r7, #512
	ldr	r5, .L131
	ldr	r8, .L131+4
	lsr	r4, r4, #16
	b	.L128
.L127:
	add	ip, ip, #1
	cmp	ip, r6
	add	r1, r1, #44
	beq	.L124
.L128:
	ldr	r3, [r1, #108]
	cmp	lr, #0
	lsl	r2, r3, #3
	strhne	r7, [r5, r2]	@ movhi
	bne	.L127
	ldr	r2, [r1, #72]
	ldr	r9, [r0, #12]
	ldr	r10, [r1, #68]
	ldr	fp, [r0, #52]
	add	r9, r9, r2, lsl #3
	ldr	r2, [r0, #56]
	add	r10, r4, r10, lsl #3
	add	r2, r2, fp, lsl #5
	ldr	fp, [r0, #60]
	lsl	r3, r3, #3
	and	r10, r10, #255
	add	ip, ip, #1
	and	r9, r9, r8
	orr	r2, r2, fp, lsl #12
	strh	r10, [r5, r3]	@ movhi
	cmp	ip, r6
	add	r3, r5, r3
	strh	r9, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	add	r1, r1, #44
	bne	.L128
.L124:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	shadowOAM
	.word	511
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
	ldr	r6, .L138
	bl	drawPlayer
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L134
	mov	r5, #0
	ldr	r4, .L138+4
.L135:
	mov	r0, r4
	bl	drawBoardSquare
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #52
	bgt	.L135
.L134:
	ldr	r0, .L138+8
	bl	drawPieceParent
	ldr	r0, .L138+12
	bl	drawPieceParent
	ldr	r0, .L138+16
	bl	drawPieceParent
	ldr	r0, .L138+20
	bl	drawPieceParent
	mov	r3, #67108864
	ldr	r2, .L138+24
	ldrh	r0, [r2]
	ldr	r1, .L138+28
	strh	r0, [r3, #24]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #26]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #28]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #30]	@ movhi
	ldr	r3, .L138+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L138+36
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L138+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L139:
	.align	2
.L138:
	.word	.LANCHOR0
	.word	board
	.word	pieceParents
	.word	pieceParents+288
	.word	pieceParents+576
	.word	pieceParents+864
	.word	hOff
	.word	vOff
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
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
	ldr	r2, .L144
	ldr	r3, .L144+4
	push	{r4, lr}
	ldr	lr, [r0, #4]
	ldr	ip, [r0, #16]
	ldr	r1, [r0, #20]
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	cmp	lr, #0
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	ldr	ip, [r0, #24]
	ldr	r1, [r0, #28]
	ble	.L141
	ldr	r4, .L144+8
	ldr	lr, .L144+12
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
.L141:
	add	r2, r2, ip
	add	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	pop	{r4, lr}
	bx	lr
.L145:
	.align	2
.L144:
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
	ldr	r3, .L151
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L147
	ldr	r1, .L151+4
	ldr	r2, .L151+8
	add	ip, r0, r0, lsl #1
	ldr	r3, .L151+12
	add	r0, r0, ip, lsl #2
	ldrh	lr, [r1]
	ldrh	ip, [r2]
	add	r0, r3, r0, lsl #2
.L148:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	rsb	r1, lr, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	stm	r3, {r1, r2}
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L148
.L147:
	ldr	r0, .L151+16
	bl	updatePieceParent
	ldr	r0, .L151+20
	bl	updatePieceParent
	ldr	r0, .L151+24
	bl	updatePieceParent
	ldr	r0, .L151+28
	pop	{r4, lr}
	b	updatePieceParent
.L152:
	.align	2
.L151:
	.word	.LANCHOR0
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
	.comm	fitted,4,4
	.comm	fittedReset,4,4
	.comm	hselDel,4,4
	.comm	vselDel,4,4
	.global	boardSpriteNumStart
	.comm	pieceParents,1152,4
	.comm	board,832,4
	.global	BOARDSQUARECOUNT
	.comm	player,68,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
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
	.set	.LANCHOR0,. + 0
	.type	BOARDSQUARECOUNT, %object
	.size	BOARDSQUARECOUNT, 4
BOARDSQUARECOUNT:
	.word	16
	.type	boardSpriteNumStart, %object
	.size	boardSpriteNumStart, 4
boardSpriteNumStart:
	.word	100
	.ident	"GCC: (devkitARM release 47) 7.1.0"
