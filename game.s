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
	mov	r4, #3
	mov	ip, #1
	ldr	r1, .L4+20
	ldr	r3, .L4+24
	ldrh	r0, [r1]
	ldrh	r1, [r3]
	ldr	r3, .L4+28
	add	r0, r0, #72
	add	r1, r1, #112
	str	r4, [r3, #48]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
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
	@ link register save eliminated.
	b	initPlayer
	.size	initGame, .-initGame
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
	ldr	r4, .L21
	ldr	r3, .L21+4
	ldr	r5, [r4, #32]
	smull	r0, r1, r5, r3
	asr	r3, r5, #31
	rsb	r3, r3, r1, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r2, [r4, #36]
	bne	.L8
	ldr	r0, [r4, #44]
	ldr	r3, .L21+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L8:
	ldr	r3, .L21+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L21+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L21+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L11
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	beq	.L14
.L13:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L20
.L14:
	mov	r3, #2
	str	r3, [r4, #36]
	b	.L13
.L20:
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L13
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
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
	ldr	r3, .L50
	ldrh	r2, [r3, #48]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L50+4
	ldr	lr, .L50+8
	ands	r2, r2, #64
	ldr	ip, [r1, #8]
	ldr	r0, [r1, #12]
	ldrh	r5, [lr]
	movne	r2, #0
	bne	.L24
	ldr	r4, [r1]
	cmp	r4, #0
	ble	.L24
	sub	r7, ip, #1
	lsl	r3, r7, #8
	add	r2, r3, r0
	ldr	r8, .L50+12
	lsl	r2, r2, #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	beq	.L24
	ldr	r2, [r1, #24]
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r8, r3, lsl #1
	ldrh	r2, [r3, #-2]
	cmp	r2, #0
	beq	.L24
	cmp	r4, #79
	movgt	r2, #0
	movle	r2, #1
	cmp	r5, #0
	moveq	r2, #0
	mov	ip, r7
	str	r7, [r1, #8]
	rsb	r2, r2, #0
.L24:
	ldr	r3, .L50
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L47
	ldr	r8, [r1]
	ldr	r3, [r1, #28]
	add	r6, r8, r3
	cmp	r6, #320
	blt	.L27
.L47:
	lsl	r2, r2, #16
	lsr	r6, r2, #16
.L26:
	add	r5, r6, r5
	lsl	r5, r5, #16
	lsr	r5, r5, #16
	strh	r5, [lr]	@ movhi
	ldr	r3, .L50
	ldrh	r3, [r3, #48]
	ldr	r4, .L50+16
	ands	r3, r3, #32
	ldrh	r7, [r4]
	movne	r3, #0
	bne	.L30
	ldr	r9, [r1, #4]
	cmp	r9, #0
	ble	.L30
	sub	r10, r0, #1
	add	r3, r10, ip, lsl #8
	ldr	fp, .L50+12
	lsl	r3, r3, #1
	ldrh	r3, [fp, r3]
	cmp	r3, #0
	beq	.L30
	ldr	r8, [r1, #28]
	add	r8, ip, r8
	sub	r8, r8, #1
	add	r8, r10, r8, lsl #8
	lsl	r8, r8, #1
	ldrh	r3, [fp, r8]
	cmp	r3, #0
	beq	.L30
	cmp	r9, #119
	movgt	r3, #0
	movle	r3, #1
	cmp	r7, #0
	moveq	r3, #0
	mov	r0, r10
	str	r10, [r1, #12]
	rsb	r3, r3, #0
.L30:
	ldr	r2, .L50
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L49
	ldr	fp, [r1, #4]
	ldr	r2, [r1, #24]
	add	r9, fp, r2
	cmp	r9, #239
	bgt	.L49
	add	r2, r2, r0
	add	r10, r2, ip, lsl #8
	ldr	r9, .L50+12
	lsl	r10, r10, #1
	ldrh	r10, [r9, r10]
	cmp	r10, #0
	beq	.L48
	ldr	r10, [r1, #28]
	add	r10, ip, r10
	sub	r10, r10, #1
	add	r2, r2, r10, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r9, r2]
	cmp	r2, #0
	beq	.L48
	cmp	fp, #120
	movle	r8, #0
	movgt	r8, #1
	cmp	r7, #15
	movhi	r8, #0
	add	r0, r0, #1
	cmp	r8, #0
	str	r0, [r1, #12]
	movne	r3, #1
	bne	.L32
.L48:
	lsl	r2, r3, #16
	lsr	r3, r2, #16
	b	.L32
.L49:
	lsl	r3, r3, #16
	lsr	r3, r3, #16
.L32:
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
.L27:
	add	r3, r3, ip
	lsl	r3, r3, #8
	add	r6, r3, r0
	ldr	r7, .L50+12
	lsl	r6, r6, #1
	ldrh	r6, [r7, r6]
	cmp	r6, #0
	beq	.L47
	ldr	r6, [r1, #24]
	add	r3, r3, r6
	add	r3, r3, r0
	add	r3, r7, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L47
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
	b	.L26
.L51:
	.align	2
.L50:
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
	@ link register save eliminated.
	b	updatePlayer
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
	ldr	r3, .L55
	ldr	r1, [r3, #44]
	ldr	ip, [r3, #28]
	ldr	r2, [r3, #36]
	ldr	r0, [r3, #24]
	push	{r4, lr}
	mul	lr, ip, r1
	mul	r4, r0, r2
	cmp	lr, #0
	add	ip, lr, #7
	add	r0, r4, #7
	movge	r1, lr
	movlt	r1, ip
	cmp	r4, #0
	movge	r2, r4
	movlt	r2, r0
	ldr	lr, [r3, #56]
	ldr	r0, [r3, #60]
	ldr	ip, [r3, #4]
	add	r1, lr, r1, asr #3
	add	r2, r0, r2, asr #3
	ldr	lr, [r3]
	ldr	r0, .L55+4
	add	r2, r2, r1, lsl #5
	orr	r3, ip, #16384
	strh	lr, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, lr}
	bl	drawPlayer
	mov	r3, #67108864
	ldr	r2, .L59
	ldrh	r0, [r2]
	ldr	r1, .L59+4
	strh	r0, [r3, #24]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #26]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #20]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #22]	@ movhi
	ldr	r3, .L59+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L59+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L59+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	hOff
	.word	vOff
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	player,64,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
