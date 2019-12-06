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
	push	{r4, r5, r6, lr}
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
	mov	lr, #100
	mov	r2, #0
	mov	r1, #1
	mov	r5, #16
	mov	r4, #3
	mov	ip, #32
	ldr	r3, .L4+20
	ldrh	r0, [r3]
	strh	lr, [r3]	@ movhi
	ldr	r3, .L4+24
	ldr	lr, .L4+28
	add	r0, r0, #164
	str	r0, [r3, #8]
	ldrh	r0, [lr]
	add	r0, r0, #144
	strh	r5, [lr]	@ movhi
	str	r4, [r3, #48]
	str	r0, [r3, #12]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r1, [r3, #64]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	pop	{r4, r5, r6, lr}
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
	.word	player
	.word	hOff
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
	push	{r4, lr}
	ldr	r1, [r3, #44]
	ldr	lr, [r3, #28]
	ldr	r2, [r3, #36]
	mul	r4, lr, r1
	ldr	r0, [r3, #24]
	mul	lr, r0, r2
	cmp	r4, #0
	add	r0, r4, #7
	movge	r0, r4
	cmp	lr, #0
	add	r1, lr, #7
	movge	r1, lr
	mvn	ip, ip, lsr #17
	ldr	lr, .L24+4
	ldr	r2, [r3, #56]
	ldr	lr, [lr]
	add	r0, r2, r0, asr #3
	ldr	r2, [r3, #60]
	add	lr, lr, lr, lsl #1
	add	r0, r0, lr, lsl #2
	add	r2, r2, r1, asr #3
	ldr	lr, [r3, #64]
	ldr	r1, .L24+8
	add	r2, r2, r0, lsl #5
	ldr	r0, [r3]
	orr	r3, r2, lr, lsl #12
	strh	r3, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.word	cheat
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
	push	{r4, r5, r6, lr}
	mov	r3, #0
	mov	r4, r0
	ldr	r2, .L32
	mov	r1, #6336
	ldr	r0, .L32+4
	ldr	r5, .L32+8
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L32+12
	ldr	r1, [r3]
	ldr	r3, .L32+16
	cmp	r1, r2
	str	r2, [r3]
	moveq	r2, #1
	ldreq	r3, .L32+20
	streq	r2, [r3]
	ldr	r3, [r4, #4]
	sub	r3, r3, #1
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	lsl	r3, r3, #2
	add	r3, r3, #68
	add	r2, r4, r3
	ldr	r1, [r2, #4]
	ldr	r3, [r4, r3]
	sub	r2, r1, #3
	add	r2, r2, r3
	ldr	ip, .L32+24
	ldr	r0, [r4, #20]
	sub	r3, r3, r1
	ldr	r1, [r4, #16]
	add	r0, r0, r2
	add	r3, r1, r3
	ldm	ip, {r2, lr}
	ldr	ip, [r4]
	ldr	r1, .L32+28
	str	r3, [r4, #16]
	ldr	r3, .L32+32
	sub	r2, r2, #32
	cmp	ip, #0
	str	r0, [r4, #20]
	str	r2, [r1]
	str	lr, [r3]
	ble	.L26
	mov	r0, r4
	mov	r2, #0
.L29:
	ldr	r3, [r0, #68]
	ldr	r1, [r0, #72]
	add	r2, r2, #1
	rsb	r3, r3, #3
	cmp	r2, ip
	str	r3, [r0, #72]
	str	r1, [r0, #68]
	add	r0, r0, #44
	bne	.L29
.L26:
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	11025
	.word	BlockTurnSFX
	.word	playSoundB
	.word	cheat
	.word	windCount
	.word	windIsOn
	.word	player
	.word	windRow
	.word	windCol
	.size	turnPiece, .-turnPiece
	.align	2
	.global	flipPiece
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPiece, %function
flipPiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r3, #0
	ldr	r2, .L43
	mov	r1, #6336
	ldr	r0, .L43+4
	ldr	r5, .L43+8
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #4]
	sub	r3, r3, #1
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #72]
	cmp	r3, #0
	mvneq	r2, #2
	beq	.L35
	cmp	r3, #1
	mvneq	r2, #0
	beq	.L35
	cmp	r3, #2
	movne	r2, #3
	moveq	r2, #1
.L35:
	ldr	r3, [r4, #20]
	ldr	r1, [r4]
	add	r3, r3, r2
	cmp	r1, #0
	str	r3, [r4, #20]
	ble	.L34
	mov	r0, r4
	mov	r2, #0
.L37:
	ldr	r3, [r0, #72]
	add	r2, r2, #1
	rsb	r3, r3, #3
	cmp	r2, r1
	str	r3, [r0, #72]
	add	r0, r0, #44
	bne	.L37
.L34:
	pop	{r4, r5, r6, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	11025
	.word	BlockTurnSFX
	.word	playSoundB
	.size	flipPiece, .-flipPiece
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #0
	mov	r7, #512
	mov	lr, #64
	ldr	r4, .L187
	ldr	r5, .L187+4
	ldr	r6, .L187+8
	sub	sp, sp, #28
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	str	ip, [sp, #4]
	str	ip, [sp]
	str	r7, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [r5]
	str	ip, [r6]
	ldr	ip, .L187+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r7, .L187+16
	beq	.L46
.L48:
	ldr	r3, [r7]
	add	r3, r3, #1
	str	r3, [r7]
.L47:
	mov	r1, #32
	mov	r0, #176
	mov	ip, #160
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	str	r1, [sp, #12]
	str	r1, [sp, #8]
	ldr	r1, [r4, #8]
	str	r0, [sp, #4]
	ldr	r0, [r4, #12]
	str	ip, [sp]
	ldr	ip, .L187+12
	mov	lr, pc
	bx	ip
	ldr	r2, .L187+20
	cmp	r0, #0
	ldrne	r3, [r2]
	ldreq	r3, .L187+24
	addne	r3, r3, #1
	streq	r0, [r3]
	strne	r3, [r2]
	ldr	r3, .L187+28
	ldr	r3, [r3]
	streq	r0, [r2]
	cmp	r3, #0
	beq	.L51
	ldr	r3, .L187+32
	ldrh	r1, [r3]
	tst	r1, #1
	bne	.L180
.L52:
	ldr	r3, [r7]
	cmp	r3, #80
	ble	.L55
	ldr	r3, .L187+36
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L53
.L55:
	tst	r1, #512
	beq	.L59
	ldr	r3, .L187+40
	ldrh	r3, [r3]
	tst	r3, #512
	bne	.L59
	ldr	r3, .L187+24
.L60:
	mov	r2, #1
	ldr	r4, .L187+44
	str	r2, [r3]
	add	r5, r4, #1872
	add	r5, r5, #8
.L63:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movgt	r0, r4
	blgt	flipPiece
.L62:
	add	r4, r4, #376
	cmp	r5, r4
	bne	.L63
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L51:
	ldr	r3, [r7]
	cmp	r3, #80
	ble	.L59
	ldr	r3, .L187+36
	ldr	r1, [r3]
	cmp	r1, #0
	bne	.L59
.L53:
	mov	r2, #1
	ldr	r4, .L187+44
	str	r2, [r3]
	add	r5, r4, #1872
	add	r5, r5, #8
.L57:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movgt	r0, r4
	blgt	turnPiece
.L56:
	add	r4, r4, #376
	cmp	r5, r4
	bne	.L57
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L59:
	ldr	r3, [r2]
	cmp	r3, #80
	bgt	.L181
.L61:
	ldr	r3, .L187+48
	ldrh	r3, [r3, #48]
	ldr	r2, .L187+52
	ands	r3, r3, #64
	ldrh	r2, [r2]
	movne	r3, #0
	bne	.L65
	ldr	r1, [r4]
	cmp	r1, #0
	ble	.L65
	add	r0, r4, #8
	ldm	r0, {r0, r8}
	sub	r0, r0, #1
	lsl	lr, r0, #8
	add	r7, lr, r8
	ldr	ip, .L187+56
	lsl	r3, r7, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L65
	add	r3, ip, r7, lsl #1
	ldrh	r3, [r3, #16]
	cmp	r3, #0
	beq	.L65
	add	r3, ip, r7, lsl #1
	ldrh	r3, [r3, #32]
	cmp	r3, #0
	beq	.L65
	add	r7, ip, r7, lsl #1
	ldrh	r3, [r7, #48]
	cmp	r3, #0
	beq	.L65
	ldr	r3, [r4, #24]
	add	r3, lr, r3
	add	r3, r3, r8
	add	ip, ip, r3, lsl #1
	ldrh	r3, [ip, #-2]
	cmp	r3, #0
	beq	.L65
	cmp	r1, #79
	movgt	r3, #0
	movle	r3, #1
	mvn	r1, #0
	cmp	r2, #0
	moveq	r3, #0
	str	r0, [r4, #8]
	str	r1, [r5]
	rsb	r3, r3, #0
.L65:
	ldr	r1, .L187+48
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L66
	ldr	r10, [r4]
	ldr	r1, [r4, #28]
	add	ip, r10, r1
	cmp	ip, #320
	bge	.L66
	add	r7, r4, #8
	ldm	r7, {r7, r8}
	add	r1, r1, r7
	lsl	r1, r1, #8
	add	lr, r1, r8
	ldr	ip, .L187+56
	lsl	r9, lr, #1
	ldrh	r9, [ip, r9]
	cmp	r9, #0
	beq	.L66
	add	r9, ip, lr, lsl #1
	ldrh	r9, [r9, #16]
	cmp	r9, #0
	beq	.L66
	add	r9, ip, lr, lsl #1
	ldrh	r9, [r9, #32]
	cmp	r9, #0
	beq	.L66
	add	lr, ip, lr, lsl #1
	ldrh	lr, [lr, #48]
	cmp	lr, #0
	beq	.L66
	ldr	lr, [r4, #24]
	add	r1, r1, lr
	add	r8, r1, r8
	add	ip, ip, r8, lsl #1
	ldrh	r1, [ip, #-2]
	cmp	r1, #0
	beq	.L66
	cmp	r10, #80
	movle	r0, #0
	movgt	r0, #1
	cmp	r2, #352
	movcs	r0, #0
	mov	r1, #1
	cmp	r0, #0
	movne	r3, r1
	add	r7, r7, r1
	str	r7, [r4, #8]
	str	r1, [r5]
.L66:
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r2, r3, r2
	lsl	r1, r2, #16
	ldr	r2, .L187+52
	lsr	r1, r1, #16
	strh	r1, [r2]	@ movhi
	ldr	r2, .L187+48
	ldrh	r2, [r2, #48]
	ands	r0, r2, #32
	ldr	r2, .L187+60
	movne	r0, #0
	ldrh	r2, [r2]
	bne	.L67
	ldr	ip, [r4, #4]
	cmp	ip, #0
	ble	.L67
	ldr	r5, [r4, #12]
	ldr	lr, [r4, #8]
	sub	r5, r5, #1
	add	r7, r5, lr, lsl #8
	ldr	r8, .L187+56
	lsl	r0, r7, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	beq	.L67
	add	r0, r7, #2048
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	beq	.L67
	add	r0, r7, #4096
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	beq	.L67
	add	r0, r7, #6144
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	beq	.L67
	ldr	r0, [r4, #28]
	add	r0, lr, r0
	sub	r0, r0, #1
	add	r0, r5, r0, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	beq	.L67
	cmp	ip, #119
	movgt	r0, #0
	movle	r0, #1
	mvn	ip, #0
	cmp	r2, #0
	moveq	r0, #0
	str	r5, [r4, #12]
	str	ip, [r6]
	rsb	r0, r0, #0
.L67:
	ldr	ip, .L187+48
	ldrh	ip, [ip, #48]
	tst	ip, #16
	bne	.L68
	ldr	fp, [r4, #4]
	ldr	r9, [r4, #24]
	add	lr, fp, r9
	cmp	lr, #239
	bgt	.L68
	add	r8, r4, #8
	ldm	r8, {r8, r10}
	add	r9, r9, r10
	add	lr, r9, r8, lsl #8
	ldr	r5, .L187+56
	lsl	r7, lr, #1
	ldrh	r7, [r5, r7]
	cmp	r7, #0
	beq	.L68
	add	r7, lr, #2048
	lsl	r7, r7, #1
	ldrh	r7, [r5, r7]
	cmp	r7, #0
	beq	.L68
	add	r7, lr, #4096
	lsl	r7, r7, #1
	ldrh	r7, [r5, r7]
	cmp	r7, #0
	beq	.L68
	add	lr, lr, #6144
	lsl	lr, lr, #1
	ldrh	lr, [r5, lr]
	cmp	lr, #0
	beq	.L68
	ldr	lr, [r4, #28]
	add	lr, r8, lr
	sub	lr, lr, #1
	add	lr, r9, lr, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r5, lr]
	cmp	lr, #0
	beq	.L68
	cmp	fp, #120
	movle	ip, #0
	movgt	ip, #1
	cmp	r2, #15
	movhi	ip, #0
	mov	lr, #1
	cmp	ip, #0
	movne	r0, lr
	add	r10, r10, lr
	str	r10, [r4, #12]
	str	lr, [r6]
.L68:
	ldr	ip, .L187+32
	add	r3, r3, r1
	ldrh	r1, [ip]
	add	r0, r2, r0
	lsl	r2, r0, #16
	tst	r1, #2
	ldr	r1, .L187+60
	lsr	r2, r2, #16
	strh	r2, [r1]	@ movhi
	lsl	r3, r3, #16
	ldr	r1, .L187+52
	lsr	r3, r3, #16
	strh	r3, [r1]	@ movhi
	beq	.L179
	ldr	r1, .L187+40
	ldrh	r1, [r1]
	ands	r6, r1, #2
	bne	.L179
	ldr	r5, .L187+44
	mov	r3, r5
.L82:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bgt	.L182
	add	r6, r6, #1
	cmp	r6, #5
	add	r3, r3, #376
	bne	.L82
	mov	r3, #0
	str	r3, [sp, #20]
	b	.L81
.L181:
	ldr	r3, .L187+24
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L61
	b	.L60
.L180:
	ldr	r3, .L187+40
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L52
	ldr	r3, .L187+36
	b	.L53
.L85:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	bne	.L96
	mov	lr, #8
	mov	r3, #2
	ldr	ip, [fp, #60]
	ldr	r2, [fp, #12]
	add	r2, r2, ip
	ldr	ip, [fp, #20]
	add	ip, ip, r2, lsl #3
	ldr	r5, [fp, #16]
	ldr	r2, [fp, #64]
	str	ip, [sp, #4]
	ldr	ip, [fp, #24]
	add	r2, r5, r2
	add	r2, ip, r2, lsl #3
	str	r2, [sp]
	str	lr, [sp, #12]
	str	lr, [sp, #8]
	mov	r2, r3
	ldr	ip, .L187+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L95
.L178:
	ldr	r3, .L187+52
	ldr	r2, .L187+60
	ldrh	r3, [r3]
	ldrh	r2, [r2]
.L179:
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
.L70:
	sub	r3, r1, r3
	sub	r2, r0, r2
	str	r3, [r4]
	str	r2, [r4, #4]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L46:
	mov	lr, #96
	mov	ip, #256
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	str	r0, [sp, #4]
	str	r0, [sp]
	ldr	r1, [r4, #8]
	str	lr, [sp, #12]
	ldr	r0, [r4, #12]
	str	ip, [sp, #8]
	ldr	ip, .L187+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L48
	ldr	r3, .L187+36
	str	r0, [r7]
	str	r0, [r3]
	b	.L47
.L182:
	mov	r3, #0
	ldr	r2, .L187+64
	mov	r1, #2592
	ldr	r0, .L187+68
	ldr	r7, .L187+72
	mov	lr, pc
	bx	r7
	mov	r2, #0
	add	r3, r6, r6, lsl #1
	rsb	r6, r6, r3, lsl #4
	ldr	r3, .L187+44
	add	r6, r3, r6, lsl #3
	add	r1, r6, #24
	ldm	r1, {r1, r3}
	subs	r0, r2, r1
	and	r0, r0, #7
	ldr	lr, .L187+76
	and	ip, r1, #7
	rsbpl	ip, r0, #0
	subs	r0, r2, r3
	and	r0, r0, #7
	ldr	lr, [lr]
	sub	r1, r1, ip
	and	ip, r3, #7
	rsbpl	ip, r0, #0
	ldr	r0, .L187+80
	sub	r3, r3, ip
	cmp	lr, r2
	str	lr, [sp, #20]
	str	r1, [r6, #24]
	str	r3, [r6, #28]
	str	r2, [r6, #4]
	ldr	fp, [r0]
	ble	.L73
	mov	r0, fp
	str	r2, [sp, #16]
	ldr	r10, .L187+84
.L74:
	mov	r7, r5
	mov	fp, #0
.L80:
	ldr	r6, [r7]
	cmp	r6, #0
	ble	.L79
	ldr	lr, [r7, #28]
	add	r3, lr, #7
	cmp	lr, #0
	movlt	lr, r3
	mov	ip, r7
	add	r3, r6, r6, lsl #2
	add	r3, r6, r3, lsl #1
	ldr	r9, [r10, #12]
	add	r6, r5, fp
	ldr	r8, [r7, #20]
	asr	lr, lr, #3
	add	r6, r6, r3, lsl #2
.L76:
	ldr	r3, [ip, #72]
	add	r3, r8, r3
	add	r3, r3, lr
	cmp	r9, r3
	bne	.L75
	ldr	r2, [r7, #24]
	add	r3, r2, #7
	cmp	r2, #0
	movlt	r2, r3
	ldr	r1, [ip, #68]
	ldr	r3, [r7, #16]
	add	r3, r3, r1
	add	r3, r3, r2, asr #3
	ldr	r2, [r10, #8]
	cmp	r2, r3
	subeq	r0, r0, #1
.L75:
	add	ip, ip, #44
	cmp	r6, ip
	bne	.L76
.L79:
	ldr	r3, .L187+88
	add	fp, fp, #376
	cmp	fp, r3
	add	r7, r7, #376
	bne	.L80
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [sp, #16]
	add	r10, r10, #52
	bne	.L74
	mov	fp, r0
.L73:
	ldr	r3, .L187+92
	str	fp, [r3]
	mov	r3, #1
	str	r3, [sp, #20]
.L81:
	ldr	fp, .L187+96
	ldr	r3, [fp]
	cmp	r3, #0
	ble	.L86
	add	r2, fp, #20
	ldm	r2, {r2, r3}
	rsbs	r0, r2, #0
	and	r0, r0, #7
	and	r1, r2, #7
	rsbpl	r1, r0, #0
	rsbs	r0, r3, #0
	and	r0, r0, #7
	and	ip, r3, #7
	sub	r2, r2, r1
	rsbpl	ip, r0, #0
	ldr	r1, [fp, #16]
	ldr	r0, [fp, #12]
	sub	r3, r3, ip
	add	r2, r2, r0, lsl #3
	add	r3, r3, r1, lsl #3
	add	r3, r3, r2, lsl #8
	ldr	r2, .L187+56
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	bne	.L183
.L86:
	ldr	r3, [sp, #20]
	cmp	r3, #1
	streq	r3, [sp, #16]
	beq	.L85
	ldr	r7, [sp, #20]
	b	.L84
.L114:
	ldr	r3, [sp, #20]
	str	r3, [sp, #16]
.L177:
	mov	r3, #1
.L89:
	add	r7, r7, #1
	cmp	r7, #4
	movgt	r3, #0
	andle	r3, r3, #1
	cmp	r3, #0
	beq	.L85
.L84:
	lsl	r9, r7, #1
	add	r3, r9, r7
	ldr	r2, .L187+44
	rsb	r3, r7, r3, lsl #4
	add	r2, r2, r3, lsl #3
	ldr	r5, [r2, #4]
	cmp	r5, #0
	bne	.L114
	ldr	r2, .L187+44
	ldr	r10, [r2, r3, lsl #3]
	cmp	r10, #0
	str	r5, [sp, #16]
	ble	.L177
.L90:
	mov	r3, #2
	mov	ip, #8
	add	r8, r9, r7
	add	r2, r5, r5, lsl r3
	rsb	r8, r7, r8, lsl #4
	ldr	r1, .L187+44
	lsl	r6, r8, #3
	add	r2, r5, r2, lsl #1
	add	r2, r6, r2, lsl r3
	add	r2, r1, r2
	add	r6, r1, r6
	add	r1, r2, #68
	ldm	r1, {r1, r2}
	ldr	r0, [r6, #16]
	add	r0, r0, r1
	add	r1, r6, #20
	ldm	r1, {r1, lr}
	add	r1, r1, r2
	ldr	r2, [r6, #28]
	add	r0, lr, r0, lsl #3
	add	r2, r2, r1, lsl #3
	ldr	r1, [r4, #8]
	str	r0, [sp, #4]
	ldr	r0, [r4, #12]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	ip, [sp, #8]
	mov	r2, r3
	ldr	ip, .L187+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	add	r5, r5, #1
	bne	.L184
	cmp	r10, r5
	bgt	.L90
	ldr	r3, [sp, #16]
	eor	r3, r3, #1
	and	r3, r3, #1
	b	.L89
.L184:
	mov	r3, #0
	str	r5, [r6, #4]
	ldr	r2, .L187+64
	mov	r1, #7488
	ldr	r0, .L187+100
	ldr	ip, .L187+72
	mov	lr, pc
	bx	ip
	ldr	r3, .L187+44
	ldr	r5, [r3, r8, lsl #3]
	add	r5, r5, #1
	cmp	r10, r5
	ble	.L185
	mov	r3, #1
	mov	r7, #5
	str	r3, [sp, #16]
	mov	r9, #10
	b	.L90
.L185:
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
.L96:
	ldr	r3, .L187+52
	ldr	r2, .L187+60
	ldrh	r3, [r3]
	ldrh	r2, [r2]
	b	.L70
.L183:
	mov	r3, #0
	ldr	r2, .L187+64
	mov	r1, #2592
	ldr	r0, .L187+68
	ldr	r5, .L187+72
	mov	lr, pc
	bx	r5
	ldr	r2, [fp, #20]
	ldr	r3, [fp, #24]
	rsbs	r0, r2, #0
	and	r0, r0, #7
	and	r1, r2, #7
	rsbpl	r1, r0, #0
	rsbs	ip, r3, #0
	sub	r2, r2, r1
	and	ip, ip, #7
	add	r1, r2, #7
	and	r0, r3, #7
	rsbpl	r0, ip, #0
	cmp	r2, #0
	movlt	ip, r1
	movge	ip, r2
	mov	r6, #0
	ldr	r1, [fp, #12]
	add	r1, r1, ip, asr #3
	sub	r3, r3, r0
	cmp	r1, #2
	str	r2, [fp, #20]
	str	r3, [fp, #24]
	str	r6, [fp]
	beq	.L186
.L87:
	ldr	r5, .L187+104
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L178
	ldr	r3, .L187+108
	mov	lr, pc
	bx	r3
	ldr	r6, .L187+112
	mov	r3, #1
	ldr	r2, .L187+64
	ldr	r1, .L187+116
	ldr	r0, .L187+120
	mov	lr, pc
	bx	r6
	mov	r3, #0
	str	r3, [r5]
	b	.L178
.L95:
	mov	ip, #1
	ldr	r1, [sp, #16]
	ldr	r0, .L187+28
	mov	r3, r1
	str	r1, [r0]
	ldr	r2, .L187+64
	mov	r1, #7488
	ldr	r0, .L187+100
	ldr	r5, .L187+72
	str	ip, [fp]
	mov	lr, pc
	bx	r5
	b	.L178
.L186:
	add	r2, r3, #7
	cmp	r3, r6
	movlt	r3, r2
	ldr	r2, [fp, #16]
	add	r3, r2, r3, asr #3
	cmp	r3, #19
	bne	.L87
	ldr	r3, .L187+108
	mov	lr, pc
	bx	r3
	ldr	r7, .L187+112
	mov	r3, #1
	ldr	r2, .L187+64
	ldr	r1, .L187+124
	ldr	r0, .L187+128
	mov	lr, pc
	bx	r7
	mov	r3, r6
	ldr	r2, .L187+64
	ldr	r1, .L187+132
	ldr	r0, .L187+136
	mov	lr, pc
	bx	r5
	mov	r3, #1
	ldr	r2, .L187+104
	ldr	r1, .L187+28
	str	r3, [r2]
	str	r3, [r1]
	b	.L178
.L188:
	.align	2
.L187:
	.word	player
	.word	vselDel
	.word	hselDel
	.word	collision
	.word	windTimer
	.word	flipTimer
	.word	hasFlipped
	.word	cheat
	.word	oldButtons
	.word	hasTurned
	.word	buttons
	.word	pieceParents
	.word	67109120
	.word	vOff
	.word	collisionmapBitmap
	.word	hOff
	.word	11025
	.word	BlockDownSFX
	.word	playSoundB
	.word	.LANCHOR0
	.word	fittedReset
	.word	board
	.word	1880
	.word	fitted
	.word	cheatBlock
	.word	BlockUpSFX
	.word	soundWasSwitched
	.word	stopSound
	.word	playSoundA
	.word	1410560
	.word	MainGameTheme
	.word	1719648
	.word	DubstepGameTheme
	.word	16363
	.word	CheatChime
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initBoard
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoard, %function
initBoard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L198
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, [r0]
	cmp	r5, #0
	ble	.L190
	mov	r2, #0
	ldmib	r0, {r4, r6}
	add	r9, r0, #428
	add	r10, r0, #220
	mov	ip, #8
	mov	r1, r2
	mov	r8, #1
	mov	r7, #16
	ldr	r3, .L198+4
	add	r0, r0, #12
	b	.L194
.L197:
	ldr	fp, [lr, #4]
	ldr	lr, [r0, r2, lsl #3]
	str	fp, [r3, #12]
	str	lr, [r3, #8]
.L192:
	add	lr, r2, r6
	add	r2, r2, #1
	cmp	r2, r5
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r1, [r3, #32]
	str	r8, [r3, #36]
	str	r7, [r3, #40]
	str	r1, [r3, #44]
	str	lr, [r3, #48]
	add	r3, r3, #52
	beq	.L190
.L194:
	cmp	r4, #0
	add	lr, r0, r2, lsl #3
	beq	.L197
	cmp	r4, #1
	addeq	lr, r10, r2, lsl #3
	addne	lr, r9, r2, lsl #3
	ldreq	fp, [lr, #4]
	ldrne	fp, [lr, #4]
	ldreq	lr, [r10, r2, lsl #3]
	ldrne	lr, [r9, r2, lsl #3]
	str	fp, [r3, #12]
	str	lr, [r3, #8]
	b	.L192
.L190:
	mov	r6, #116
	mov	r5, #96
	mov	r4, #0
	mov	lr, #22
	mov	r1, #64
	mov	ip, #2
	mov	r0, #127
	ldr	r3, .L198+8
	ldrh	r2, [r3]
	ldr	r3, .L198+12
	sub	r2, r6, r2
	str	r2, [r3, #4]
	ldr	r2, .L198+16
	ldrh	r2, [r2]
	sub	r2, r5, r2
	str	r6, [r3, #12]
	str	r5, [r3, #16]
	str	r4, [r3, #48]
	str	lr, [r3, #52]
	str	ip, [r3, #56]
	str	r0, [r3, #68]
	str	r2, [r3, #8]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L199:
	.align	2
.L198:
	.word	.LANCHOR0
	.word	board
	.word	vOff
	.word	gear
	.word	hOff
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
	ldr	r3, [r0]
	cmp	r3, #160
	movle	r2, #0
	movgt	r2, #1
	ldr	r1, [r0, #28]
	rsb	r1, r1, #0
	cmp	r3, r1
	orrlt	r2, r2, #1
	cmp	r2, #0
	ldr	r2, [r0, #48]
	beq	.L201
	mov	r1, #512
	ldr	r3, .L206
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L201:
	push	{r4, r5, lr}
	add	r1, r0, #40
	ldr	r5, [r0, #36]
	ldm	r1, {r1, r4}
	ldr	ip, [r0, #4]
	ldr	lr, .L206
	lsl	r2, r2, #3
	lsl	r0, ip, #23
	add	r1, r1, r5, lsl #5
	and	r3, r3, #255
	add	ip, lr, r2
	orr	r1, r1, r4, lsl #12
	orr	r3, r3, #1024
	lsr	r0, r0, #23
	strh	r3, [lr, r2]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L207:
	.align	2
.L206:
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
	ldr	r2, .L209
	ldr	r3, .L209+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	ip, [r0, #8]
	ldr	r1, [r0, #12]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	stm	r0, {r2, r3}
	bx	lr
.L210:
	.align	2
.L209:
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
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #30
	mov	r7, #17
	mov	r5, #0
	ldr	lr, .L224
	sub	sp, sp, #76
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #12
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	ldr	r10, .L224+4
	ldr	r4, .L224+8
	ldr	r8, .L224+12
	add	r9, r10, #20
.L216:
	ldr	r3, [r10], #4
	stm	r4, {r3, r5}
	ldr	r3, .L224+16
	mov	lr, pc
	bx	r3
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #1
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	b	.L222
.L223:
	add	r2, r3, #1
	smull	r0, r1, r2, r8
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3
.L222:
	add	r2, r3, r3, lsl #1
	lsl	r1, r2, #2
	add	r0, sp, #72
	add	r0, r0, r1
	ldr	r0, [r0, #-60]
	cmp	r0, #1
	beq	.L223
	ldr	ip, .L224+20
	add	r0, sp, #72
	add	r0, r0, r2, lsl #2
	ldrh	fp, [ip]
	add	ip, sp, #72
	add	r1, ip, r1
	mov	r2, r0
	mov	ip, #1
	mov	r3, #32
	ldr	r0, [r0, #-56]
	ldr	r2, [r2, #-52]
	str	ip, [r1, #-60]
	ldr	r1, .L224+24
	ldr	ip, [r4]
	ldrh	lr, [r1]
	str	r0, [r4, #16]
	str	r2, [r4, #20]
	rsb	r0, fp, r0, lsl #3
	rsb	r2, lr, r2, lsl #3
	cmp	ip, #0
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r5, [r4, #52]
	str	r7, [r4, #56]
	str	r5, [r4, #60]
	str	r6, [r4, #64]
	str	r0, [r4, #8]
	str	r2, [r4, #12]
	str	r3, [r4, #44]
	str	r3, [r4, #40]
	ble	.L214
	mov	r1, r6
	mov	r3, r4
	mov	r2, r9
	mov	r0, #8
	str	lr, [sp, #4]
	add	ip, ip, r6
.L215:
	ldr	lr, [r2]
	str	r1, [r3, #108]
	str	lr, [r3, #68]
	add	r1, r1, #1
	ldr	lr, [r2, #4]
	cmp	ip, r1
	str	r0, [r3, #84]
	str	r0, [r3, #88]
	str	lr, [r3, #72]
	add	r2, r2, #8
	add	r3, r3, #44
	bne	.L215
	ldr	lr, [sp, #4]
.L214:
	add	r7, r7, #1
	cmp	r7, #22
	add	r4, r4, #376
	add	r6, r6, #10
	add	r9, r9, #56
	bne	.L216
	mov	r2, #0
	mov	r1, #8
	mov	r7, #52
	mov	r6, #9
	mov	r5, #1
	mov	r4, #19
	mov	ip, #2
	mov	r0, #88
	ldr	r3, .L224+28
	rsb	fp, fp, #416
	rsb	lr, lr, #72
	stmib	r3, {fp, lr}
	str	r7, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #48]
	str	r4, [r3, #52]
	str	ip, [r3, #56]
	str	r0, [r3, #68]
	str	r2, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L225:
	.align	2
.L224:
	.word	.LANCHOR1
	.word	.LANCHOR0+636
	.word	pieceParents
	.word	1717986919
	.word	rand
	.word	vOff
	.word	hOff
	.word	cheatBlock
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
	mov	ip, #20
	ldr	r1, .L228
	push	{r4, lr}
	ldr	r2, [r1]
	str	r0, [r1, #4]
	ldr	lr, .L228+4
	ldr	r0, .L228+8
	ldr	r1, .L228+12
	str	r2, [lr]
	str	r2, [r0]
	str	r3, [r1]
	ldr	lr, .L228+16
	ldr	r0, .L228+20
	ldr	r1, .L228+24
	ldr	r2, .L228+28
	strh	r3, [lr]	@ movhi
	str	r3, [r0]
	ldr	lr, .L228+32
	str	r3, [r1]
	str	r3, [r2]
	ldr	r0, .L228+36
	ldr	r1, .L228+40
	ldr	r2, .L228+44
	ldr	r4, .L228+48
	str	r3, [lr]
	strh	r3, [r4]	@ movhi
	str	r3, [r0]
	str	r3, [r1]
	str	ip, [r2]
	bl	initPlayer
	bl	initBoard
	pop	{r4, lr}
	b	initPieceParents
.L229:
	.align	2
.L228:
	.word	.LANCHOR0
	.word	fitted
	.word	fittedReset
	.word	soundWasSwitched
	.word	hOff
	.word	windTimer
	.word	hasTurned
	.word	flipTimer
	.word	hasFlipped
	.word	cheat
	.word	windIsOn
	.word	windFrameRate
	.word	vOff
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
	ldr	r5, [r0]
	cmp	r5, #0
	ble	.L230
	ldr	r6, [r0, #8]
	cmp	r6, #160
	movle	lr, #0
	movgt	lr, #1
	ldr	r3, [r0, #44]
	rsb	r3, r3, #0
	cmp	r6, r3
	orrlt	lr, lr, #1
	lsl	r6, r6, #16
	mov	r1, r0
	mov	ip, #0
	mov	r7, #512
	ldr	r4, .L237
	ldr	r8, .L237+4
	lsr	r6, r6, #16
	b	.L234
.L233:
	add	ip, ip, #1
	cmp	ip, r5
	add	r1, r1, #44
	beq	.L230
.L234:
	ldr	r3, [r1, #108]
	cmp	lr, #0
	lsl	r2, r3, #3
	strhne	r7, [r4, r2]	@ movhi
	bne	.L233
	add	r2, r1, #68
	ldm	r2, {r2, r9}
	ldr	r10, [r0, #12]
	ldr	fp, [r0, #52]
	add	r10, r10, r9, lsl #3
	ldr	r9, [r0, #56]
	add	r2, r6, r2, lsl #3
	add	r9, r9, fp, lsl #5
	and	r2, r2, #255
	ldr	fp, [r0, #60]
	lsl	r3, r3, #3
	orr	r2, r2, #1024
	add	ip, ip, #1
	and	r10, r10, r8
	orr	r9, r9, fp, lsl #12
	strh	r2, [r4, r3]	@ movhi
	cmp	ip, r5
	add	r3, r4, r3
	strh	r10, [r3, #2]	@ movhi
	strh	r9, [r3, #4]	@ movhi
	add	r1, r1, #44
	bne	.L234
.L230:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L238:
	.align	2
.L237:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L248
	bl	drawPlayer
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L240
	mov	r5, #0
	ldr	r4, .L248+4
.L241:
	mov	r0, r4
	bl	drawBoardSquare
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #52
	bgt	.L241
.L240:
	ldr	r0, .L248+8
	bl	drawPieceParent
	ldr	r0, .L248+12
	bl	drawPieceParent
	ldr	r0, .L248+16
	bl	drawPieceParent
	ldr	r0, .L248+20
	bl	drawPieceParent
	ldr	r0, .L248+24
	bl	drawPieceParent
	ldr	r3, .L248+28
	ldr	r2, [r3, #4]
	cmp	r2, #160
	movle	r1, #0
	movgt	r1, #1
	ldr	r0, [r3, #40]
	rsb	r0, r0, #0
	cmp	r2, r0
	orrlt	r1, r1, #1
	cmp	r1, #0
	ldr	r1, [r3, #68]
	beq	.L242
	mov	r3, #512
	ldr	r7, .L248+32
	lsl	r1, r1, #3
	strh	r3, [r7, r1]	@ movhi
.L243:
	ldr	r0, .L248+36
	ldr	ip, [r0, #4]
	mvn	r3, #15
	cmp	ip, #160
	movle	lr, #0
	movgt	lr, #1
	ldr	r1, .L248+40
	ldr	r2, .L248+44
	ldr	r1, [r1]
	smull	r8, r9, r1, r2
	ldr	r4, [r0, #40]
	sub	r3, r3, r4
	cmp	ip, r3
	orrlt	lr, lr, #1
	add	r4, r1, r9
	asr	r3, r1, #31
	rsb	r3, r3, r4, asr #8
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r1, r3, lsl #3
	add	r1, r3, #180
	add	r10, r3, #90
	smull	r4, r5, r1, r2
	smull	r8, r9, r10, r2
	add	r5, r1, r5
	asr	r2, r1, #31
	add	r8, r10, r9
	rsb	r2, r2, r5, asr #8
	asr	r5, r10, #31
	rsb	r5, r5, r8, asr #8
	add	r5, r5, r5, lsl #1
	ldr	r8, .L248+48
	rsb	r5, r5, r5, lsl #4
	sub	r5, r10, r5, lsl #3
	add	r2, r2, r2, lsl #1
	ldr	r4, [r8, r5, lsl #2]
	rsb	r2, r2, r2, lsl #4
	sub	r2, r1, r2, lsl #3
	ldr	r5, [r8, r2, lsl #2]
	ldr	r1, [r6, #936]
	ldr	r2, [r8, r3, lsl #2]
	lsl	r3, r4, #16
	asr	r3, r3, #16
	cmp	lr, #0
	strh	r3, [r1, #6]	@ movhi
	strh	r3, [r1, #30]	@ movhi
	strh	r5, [r1, #14]	@ movhi
	strh	r2, [r1, #22]	@ movhi
	ldr	r3, [r0, #68]
	beq	.L244
	mov	r2, #512
	lsl	r3, r3, #3
	strh	r2, [r7, r3]	@ movhi
.L245:
	mov	r3, #67108864
	ldr	r2, .L248+52
	ldrh	r0, [r2]
	ldr	r1, .L248+56
	strh	r0, [r3, #24]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #26]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #28]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #30]	@ movhi
	ldr	r3, .L248+60
	mov	lr, pc
	bx	r3
	ldr	r4, .L248+64
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L248+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L244:
	ldr	r2, [r0, #8]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	ldr	lr, [r0, #48]
	ldr	r1, [r0, #52]
	ldr	r0, [r0, #56]
	lsl	r3, r3, #3
	and	ip, ip, #255
	add	r1, r1, lr, lsl #5
	orr	r1, r1, r0, lsl #12
	orr	ip, ip, #768
	add	r0, r7, r3
	strh	ip, [r7, r3]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	b	.L245
.L242:
	ldr	ip, [r3, #60]
	ldr	lr, [r3, #64]
	ldr	r0, [r3, #8]
	add	r2, r2, ip, lsl #3
	add	ip, r3, #52
	add	r0, r0, lr, lsl #3
	ldr	r4, [r3, #48]
	ldm	ip, {ip, lr}
	ldr	r7, .L248+32
	lsl	r1, r1, #3
	lsl	r3, r0, #23
	add	r0, ip, r4, lsl #5
	and	r2, r2, #255
	add	ip, r7, r1
	lsr	r3, r3, #23
	orr	r0, r0, lr, lsl #12
	strh	r2, [r7, r1]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r0, [ip, #4]	@ movhi
	b	.L243
.L249:
	.align	2
.L248:
	.word	.LANCHOR0
	.word	board
	.word	pieceParents
	.word	pieceParents+376
	.word	pieceParents+752
	.word	pieceParents+1128
	.word	pieceParents+1504
	.word	cheatBlock
	.word	shadowOAM
	.word	gear
	.word	gearTimer
	.word	-1240768329
	.word	sin_lut_fixed8
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
	ldr	r2, .L254
	ldr	r3, .L254+4
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
	ble	.L251
	ldr	r4, .L254+8
	ldr	lr, .L254+12
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
.L251:
	add	r2, r2, ip
	add	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	pop	{r4, lr}
	bx	lr
.L255:
	.align	2
.L254:
	.word	vOff
	.word	hOff
	.word	vselDel
	.word	hselDel
	.size	updatePieceParent, .-updatePieceParent
	.global	__aeabi_idiv
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L270
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L258
	ldr	r3, .L270+4
	ldr	r3, [r3]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L270+8
	ldr	r0, .L270+12
	ldr	r1, .L270+16
	ldr	r5, [r2]
	ldr	r7, .L270+20
	ldrh	r8, [r1]
	ldr	r4, [r0]
	add	r5, r5, #1
	str	r5, [r2]
	mov	r1, r4
	strh	r3, [r7, #2]	@ movhi
	strh	r8, [r7]	@ movhi
	mov	r0, r5
	ldr	r2, .L270+24
	mov	lr, pc
	bx	r2
	add	r4, r4, r4, lsl #1
	cmp	r5, r4, lsl #1
	moveq	r3, #0
	lsl	r0, r0, #7
	add	r0, r0, #82
	orr	r0, r0, #8192
	orreq	r8, r8, #512
	strh	r0, [r7, #4]	@ movhi
	strheq	r8, [r7]	@ movhi
	streq	r3, [r6]
.L258:
	bl	updatePlayer
	ldr	r3, .L270+28
	ldr	r0, [r3]
	cmp	r0, #0
	ldr	r5, .L270+32
	ldr	r4, .L270+36
	ble	.L260
	add	r2, r0, r0, lsl #1
	ldr	r3, .L270+40
	add	r0, r0, r2, lsl #2
	ldrh	lr, [r5]
	ldrh	ip, [r4]
	add	r0, r3, r0, lsl #2
.L261:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	rsb	r1, lr, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	stm	r3, {r1, r2}
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L261
.L260:
	ldr	r0, .L270+44
	bl	updatePieceParent
	ldr	r0, .L270+48
	bl	updatePieceParent
	ldr	r0, .L270+52
	bl	updatePieceParent
	ldr	r0, .L270+56
	bl	updatePieceParent
	ldr	r0, .L270+60
	bl	updatePieceParent
	ldr	r3, .L270+64
	ldr	r0, [r3]
	add	r1, r3, #12
	ldrh	ip, [r4]
	ldm	r1, {r1, r2}
	ldrh	lr, [r5]
	cmp	r0, #0
	rsb	r1, lr, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	ldr	r4, [r3, #20]
	ldr	r0, [r3, #24]
	ble	.L262
	ldr	r6, .L270+68
	ldr	r5, .L270+72
	ldr	r6, [r6]
	ldr	r5, [r5]
	add	r4, r4, r6
	add	r0, r0, r5
	add	r1, r4, r1
	add	r2, r0, r2
	str	r1, [r3, #4]
	str	r4, [r3, #20]
	str	r2, [r3, #8]
	str	r0, [r3, #24]
.L263:
	ldr	r4, .L270+76
	ldr	r3, .L270+80
	ldr	r2, [r4]
	add	r0, r3, #12
	ldm	r0, {r0, r1}
	add	r2, r2, #1
	cmp	r2, #360
	sub	r0, r0, lr
	sub	r1, r1, ip
	stmib	r3, {r0, r1}
	movge	r3, #0
	strlt	r2, [r4]
	strge	r3, [r4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L262:
	add	r1, r1, r4
	add	r2, r2, r0
	stmib	r3, {r1, r2}
	b	.L263
.L271:
	.align	2
.L270:
	.word	windIsOn
	.word	windCol
	.word	windCount
	.word	windFrameRate
	.word	windRow
	.word	shadowOAM+712
	.word	__aeabi_idiv
	.word	.LANCHOR0
	.word	vOff
	.word	hOff
	.word	board
	.word	pieceParents
	.word	pieceParents+376
	.word	pieceParents+752
	.word	pieceParents+1128
	.word	pieceParents+1504
	.word	cheatBlock
	.word	vselDel
	.word	hselDel
	.word	gearTimer
	.word	gear
	.size	updateGame, .-updateGame
	.global	shadowAffine
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	soundWasSwitched,4,4
	.comm	gearTimer,4,4
	.comm	gear,72,4
	.comm	cheatBlock,72,4
	.comm	windCol,4,4
	.comm	windRow,4,4
	.comm	windFrameRate,4,4
	.comm	windIsOn,4,4
	.comm	windCount,4,4
	.comm	cheat,4,4
	.comm	hasFlipped,4,4
	.comm	flipTimer,4,4
	.comm	hasTurned,4,4
	.comm	windTimer,4,4
	.comm	fitted,4,4
	.comm	fittedReset,4,4
	.comm	hselDel,4,4
	.comm	vselDel,4,4
	.global	boardSpriteNumStart
	.global	puzzleNum
	.global	tempBoardVals3
	.global	tempBoardVals2
	.global	tempBoardVals1
	.global	pieces
	.global	numOfPieces
	.comm	pieceParents,1880,4
	.comm	board,1352,4
	.global	BOARDSQUARECOUNT
	.comm	player,68,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
.LC0:
	.word	0
	.word	21
	.word	11
	.word	0
	.word	31
	.word	11
	.word	0
	.word	27
	.word	19
	.word	0
	.word	31
	.word	26
	.word	0
	.word	20
	.word	26
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	BOARDSQUARECOUNT, %object
	.size	BOARDSQUARECOUNT, 4
BOARDSQUARECOUNT:
	.word	26
	.type	puzzleNum, %object
	.size	puzzleNum, 4
puzzleNum:
	.word	1
	.type	boardSpriteNumStart, %object
	.size	boardSpriteNumStart, 4
boardSpriteNumStart:
	.word	100
	.type	tempBoardVals2, %object
	.size	tempBoardVals2, 208
tempBoardVals2:
	.word	39
	.word	18
	.word	39
	.word	19
	.word	39
	.word	20
	.word	39
	.word	21
	.word	40
	.word	18
	.word	40
	.word	19
	.word	40
	.word	20
	.word	40
	.word	21
	.word	41
	.word	18
	.word	41
	.word	19
	.word	41
	.word	20
	.word	41
	.word	21
	.word	42
	.word	18
	.word	42
	.word	19
	.word	42
	.word	20
	.word	42
	.word	21
	.word	43
	.word	18
	.word	43
	.word	19
	.word	43
	.word	20
	.word	43
	.word	21
	.word	44
	.word	17
	.word	44
	.word	18
	.word	44
	.word	19
	.word	44
	.word	20
	.word	44
	.word	21
	.word	44
	.word	22
	.type	tempBoardVals1, %object
	.size	tempBoardVals1, 208
tempBoardVals1:
	.word	40
	.word	21
	.word	40
	.word	22
	.word	40
	.word	23
	.word	40
	.word	24
	.word	40
	.word	25
	.word	41
	.word	21
	.word	41
	.word	22
	.word	41
	.word	25
	.word	42
	.word	14
	.word	42
	.word	15
	.word	42
	.word	16
	.word	42
	.word	17
	.word	42
	.word	18
	.word	42
	.word	19
	.word	42
	.word	20
	.word	42
	.word	21
	.word	42
	.word	22
	.word	42
	.word	23
	.word	42
	.word	25
	.word	43
	.word	14
	.word	43
	.word	16
	.word	43
	.word	21
	.word	43
	.word	22
	.word	43
	.word	23
	.word	43
	.word	24
	.word	43
	.word	25
	.type	tempBoardVals3, %object
	.size	tempBoardVals3, 208
tempBoardVals3:
	.word	36
	.word	18
	.word	36
	.word	19
	.word	36
	.word	20
	.word	37
	.word	18
	.word	37
	.word	20
	.word	38
	.word	17
	.word	38
	.word	18
	.word	38
	.word	19
	.word	38
	.word	20
	.word	39
	.word	20
	.word	40
	.word	20
	.word	40
	.word	21
	.word	40
	.word	22
	.word	40
	.word	23
	.word	40
	.word	24
	.word	41
	.word	20
	.word	41
	.word	21
	.word	41
	.word	22
	.word	42
	.word	20
	.word	42
	.word	21
	.word	42
	.word	22
	.word	43
	.word	21
	.word	43
	.word	21
	.word	44
	.word	19
	.word	44
	.word	20
	.word	44
	.word	21
	.type	numOfPieces, %object
	.size	numOfPieces, 20
numOfPieces:
	.word	7
	.word	7
	.word	5
	.word	2
	.word	5
	.type	pieces, %object
	.size	pieces, 280
pieces:
	.word	0
	.word	0
	.word	1
	.word	0
	.word	2
	.word	0
	.word	3
	.word	0
	.word	3
	.word	1
	.word	3
	.word	2
	.word	2
	.word	2
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	2
	.word	1
	.word	3
	.word	0
	.word	3
	.word	2
	.word	2
	.word	3
	.word	2
	.word	0
	.word	0
	.word	1
	.word	0
	.word	2
	.word	0
	.word	3
	.word	0
	.word	2
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	2
	.word	0
	.word	2
	.word	1
	.word	2
	.word	2
	.word	1
	.word	2
	.word	0
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.type	shadowAffine, %object
	.size	shadowAffine, 4
shadowAffine:
	.word	shadowOAM
	.ident	"GCC: (devkitARM release 47) 7.1.0"
