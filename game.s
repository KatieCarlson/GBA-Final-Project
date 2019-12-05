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
	mov	r4, r0
	mov	r3, #0
	ldr	r2, .L31
	mov	r1, #6336
	ldr	r0, .L31+4
	ldr	r5, .L31+8
	mov	lr, pc
	bx	r5
	mov	r0, #1
	mov	r2, #0
	ldr	r3, [r4, #4]
	sub	r3, r3, #1
	add	r1, r3, r3, lsl #2
	add	r3, r3, r1, lsl r0
	lsl	r3, r3, #2
	add	r3, r3, #68
	add	r1, r4, r3
	ldr	r1, [r1, #4]
	ldr	lr, [r4, r3]
	sub	r3, r1, #3
	ldr	ip, [r4, #16]
	sub	r1, lr, r1
	add	lr, r3, lr
	ldr	r3, [r4, #20]
	ldr	r5, .L31+12
	add	r1, ip, r1
	add	r3, r3, lr
	str	r1, [r4, #16]
	str	r3, [r4, #20]
	ldm	r5, {r1, lr}
	ldr	r3, .L31+16
	ldr	ip, [r4]
	str	r1, [r3]
	ldr	r3, .L31+20
	ldr	r1, .L31+24
	str	lr, [r3]
	ldr	r3, .L31+28
	cmp	ip, r2
	str	r2, [r1]
	str	r0, [r3]
	ble	.L26
	mov	r0, r4
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
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	11025
	.word	BlockTurnSFX
	.word	playSoundB
	.word	player
	.word	windRow
	.word	windCol
	.word	windCount
	.word	windIsOn
	.size	turnPiece, .-turnPiece
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #0
	mov	lr, #64
	mov	r7, #512
	ldr	r4, .L122
	ldr	r6, .L122+4
	ldr	r5, .L122+8
	sub	sp, sp, #36
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	str	ip, [sp, #4]
	str	ip, [sp]
	str	r7, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [r6]
	str	ip, [r5]
	ldr	ip, .L122+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L34
.L37:
	ldr	r3, .L122+16
	mov	r1, r3
	ldr	r2, .L122+20
	str	r3, [sp, #28]
	ldr	r1, [r1]
	ldr	r3, [r2]
	cmp	r1, #0
	add	r3, r3, #1
	str	r3, [r2]
	beq	.L36
.L35:
	ldr	r3, .L122+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L40
	ldr	r3, .L122+28
	ldrh	r3, [r3]
	tst	r3, #1
	ldreq	r3, .L122+32
	beq	.L43
.L40:
	ldr	r3, [r2]
.L36:
	cmp	r3, #80
	ble	.L41
	ldr	r3, .L122+32
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L41
.L43:
	mov	r2, #1
	ldr	r4, .L122+36
	str	r2, [r3]
	add	r5, r4, #1152
.L42:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movgt	r0, r4
	blgt	turnPiece
.L44:
	add	r4, r4, #288
	cmp	r5, r4
	bne	.L42
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L34:
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
	ldr	ip, .L122+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L37
	ldr	r3, .L122+16
	ldr	r1, [r3]
	str	r3, [sp, #28]
	ldr	r2, .L122+20
	ldr	r3, .L122+32
	cmp	r1, #0
	str	r0, [r2]
	str	r0, [r3]
	bne	.L35
.L41:
	ldr	r3, .L122+40
	ldrh	r3, [r3, #48]
	ldr	r2, .L122+44
	ands	r3, r3, #64
	ldrh	r2, [r2]
	movne	r3, #0
	bne	.L46
	ldr	lr, [r4]
	cmp	lr, #0
	ble	.L46
	add	r0, r4, #8
	ldm	r0, {r0, r8}
	sub	r0, r0, #1
	lsl	ip, r0, #8
	add	r3, ip, r8
	ldr	r7, .L122+48
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #0
	beq	.L46
	ldr	r3, [r4, #24]
	add	r3, ip, r3
	add	r3, r3, r8
	add	r3, r7, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L46
	cmp	lr, #79
	movgt	r3, #0
	movle	r3, #1
	mvn	r1, #0
	cmp	r2, #0
	moveq	r3, #0
	str	r0, [r4, #8]
	str	r1, [r6]
	rsb	r3, r3, #0
.L46:
	ldr	r1, .L122+40
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L47
.L113:
	lsl	r3, r3, #16
	lsr	r1, r3, #16
.L48:
	add	r3, r1, r2
	lsl	r3, r3, #16
	ldr	r2, .L122+44
	lsr	r3, r3, #16
	strh	r3, [r2]	@ movhi
	ldr	r2, .L122+40
	ldrh	r2, [r2, #48]
	ldr	r0, .L122+52
	ands	r2, r2, #32
	ldrh	ip, [r0]
	movne	r2, #0
	bne	.L52
	ldr	lr, [r4, #4]
	cmp	lr, #0
	ble	.L52
	ldr	r0, [r4, #12]
	ldr	r2, [r4, #8]
	sub	r0, r0, #1
	add	r7, r0, r2, lsl #8
	ldr	r6, .L122+48
	lsl	r7, r7, #1
	ldrh	r7, [r6, r7]
	cmp	r7, #0
	moveq	r2, r7
	beq	.L52
	ldr	r7, [r4, #28]
	add	r2, r2, r7
	sub	r2, r2, #1
	add	r2, r0, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	cmp	r2, #0
	beq	.L52
	cmp	lr, #119
	movgt	r2, #0
	movle	r2, #1
	mvn	lr, #0
	cmp	ip, #0
	moveq	r2, #0
	str	r0, [r4, #12]
	str	lr, [r5]
	rsb	r2, r2, #0
.L52:
	ldr	r0, .L122+40
	ldrh	r0, [r0, #48]
	tst	r0, #16
	beq	.L53
.L114:
	lsl	r2, r2, #16
	lsr	r2, r2, #16
.L54:
	ldr	r0, .L122+24
	add	ip, r2, ip
	ldrh	r2, [r0]
	lsl	ip, ip, #16
	tst	r2, #2
	ldr	r2, .L122+52
	add	r3, r3, r1
	lsr	ip, ip, #16
	strh	ip, [r2]	@ movhi
	lsl	r3, r3, #16
	ldr	r2, .L122+44
	lsr	r3, r3, #16
	strh	r3, [r2]	@ movhi
	bne	.L58
.L117:
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
.L59:
	sub	r3, r1, r3
	sub	r0, r0, ip
	str	r3, [r4]
	str	r0, [r4, #4]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L58:
	ldr	r2, .L122+28
	ldrh	r2, [r2]
	ands	r6, r2, #2
	bne	.L117
	ldr	r3, .L122+36
.L71:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bgt	.L118
	add	r6, r6, #1
	cmp	r6, #4
	add	r3, r3, #288
	bne	.L71
	mov	r3, #0
	str	r3, [sp, #24]
	b	.L70
.L53:
	ldr	r10, [r4, #4]
	ldr	r0, [r4, #24]
	add	r6, r10, r0
	cmp	r6, #239
	bgt	.L114
	add	r6, r4, #8
	ldm	r6, {r6, r8}
	add	r0, r0, r8
	add	r7, r0, r6, lsl #8
	ldr	r9, .L122+48
	lsl	r7, r7, #1
	ldrh	r7, [r9, r7]
	cmp	r7, #0
	beq	.L114
	ldr	r7, [r4, #28]
	add	r6, r6, r7
	sub	r6, r6, #1
	add	r0, r0, r6, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r9, r0]
	cmp	r0, #0
	beq	.L114
	cmp	r10, #120
	movle	lr, #0
	movgt	lr, #1
	cmp	ip, #15
	mov	r0, #1
	movhi	lr, #0
	add	r8, r8, r0
	cmp	lr, #0
	str	r8, [r4, #12]
	str	r0, [r5]
	movne	r2, r0
	beq	.L114
	b	.L54
.L47:
	ldr	r9, [r4]
	ldr	r1, [r4, #28]
	add	ip, r9, r1
	cmp	ip, #320
	bge	.L113
	add	ip, r4, #8
	ldm	ip, {ip, lr}
	add	r1, r1, ip
	lsl	r1, r1, #8
	add	r8, r1, lr
	ldr	r7, .L122+48
	lsl	r8, r8, #1
	ldrh	r8, [r7, r8]
	cmp	r8, #0
	beq	.L113
	ldr	r8, [r4, #24]
	add	r1, r1, r8
	add	r1, r1, lr
	add	r1, r7, r1, lsl #1
	ldrh	r1, [r1, #-2]
	cmp	r1, #0
	beq	.L113
	cmp	r9, #80
	movle	r0, #0
	movgt	r0, #1
	cmp	r2, #352
	movcs	r0, #0
	mov	r1, #1
	cmp	r0, #0
	add	ip, ip, r1
	str	r1, [r6]
	lsleq	r1, r3, #16
	str	ip, [r4, #8]
	lsreq	r1, r1, #16
	b	.L48
.L118:
	mov	r3, #0
	ldr	r2, .L122+56
	mov	r1, #2592
	ldr	r0, .L122+60
	ldr	r7, .L122+64
	mov	lr, pc
	bx	r7
	mov	r2, #0
	ldr	r3, .L122+36
	add	r6, r6, r6, lsl #3
	add	r6, r3, r6, lsl #5
	add	r1, r6, #24
	ldm	r1, {r1, r3}
	subs	r0, r2, r1
	and	r0, r0, #7
	ldr	lr, .L122+68
	and	ip, r1, #7
	rsbpl	ip, r0, #0
	subs	r0, r2, r3
	and	r0, r0, #7
	ldr	lr, [lr]
	sub	r1, r1, ip
	and	ip, r3, #7
	rsbpl	ip, r0, #0
	ldr	r0, .L122+72
	sub	r3, r3, ip
	cmp	lr, r2
	str	lr, [sp, #20]
	str	r1, [r6, #24]
	str	r3, [r6, #28]
	str	r2, [r6, #4]
	ldr	fp, [r0]
	ble	.L62
	mov	r1, r2
	ldr	r10, .L122+76
.L63:
	mov	r9, #0
	ldr	r6, .L122+36
.L69:
	ldr	lr, [r6]
	cmp	lr, #0
	ble	.L68
	ldr	ip, [r6, #28]
	add	r3, ip, #7
	cmp	ip, #0
	movlt	ip, r3
	mov	r0, r6
	ldr	r2, .L122+36
	add	r3, lr, lr, lsl #2
	add	r3, lr, r3, lsl #1
	ldr	r8, [r10, #12]
	add	lr, r2, r9
	ldr	r7, [r6, #20]
	asr	ip, ip, #3
	add	lr, lr, r3, lsl #2
.L65:
	ldr	r3, [r0, #72]
	add	r3, r7, r3
	add	r3, r3, ip
	cmp	r8, r3
	bne	.L64
	ldr	r2, [r6, #24]
	add	r3, r2, #7
	cmp	r2, #0
	movlt	r2, r3
	ldr	r5, [r0, #68]
	ldr	r3, [r6, #16]
	add	r3, r3, r5
	add	r3, r3, r2, asr #3
	ldr	r2, [r10, #8]
	cmp	r2, r3
	subeq	fp, fp, #1
.L64:
	add	r0, r0, #44
	cmp	lr, r0
	bne	.L65
.L68:
	add	r9, r9, #288
	cmp	r9, #1152
	add	r6, r6, #288
	bne	.L69
	ldr	r3, [sp, #20]
	add	r1, r1, #1
	cmp	r1, r3
	add	r10, r10, #52
	bne	.L63
.L62:
	ldr	r3, .L122+80
	str	fp, [r3]
	mov	r3, #1
	str	r3, [sp, #24]
.L70:
	ldr	fp, .L122+84
	ldr	r3, [fp]
	cmp	r3, #0
	ble	.L75
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
	ldr	r2, .L122+48
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	bne	.L119
.L75:
	ldr	r3, [sp, #24]
	cmp	r3, #1
	streq	r3, [sp, #20]
	beq	.L74
	ldr	r7, [sp, #24]
	b	.L73
.L96:
	ldr	r3, [sp, #24]
	str	r3, [sp, #20]
.L115:
	mov	r3, #1
.L77:
	add	r7, r7, #1
	cmp	r7, #3
	movgt	r3, #0
	andle	r3, r3, #1
	cmp	r3, #0
	beq	.L74
.L73:
	lsl	r9, r7, #3
	ldr	r2, .L122+36
	add	r3, r9, r7
	add	r2, r2, r3, lsl #5
	ldr	r5, [r2, #4]
	cmp	r5, #0
	bne	.L96
	ldr	r2, .L122+36
	ldr	r10, [r2, r3, lsl #5]
	cmp	r10, #0
	str	r5, [sp, #20]
	ble	.L115
.L78:
	mov	r3, #2
	mov	ip, #8
	add	r2, r5, r5, lsl r3
	add	r8, r9, r7
	ldr	r1, .L122+36
	lsl	r6, r8, #5
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
	ldr	ip, .L122+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	add	r5, r5, #1
	bne	.L120
	cmp	r10, r5
	bgt	.L78
	ldr	r3, [sp, #20]
	eor	r3, r3, #1
	and	r3, r3, #1
	b	.L77
.L120:
	mov	r3, #0
	str	r5, [r6, #4]
	ldr	r2, .L122+56
	mov	r1, #7488
	ldr	r0, .L122+88
	ldr	ip, .L122+64
	mov	lr, pc
	bx	ip
	ldr	r3, .L122+36
	ldr	r5, [r3, r8, lsl #5]
	add	r5, r5, #1
	cmp	r10, r5
	ble	.L121
	mov	r3, #1
	mov	r7, #4
	str	r3, [sp, #20]
	mov	r9, #32
	b	.L78
.L121:
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
.L84:
	ldr	r3, .L122+44
	ldr	r2, .L122+52
	ldrh	r3, [r3]
	ldrh	ip, [r2]
	b	.L59
.L74:
	ldr	r3, [sp, #20]
	cmp	r3, #0
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	bne	.L84
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
	ldr	ip, .L122+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L116
	mov	ip, #1
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #28]
	mov	r3, r1
	str	r1, [r0]
	ldr	r2, .L122+56
	mov	r1, #7488
	ldr	r0, .L122+88
	ldr	r5, .L122+64
	str	ip, [fp]
	mov	lr, pc
	bx	r5
.L116:
	ldr	r3, .L122+44
	ldr	r2, .L122+52
	ldrh	r3, [r3]
	ldrh	ip, [r2]
	b	.L117
.L119:
	mov	r3, #0
	ldr	r2, .L122+56
	mov	r1, #2592
	ldr	r0, .L122+60
	ldr	r5, .L122+64
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
	mov	lr, #0
	ldr	r1, [fp, #12]
	add	r1, r1, ip, asr #3
	sub	r3, r3, r0
	cmp	r1, #52
	str	r2, [fp, #20]
	str	r3, [fp, #24]
	str	lr, [fp]
	bne	.L116
	add	r2, r3, #7
	cmp	r3, lr
	movlt	r3, r2
	ldr	r2, [fp, #16]
	add	r3, r2, r3, asr #3
	cmp	r3, #9
	moveq	r3, #1
	ldreq	r2, [sp, #28]
	streq	r3, [r2]
	b	.L116
.L123:
	.align	2
.L122:
	.word	player
	.word	vselDel
	.word	hselDel
	.word	collision
	.word	cheat
	.word	windTimer
	.word	oldButtons
	.word	buttons
	.word	hasTurned
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
	.word	fitted
	.word	cheatBlock
	.word	BlockUpSFX
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
	ldr	r3, .L129
	mov	r0, sp
	mov	r2, #128
	ldr	r1, .L129+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L129+8
	ldr	r5, [r3]
	cmp	r5, #0
	ble	.L124
	mov	r2, sp
	mov	r0, #0
	mov	ip, #8
	mov	r7, #1
	mov	r6, #16
	ldr	r1, [r3, #4]
	ldr	r3, .L129+12
	add	r5, r5, r1
.L126:
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
	bne	.L126
.L124:
	add	sp, sp, #132
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L130:
	.align	2
.L129:
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
	beq	.L132
	mov	r1, #512
	ldr	r3, .L137
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L132:
	push	{r4, r5, lr}
	add	r1, r0, #40
	ldr	r5, [r0, #36]
	ldm	r1, {r1, r4}
	ldr	ip, [r0, #4]
	ldr	lr, .L137
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
.L138:
	.align	2
.L137:
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
	ldr	r2, .L140
	ldr	r3, .L140+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	ip, [r0, #8]
	ldr	r1, [r0, #12]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	stm	r0, {r2, r3}
	bx	lr
.L141:
	.align	2
.L140:
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	mov	r5, #16
	mov	r0, r6
	mov	fp, #4
	mov	r10, #25
	mov	r8, #32
	mov	ip, #8
	ldr	r2, .L148
	ldr	r3, .L148+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	sub	sp, sp, #12
	str	r2, [sp]
	str	r3, [sp, #4]
	ldr	r1, .L148+8
	rsb	r9, r2, #200
	rsb	r7, r3, #128
.L144:
	mov	r3, r1
	mov	r2, #0
	str	r5, [r1, #20]
	add	r4, r6, #30
	add	r5, r5, #1
	str	r5, [r1, #56]
	str	fp, [r1]
	str	r0, [r1, #4]
	str	r10, [r1, #16]
	str	r9, [r1, #8]
	str	r7, [r1, #12]
	str	r8, [r1, #44]
	str	r8, [r1, #40]
	str	r0, [r1, #24]
	str	r0, [r1, #28]
	str	r0, [r1, #52]
	str	r0, [r1, #60]
	str	r4, [r1, #64]
.L143:
	str	r2, [r3, #68]
	add	lr, r2, r4
	add	r2, r2, #1
	cmp	r2, #4
	str	r0, [r3, #72]
	str	ip, [r3, #84]
	str	ip, [r3, #88]
	str	lr, [r3, #108]
	add	r3, r3, #44
	bne	.L143
	cmp	r5, #20
	add	r1, r1, #288
	add	r7, r7, #8
	add	r6, r6, #10
	bne	.L144
	mov	r4, #2
	mov	lr, #19
	mov	r6, #1
	mov	r5, #98
	ldr	r2, [sp]
	rsb	r1, r2, #16
	ldr	r2, [sp, #4]
	ldr	r3, .L148+12
	rsb	r2, r2, #152
	stm	r3, {r0, r1, r2}
	str	r0, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #60]
	str	r0, [r3, #64]
	str	ip, [r3, #36]
	str	ip, [r3, #40]
	str	r6, [r3, #48]
	str	r5, [r3, #68]
	str	r4, [r3, #12]
	str	r4, [r3, #56]
	str	lr, [r3, #16]
	str	lr, [r3, #52]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L149:
	.align	2
.L148:
	.word	vOff
	.word	hOff
	.word	pieceParents
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
	mov	r1, #20
	ldr	r2, .L152
	push	{r4, lr}
	ldr	r2, [r2]
	ldr	r0, .L152+4
	ldr	lr, .L152+8
	str	r2, [r0]
	str	r2, [lr]
	ldr	ip, .L152+12
	ldr	r0, .L152+16
	ldr	r2, .L152+20
	ldr	lr, .L152+24
	strh	r3, [ip]	@ movhi
	strh	r3, [r0]	@ movhi
	str	r3, [r2]
	ldr	ip, .L152+28
	ldr	r0, .L152+32
	ldr	r2, .L152+36
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	bl	initPlayer
	bl	initBoard
	pop	{r4, lr}
	b	initPieceParents
.L153:
	.align	2
.L152:
	.word	.LANCHOR0
	.word	fitted
	.word	fittedReset
	.word	vOff
	.word	hOff
	.word	windTimer
	.word	hasTurned
	.word	cheat
	.word	windIsOn
	.word	windFrameRate
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
	ble	.L154
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
	ldr	r5, .L161
	ldr	r8, .L161+4
	lsr	r4, r4, #16
	b	.L158
.L157:
	add	ip, ip, #1
	cmp	ip, r6
	add	r1, r1, #44
	beq	.L154
.L158:
	ldr	r3, [r1, #108]
	cmp	lr, #0
	lsl	r2, r3, #3
	strhne	r7, [r5, r2]	@ movhi
	bne	.L157
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
	bne	.L158
.L154:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L162:
	.align	2
.L161:
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
	ldr	r6, .L170
	bl	drawPlayer
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L164
	mov	r5, #0
	ldr	r4, .L170+4
.L165:
	mov	r0, r4
	bl	drawBoardSquare
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #52
	bgt	.L165
.L164:
	ldr	r0, .L170+8
	bl	drawPieceParent
	ldr	r0, .L170+12
	bl	drawPieceParent
	ldr	r0, .L170+16
	bl	drawPieceParent
	ldr	r0, .L170+20
	bl	drawPieceParent
	ldr	r3, .L170+24
	ldr	r2, [r3, #4]
	cmp	r2, #160
	movle	r1, #0
	movgt	r1, #1
	ldr	r0, [r3, #40]
	rsb	r0, r0, #0
	cmp	r2, r0
	orrlt	r1, r1, #1
	cmp	r1, #0
	beq	.L166
	mov	r1, #512
	ldr	r3, [r3, #68]
	ldr	r2, .L170+28
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
.L167:
	mov	r3, #67108864
	ldr	r2, .L170+32
	ldrh	r0, [r2]
	ldr	r1, .L170+36
	strh	r0, [r3, #24]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #26]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #28]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #30]	@ movhi
	ldr	r3, .L170+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L170+44
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L170+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L166:
	ldr	lr, [r3, #64]
	ldr	r1, [r3, #8]
	add	r4, r3, #56
	ldr	r0, [r3, #52]
	ldr	ip, [r3, #68]
	ldr	r6, [r3, #48]
	ldm	r4, {r4, r5}
	add	r1, r1, lr, lsl #3
	ldr	lr, .L170+28
	lsl	r3, r1, #23
	lsl	ip, ip, #3
	add	r1, r0, r6, lsl #5
	add	r2, r2, r5, lsl #3
	add	r0, lr, ip
	lsr	r3, r3, #23
	orr	r1, r1, r4, lsl #12
	and	r2, r2, #255
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	strh	r2, [lr, ip]	@ movhi
	b	.L167
.L171:
	.align	2
.L170:
	.word	.LANCHOR0
	.word	board
	.word	pieceParents
	.word	pieceParents+288
	.word	pieceParents+576
	.word	pieceParents+864
	.word	cheatBlock
	.word	shadowOAM
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
	ldr	r2, .L176
	ldr	r3, .L176+4
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
	ble	.L173
	ldr	r4, .L176+8
	ldr	lr, .L176+12
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
.L173:
	add	r2, r2, ip
	add	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	pop	{r4, lr}
	bx	lr
.L177:
	.align	2
.L176:
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
	ldr	r6, .L190
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L180
	ldr	r2, .L190+4
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L190+8
	ldr	r4, [r2]
	ldr	r0, [r1]
	ldr	r2, .L190+12
	ldr	r1, .L190+16
	rsb	r4, r4, r0, lsl #1
	ldr	r8, [r2]
	sub	r4, r4, #32
	ldr	r7, .L190+20
	ldr	r5, [r1]
	lsl	r4, r4, #16
	add	r8, r8, #1
	lsr	r4, r4, #16
	str	r8, [r2]
	mov	r1, r5
	strh	r3, [r7, #2]	@ movhi
	strh	r4, [r7]	@ movhi
	mov	r0, r8
	ldr	r2, .L190+24
	mov	lr, pc
	bx	r2
	add	r5, r5, r5, lsl #1
	cmp	r8, r5, lsl #1
	moveq	r3, #0
	lsl	r0, r0, #7
	add	r0, r0, #82
	orr	r0, r0, #8192
	orreq	r4, r4, #512
	strh	r0, [r7, #4]	@ movhi
	strheq	r4, [r7]	@ movhi
	streq	r3, [r6]
.L180:
	bl	updatePlayer
	ldr	r3, .L190+28
	ldr	r0, [r3]
	cmp	r0, #0
	ldr	r5, .L190+32
	ldr	r4, .L190+36
	ble	.L182
	add	r2, r0, r0, lsl #1
	ldr	r3, .L190+40
	add	r0, r0, r2, lsl #2
	ldrh	lr, [r5]
	ldrh	ip, [r4]
	add	r0, r3, r0, lsl #2
.L183:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	rsb	r1, lr, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	stm	r3, {r1, r2}
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L183
.L182:
	ldr	r0, .L190+44
	bl	updatePieceParent
	ldr	r0, .L190+48
	bl	updatePieceParent
	ldr	r0, .L190+52
	bl	updatePieceParent
	ldr	r0, .L190+56
	bl	updatePieceParent
	ldr	r3, .L190+60
	ldr	r2, [r3]
	cmp	r2, #0
	ble	.L184
	ldrh	r1, [r5]
	ldr	ip, [r3, #12]
	ldrh	r2, [r4]
	rsb	r1, r1, ip, lsl #3
	ldr	r0, .L190+64
	ldr	ip, [r3, #16]
	ldr	r0, [r0]
	rsb	r2, r2, ip, lsl #3
	ldr	lr, .L190+68
	ldr	ip, [r3, #20]
	ldr	lr, [lr]
	add	ip, ip, r0
	ldr	r0, [r3, #24]
	add	r0, r0, lr
	add	r1, r1, ip
	add	r2, r2, r0
	str	r1, [r3, #4]
	str	ip, [r3, #20]
	str	r2, [r3, #8]
	str	r0, [r3, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L184:
	add	r0, r3, #12
	ldm	r0, {r0, lr}
	ldrh	r1, [r5]
	ldrh	r2, [r4]
	rsb	r1, r1, r0, lsl #3
	ldr	ip, [r3, #20]
	ldr	r0, [r3, #24]
	rsb	r2, r2, lr, lsl #3
	add	r1, r1, ip
	add	r2, r2, r0
	stmib	r3, {r1, r2}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L191:
	.align	2
.L190:
	.word	windIsOn
	.word	player
	.word	windRow
	.word	windCount
	.word	windFrameRate
	.word	shadowOAM+792
	.word	__aeabi_idiv
	.word	.LANCHOR0
	.word	vOff
	.word	hOff
	.word	board
	.word	pieceParents
	.word	pieceParents+288
	.word	pieceParents+576
	.word	pieceParents+864
	.word	cheatBlock
	.word	vselDel
	.word	hselDel
	.size	updateGame, .-updateGame
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	cheatBlock,72,4
	.comm	windCol,4,4
	.comm	windRow,4,4
	.comm	windFrameRate,4,4
	.comm	windIsOn,4,4
	.comm	windCount,4,4
	.comm	cheat,4,4
	.comm	hasTurned,4,4
	.comm	windTimer,4,4
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
