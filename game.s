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
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L82
	ldrh	r1, [r3, #48]
	ldr	r0, .L82+4
	ldr	ip, .L82+8
	ldr	fp, .L82+12
	ands	r1, r1, #64
	sub	sp, sp, #20
	str	r2, [r0]
	str	r2, [ip]
	ldr	r5, .L82+16
	ldrh	r3, [fp]
	bne	.L23
	ldr	r6, [r5]
	cmp	r6, r2
	movle	r2, r1
	ble	.L23
	add	r4, r5, #8
	ldm	r4, {r4, r8}
	sub	r4, r4, #1
	lsl	lr, r4, #8
	add	r1, lr, r8
	ldr	r7, .L82+20
	lsl	r1, r1, #1
	ldrh	r2, [r7, r1]
	cmp	r2, #0
	beq	.L23
	ldr	r2, [r5, #24]
	add	lr, lr, r2
	add	lr, lr, r8
	add	lr, r7, lr, lsl #1
	ldrh	r2, [lr, #-2]
	cmp	r2, #0
	beq	.L23
	cmp	r6, #79
	movgt	r2, #0
	movle	r2, #1
	mvn	r1, #0
	cmp	r3, #0
	moveq	r2, #0
	str	r4, [r5, #8]
	str	r1, [r0]
	rsb	r2, r2, #0
.L23:
	ldr	r1, .L82
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L78
	ldr	r4, [r5]
	ldr	r1, [r5, #28]
	add	lr, r4, r1
	cmp	lr, #320
	blt	.L26
.L78:
	lsl	r2, r2, #16
	lsr	r2, r2, #16
.L25:
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp]	@ movhi
	ldr	r1, .L82
	ldrh	r1, [r1, #48]
	ldr	r0, .L82+24
	ands	r1, r1, #32
	ldrh	lr, [r0]
	movne	r1, #0
	bne	.L29
	ldr	r6, [r5, #4]
	cmp	r6, #0
	ble	.L29
	ldr	r4, [r5, #12]
	ldr	r8, [r5, #8]
	sub	r4, r4, #1
	add	r0, r4, r8, lsl #8
	ldr	r7, .L82+20
	lsl	r0, r0, #1
	ldrh	r1, [r7, r0]
	cmp	r1, #0
	beq	.L29
	ldr	r1, [r5, #28]
	add	r1, r8, r1
	sub	r1, r1, #1
	add	r1, r4, r1, lsl #8
	lsl	r1, r1, #1
	ldrh	r1, [r7, r1]
	cmp	r1, #0
	beq	.L29
	cmp	r6, #119
	movgt	r1, #0
	movle	r1, #1
	mvn	r0, #0
	cmp	lr, #0
	moveq	r1, #0
	str	r4, [r5, #12]
	str	r0, [ip]
	rsb	r1, r1, #0
.L29:
	ldr	r0, .L82
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L80
	ldr	r7, [r5, #4]
	ldr	r0, [r5, #24]
	add	r4, r7, r0
	cmp	r4, #239
	ble	.L32
.L80:
	lsl	r1, r1, #16
	lsr	r1, r1, #16
.L31:
	ldr	r0, .L82+28
	add	r1, r1, lr
	add	r3, r3, r2
	ldrh	r0, [r0]
	lsl	r2, r1, #16
	lsl	r3, r3, #16
	ldr	r1, .L82+24
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	tst	r0, #2
	strh	r2, [r1]	@ movhi
	strh	r3, [fp]	@ movhi
	beq	.L35
	ldr	r1, .L82+32
	ldrh	r1, [r1]
	tst	r1, #2
	bne	.L35
	ldr	r4, .L82+36
.L49:
	ldr	r7, [r4, #4]
	cmp	r7, #0
	bne	.L36
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L38
	mov	r6, r4
	ldr	r8, .L82+40
	b	.L37
.L39:
	ldr	r3, [r4]
	cmp	r3, r7
	add	r6, r6, #44
	ble	.L38
.L37:
	mov	ip, #8
	mov	r3, #1
	ldr	r0, [r4, #16]
	ldr	lr, [r6, #68]
	ldr	r2, [r4, #20]
	ldr	r1, [r6, #72]
	add	lr, r0, lr
	ldr	r0, [r4, #24]
	add	r1, r2, r1
	ldr	r2, [r4, #28]
	add	r0, r0, lr, lsl #3
	add	r2, r2, r1, lsl #3
	ldr	r1, [r5, #8]
	str	r0, [sp, #4]
	ldr	r0, [r5, #12]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	ip, [sp, #8]
	mov	r2, r3
	ldr	ip, .L82+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	add	r7, r7, #1
	beq	.L39
	mov	ip, #1
	mov	r3, #0
	str	ip, [r4, #4]
	mov	r2, r8
	mov	r1, #7488
	ldr	r0, .L82+48
	ldr	ip, .L82+52
	mov	lr, pc
	bx	ip
	ldr	r3, [r4]
	cmp	r3, r7
	add	r6, r6, #44
	bgt	.L37
.L38:
	ldr	r3, .L82+56
	add	r4, r4, #288
	cmp	r3, r4
	bne	.L49
	ldr	r2, .L82+24
	ldrh	r3, [fp]
	ldrh	r2, [r2]
.L35:
	add	r0, r5, #8
	ldm	r0, {r0, r1}
	sub	r3, r0, r3
	sub	r2, r1, r2
	str	r3, [r5]
	str	r2, [r5, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L26:
	add	r6, r5, #8
	ldm	r6, {r6, lr}
	add	r1, r1, r6
	lsl	r1, r1, #8
	add	r7, r1, lr
	ldr	r8, .L82+20
	lsl	r7, r7, #1
	ldrh	r7, [r8, r7]
	cmp	r7, #0
	beq	.L78
	ldr	r7, [r5, #24]
	add	r1, r1, r7
	add	lr, r1, lr
	add	lr, r8, lr, lsl #1
	ldrh	r1, [lr, #-2]
	cmp	r1, #0
	beq	.L78
	cmp	r4, #80
	movle	r1, #0
	movgt	r1, #1
	cmp	r3, #352
	mov	lr, #1
	movcs	r1, #0
	add	r6, r6, lr
	cmp	r1, #0
	str	r6, [r5, #8]
	str	lr, [r0]
	movne	r2, lr
	beq	.L78
	b	.L25
.L32:
	add	r4, r5, #8
	ldm	r4, {r4, r6}
	add	r0, r0, r6
	add	r9, r0, r4, lsl #8
	ldr	r8, .L82+20
	lsl	r9, r9, #1
	ldrh	r9, [r8, r9]
	cmp	r9, #0
	beq	.L80
	ldr	r9, [r5, #28]
	add	r4, r4, r9
	sub	r4, r4, #1
	add	r0, r0, r4, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	lsleq	r0, r1, #16
	lsreq	r1, r0, #16
	beq	.L31
	cmp	lr, #15
	movhi	r4, #0
	movls	r4, #1
	cmp	r7, #120
	mov	r0, #1
	movle	r4, #0
	add	r6, r6, r0
	cmp	r4, #0
	str	r6, [r5, #12]
	str	r0, [ip]
	movne	r1, r0
	beq	.L80
	b	.L31
.L36:
	mov	r8, #0
	mov	r3, #0
	ldr	r2, .L82+40
	mov	r1, #2592
	ldr	r0, .L82+60
	ldr	ip, .L82+52
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	subs	r1, r8, r3
	and	r1, r1, #7
	and	r0, r3, #7
	rsbpl	r0, r1, #0
	subs	ip, r8, r2
	and	ip, ip, #7
	and	r1, r2, #7
	rsbpl	r1, ip, #0
	sub	r2, r2, r1
	ldr	ip, [r4, #72]
	ldr	r1, [r4, #20]
	add	r1, r1, ip
	add	r1, r2, r1, lsl #3
	sub	r3, r3, r0
	cmp	r1, #136
	str	r3, [r4, #24]
	str	r2, [r4, #28]
	str	r8, [r4, #4]
	beq	.L81
.L41:
	ldr	r3, .L82+64
	ldr	r8, [r3]
.L42:
	mov	r10, #0
	mov	r1, r5
	ldr	r9, .L82+36
	ldr	r6, .L82+68
.L45:
	ldr	r5, [r9]
	cmp	r5, #0
	ble	.L48
	mov	ip, r4
	mov	lr, #0
	ldr	r0, .L82+36
	ldr	r7, [r6, #12]
.L44:
	ldr	r2, [ip, #72]
	ldr	r3, [r0, #20]
	add	r3, r3, r2
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r7, r3
	add	lr, lr, #1
	bne	.L43
	ldr	r2, [ip, #68]
	ldr	r3, [r0, #16]
	add	r3, r3, r2
	ldr	r2, [r0, #24]
	add	r3, r3, r2
	ldr	r2, [r6, #8]
	cmp	r2, r3
	moveq	r10, #1
	moveq	r8, #0
.L43:
	cmp	lr, r5
	add	r0, r0, #288
	add	ip, ip, #44
	bne	.L44
.L48:
	ldr	r3, .L82+72
	add	r6, r6, #52
	cmp	r3, r6
	add	r9, r9, #288
	bne	.L45
	cmp	r10, #0
	ldrne	r3, .L82+64
	mov	r5, r1
	strne	r8, [r3]
	b	.L38
.L81:
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #68]
	add	r2, r2, r1
	add	r3, r3, r2, lsl #3
	cmp	r3, #336
	bne	.L41
	ldr	r3, .L82+64
	str	r8, [r3]
	b	.L42
.L83:
	.align	2
.L82:
	.word	67109120
	.word	vselDel
	.word	hselDel
	.word	vOff
	.word	player
	.word	collisionmapBitmap
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	pieceParents
	.word	11025
	.word	collision
	.word	BlockUpSFX
	.word	playSoundB
	.word	pieceParents+1152
	.word	BlockDownSFX
	.word	fitted
	.word	board
	.word	board+208
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
	ldr	r3, .L86
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
	ldr	r1, .L86+4
	ldr	r0, [r3]
	orr	r3, r2, lr, lsl #12
	orr	r2, ip, #16384
	strh	r3, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L87:
	.align	2
.L86:
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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #36
	mov	r5, sp
	mov	lr, ip
	mov	r4, #8
	mov	r7, #1
	ldr	r6, .L92
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldm	r6, {r0, r1, r2, r3}
	stm	r5, {r0, r1, r2, r3}
	ldr	r2, .L92+4
	ldr	r3, .L92+8
	ldr	r5, [r2]
.L89:
	add	r2, sp, ip, lsl #3
	ldr	r0, [r2, #4]
	ldr	r1, [sp, ip, lsl #3]
	add	r2, r5, ip
	add	ip, ip, #1
	cmp	ip, #4
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #32]
	str	r7, [r3, #36]
	str	r4, [r3, #40]
	str	lr, [r3, #44]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	str	r2, [r3, #48]
	add	r3, r3, #52
	bne	.L89
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L93:
	.align	2
.L92:
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
	beq	.L95
	mov	r1, #512
	ldr	r2, .L100
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L95:
	push	{r4, r5, lr}
	add	r2, r0, #40
	ldr	r5, [r0, #36]
	ldm	r2, {r2, r4}
	ldr	ip, [r0, #4]
	ldr	lr, .L100
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
.L101:
	.align	2
.L100:
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
	ldr	r2, .L103
	ldr	r3, .L103+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	ip, [r0, #8]
	ldr	r1, [r0, #12]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	stm	r0, {r2, r3}
	bx	lr
.L104:
	.align	2
.L103:
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
	ldr	r2, .L111
	ldr	r3, .L111+4
	ldrh	r9, [r2]
	ldrh	r6, [r3]
	ldr	r1, .L111+8
	rsb	r9, r9, #200
	rsb	r6, r6, #128
.L107:
	mov	r3, r1
	mov	r2, #0
	sub	lr, r5, #7
	add	r4, r7, #30
	str	fp, [r1]
	str	r0, [r1, #4]
	str	r10, [r1, #16]
	str	r5, [r1, #20]
	str	r9, [r1, #8]
	str	r6, [r1, #12]
	str	r8, [r1, #44]
	str	r8, [r1, #40]
	str	r0, [r1, #24]
	str	r0, [r1, #28]
	str	r0, [r1, #52]
	str	r0, [r1, #60]
	str	lr, [r1, #56]
	str	r4, [r1, #64]
.L106:
	str	r2, [r3, #68]
	add	lr, r2, r4
	add	r2, r2, #1
	cmp	r2, #4
	str	r0, [r3, #72]
	str	ip, [r3, #84]
	str	ip, [r3, #88]
	str	lr, [r3, #108]
	add	r3, r3, #44
	bne	.L106
	add	r5, r5, #1
	cmp	r5, #20
	add	r1, r1, #288
	add	r6, r6, #8
	add	r7, r7, #10
	bne	.L107
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L112:
	.align	2
.L111:
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
	mov	r2, #1
	push	{r4, lr}
	ldr	r3, .L115
	str	r2, [r3]
	bl	initPlayer
	bl	initBoard
	pop	{r4, lr}
	b	initPieceParents
.L116:
	.align	2
.L115:
	.word	fitted
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
	ble	.L117
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
	ldr	r5, .L124
	ldr	r8, .L124+4
	lsr	r4, r4, #16
	b	.L121
.L120:
	add	ip, ip, #1
	cmp	ip, r6
	add	r1, r1, #44
	beq	.L117
.L121:
	ldr	r3, [r1, #108]
	cmp	lr, #0
	lsl	r2, r3, #3
	strhne	r7, [r5, r2]	@ movhi
	bne	.L120
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
	bne	.L121
.L117:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L125:
	.align	2
.L124:
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
	ldr	r5, .L128
	bl	drawPlayer
	mov	r0, r5
	bl	drawBoardSquare
	add	r0, r5, #52
	bl	drawBoardSquare
	ldr	r4, .L128+4
	add	r0, r5, #104
	bl	drawBoardSquare
	add	r0, r5, #156
	bl	drawBoardSquare
	mov	r0, r4
	bl	drawPieceParent
	add	r0, r4, #288
	bl	drawPieceParent
	add	r0, r4, #576
	bl	drawPieceParent
	add	r0, r4, #864
	bl	drawPieceParent
	mov	r3, #67108864
	ldr	r2, .L128+8
	ldrh	r0, [r2]
	ldr	r1, .L128+12
	strh	r0, [r3, #24]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #26]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #28]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #30]	@ movhi
	ldr	r3, .L128+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L128+20
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L128+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L129:
	.align	2
.L128:
	.word	board
	.word	pieceParents
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
	ldr	r2, .L135
	ldr	r3, .L135+4
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
	beq	.L134
	add	r2, r2, ip
	add	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	pop	{r4, lr}
	bx	lr
.L134:
	ldr	r4, .L135+8
	ldr	lr, .L135+12
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
.L136:
	.align	2
.L135:
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
	ldr	r1, .L141
	ldr	r2, .L141+4
	ldr	r3, .L141+8
	ldrh	lr, [r1]
	ldrh	ip, [r2]
	add	r0, r3, #208
.L138:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	rsb	r1, lr, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	stm	r3, {r1, r2}
	add	r3, r3, #52
	cmp	r0, r3
	bne	.L138
	ldr	r0, .L141+12
	bl	updatePieceParent
	ldr	r0, .L141+16
	bl	updatePieceParent
	ldr	r0, .L141+20
	bl	updatePieceParent
	ldr	r0, .L141+24
	pop	{r4, lr}
	b	updatePieceParent
.L142:
	.align	2
.L141:
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
	.comm	hselDel,4,4
	.comm	vselDel,4,4
	.global	boardSpriteNumStart
	.comm	pieceParents,1152,4
	.comm	board,208,4
	.comm	player,68,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	42
	.word	17
	.word	43
	.word	17
	.word	44
	.word	17
	.word	45
	.word	17
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	boardSpriteNumStart, %object
	.size	boardSpriteNumStart, 4
boardSpriteNumStart:
	.word	100
	.ident	"GCC: (devkitARM release 47) 7.1.0"
