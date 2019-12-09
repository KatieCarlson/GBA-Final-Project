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
	cmp	r1, #0
	mov	r3, #0
	push	{r4, r5, r6, lr}
	movne	lr, #1
	ldr	r2, .L35
	ldrne	ip, .L35+4
	str	r3, [r2]
	mov	r4, r0
	moveq	r3, r1
	ldrne	r2, .L35+8
	ldrne	r1, .L35+12
	ldreq	r2, .L35+8
	moveq	r1, #6336
	ldrne	r0, .L35+16
	ldreq	r0, .L35+20
	ldr	r5, .L35+24
	strne	lr, [ip]
	mov	lr, pc
	bx	r5
	ldr	r3, .L35+28
	ldm	r3, {r2, r3}
	ldr	r1, .L35+32
	sub	r2, r2, #32
	cmp	r3, #12
	str	r2, [r1]
	bgt	.L29
	ldr	r2, .L35+36
	str	r3, [r2]
.L30:
	mov	r2, #0
	ldr	r3, [r4, #4]
	sub	r3, r3, #1
	add	r1, r3, r3, lsl #2
	add	r3, r3, r1, lsl #1
	lsl	r3, r3, #2
	add	r3, r3, #68
	add	r1, r4, r3
	ldr	r1, [r1, #4]
	ldr	r3, [r4, r3]
	sub	ip, r1, #3
	ldr	r0, [r4, #20]
	add	ip, ip, r3
	sub	r3, r3, r1
	ldr	r1, [r4, #16]
	add	r0, r0, ip
	ldr	ip, [r4]
	add	r3, r1, r3
	ldr	lr, .L35+40
	ldr	r1, .L35+44
	cmp	ip, r2
	str	r0, [r4, #20]
	str	r3, [r4, #16]
	str	r2, [lr]
	str	r2, [r1]
	ble	.L26
	mov	r0, r4
.L32:
	ldr	r3, [r0, #68]
	ldr	r1, [r0, #72]
	add	r2, r2, #1
	rsb	r3, r3, #3
	cmp	r2, ip
	str	r3, [r0, #72]
	str	r1, [r0, #68]
	add	r0, r0, #44
	bne	.L32
.L26:
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	sub	r3, r3, #8
	ldr	r2, .L35+36
	cmp	r3, #40
	str	r3, [r2]
	movgt	r3, #40
	strgt	r3, [r2]
	b	.L30
.L36:
	.align	2
.L35:
	.word	windCount
	.word	windIsOn
	.word	11025
	.word	22655
	.word	WindEffect
	.word	BlockTurnSFX
	.word	playSoundB
	.word	player
	.word	windRow
	.word	windCol
	.word	windRowdel
	.word	windColdel
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
	ldr	r2, .L46
	mov	r1, #6336
	ldr	r0, .L46+4
	ldr	r5, .L46+8
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
	beq	.L38
	cmp	r3, #1
	mvneq	r2, #0
	beq	.L38
	cmp	r3, #2
	movne	r2, #3
	moveq	r2, #1
.L38:
	ldr	r3, [r4, #20]
	ldr	r1, [r4]
	add	r3, r3, r2
	cmp	r1, #0
	str	r3, [r4, #20]
	ble	.L37
	mov	r0, r4
	mov	r2, #0
.L40:
	ldr	r3, [r0, #72]
	add	r2, r2, #1
	rsb	r3, r3, #3
	cmp	r2, r1
	str	r3, [r0, #72]
	add	r0, r0, #44
	bne	.L40
.L37:
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	.align	2
.L46:
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
	@ args = 0, pretend = 0, frame = 232
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #0
	mov	r6, #512
	mov	lr, #64
	ldr	fp, .L198
	ldr	r4, .L198+4
	ldr	r5, .L198+8
	sub	sp, sp, #252
	add	r2, fp, #24
	ldm	r2, {r2, r3}
	ldr	r1, [fp, #8]
	ldr	r0, [fp, #12]
	str	ip, [sp, #4]
	str	ip, [sp]
	str	r6, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [r4]
	str	ip, [r5]
	ldr	ip, .L198+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r6, .L198+16
	beq	.L49
.L51:
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
.L50:
	mov	r1, #32
	mov	r0, #176
	mov	ip, #160
	add	r2, fp, #24
	ldm	r2, {r2, r3}
	str	r1, [sp, #12]
	str	r1, [sp, #8]
	ldr	r1, [fp, #8]
	str	r0, [sp, #4]
	ldr	r0, [fp, #12]
	str	ip, [sp]
	ldr	ip, .L198+12
	mov	lr, pc
	bx	ip
	ldr	r3, .L198+20
	cmp	r0, #0
	ldrne	r2, [r3]
	ldreq	r2, .L198+24
	addne	r2, r2, #1
	streq	r0, [r2]
	strne	r2, [r3]
	ldr	r2, .L198+28
	ldr	r2, [r2]
	streq	r0, [r3]
	cmp	r2, #0
	beq	.L54
	ldr	r2, .L198+32
	ldrh	r1, [r2]
	tst	r1, #1
	bne	.L191
.L55:
	ldr	r2, [r6]
	cmp	r2, #80
	ble	.L58
	ldr	r2, .L198+36
	ldr	r0, [r2]
	cmp	r0, #0
	beq	.L56
.L58:
	tst	r1, #512
	beq	.L63
	ldr	r2, .L198+40
	ldrh	r2, [r2]
	tst	r2, #512
	bne	.L63
	ldr	r2, .L198+24
.L64:
	mov	r3, #1
	ldr	r4, .L198+44
	str	r3, [r2]
	add	r5, r4, #1872
	add	r5, r5, #8
.L67:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movgt	r0, r4
	blgt	flipPiece
.L66:
	add	r4, r4, #376
	cmp	r5, r4
	bne	.L67
	add	sp, sp, #252
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L54:
	ldr	r2, [r6]
	cmp	r2, #80
	ble	.L63
	ldr	r2, .L198+36
	ldr	r1, [r2]
	cmp	r1, #0
	bne	.L63
.L56:
	mov	r3, #1
	ldr	r4, .L198+44
	str	r3, [r2]
	add	r5, r4, #1872
	add	r5, r5, #8
.L61:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L59
	ldr	r3, [r6]
	cmp	r3, #0
	movgt	r1, #1
	movle	r1, #0
	mov	r0, r4
	bl	turnPiece
.L59:
	add	r4, r4, #376
	cmp	r5, r4
	bne	.L61
	add	sp, sp, #252
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L63:
	ldr	r3, [r3]
	cmp	r3, #80
	bgt	.L192
.L65:
	ldr	r3, .L198+48
	ldrh	r3, [r3, #48]
	ands	r2, r3, #64
	ldr	r3, .L198+52
	movne	r2, #0
	ldrh	r3, [r3]
	bne	.L69
	ldr	r1, [fp]
	cmp	r1, #0
	ble	.L69
	add	r0, fp, #8
	ldm	r0, {r0, r7}
	sub	r0, r0, #1
	lsl	lr, r0, #8
	add	r6, lr, r7
	ldr	ip, .L198+56
	lsl	r2, r6, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	beq	.L69
	add	r2, ip, r6, lsl #1
	ldrh	r2, [r2, #16]
	cmp	r2, #0
	beq	.L69
	add	r2, ip, r6, lsl #1
	ldrh	r2, [r2, #32]
	cmp	r2, #0
	beq	.L69
	add	r6, ip, r6, lsl #1
	ldrh	r2, [r6, #48]
	cmp	r2, #0
	beq	.L69
	ldr	r2, [fp, #24]
	add	r2, lr, r2
	add	r2, r2, r7
	add	ip, ip, r2, lsl #1
	ldrh	r2, [ip, #-2]
	cmp	r2, #0
	beq	.L69
	cmp	r1, #79
	movgt	r2, #0
	movle	r2, #1
	mvn	r1, #0
	cmp	r3, #0
	moveq	r2, #0
	str	r0, [fp, #8]
	str	r1, [r4]
	rsb	r2, r2, #0
.L69:
	ldr	r1, .L198+48
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L70
	ldr	r9, [fp]
	ldr	r1, [fp, #28]
	add	ip, r9, r1
	cmp	ip, #320
	bge	.L70
	add	r6, fp, #8
	ldm	r6, {r6, r7}
	add	r1, r1, r6
	lsl	r1, r1, #8
	add	lr, r1, r7
	ldr	ip, .L198+56
	lsl	r8, lr, #1
	ldrh	r8, [ip, r8]
	cmp	r8, #0
	beq	.L70
	add	r8, ip, lr, lsl #1
	ldrh	r8, [r8, #16]
	cmp	r8, #0
	beq	.L70
	add	r8, ip, lr, lsl #1
	ldrh	r8, [r8, #32]
	cmp	r8, #0
	beq	.L70
	add	lr, ip, lr, lsl #1
	ldrh	lr, [lr, #48]
	cmp	lr, #0
	beq	.L70
	ldr	lr, [fp, #24]
	add	r1, r1, lr
	add	r7, r1, r7
	add	ip, ip, r7, lsl #1
	ldrh	r1, [ip, #-2]
	cmp	r1, #0
	beq	.L70
	cmp	r9, #80
	movle	r0, #0
	movgt	r0, #1
	cmp	r3, #352
	movcs	r0, #0
	mov	r1, #1
	cmp	r0, #0
	movne	r2, r1
	add	r6, r6, r1
	str	r6, [fp, #8]
	str	r1, [r4]
.L70:
	lsl	ip, r2, #16
	lsr	ip, ip, #16
	add	r3, ip, r3
	ldr	r1, .L198+52
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r1]	@ movhi
	ldr	r1, .L198+48
	ldrh	r1, [r1, #48]
	ands	r0, r1, #32
	ldr	r1, .L198+60
	movne	r0, #0
	ldrh	r1, [r1]
	bne	.L71
	ldr	lr, [fp, #4]
	cmp	lr, #0
	ble	.L71
	ldr	r7, [fp, #12]
	ldr	r8, [fp, #8]
	sub	r7, r7, #1
	add	r4, r7, r8, lsl #8
	ldr	r6, .L198+56
	lsl	r0, r4, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L71
	add	r0, r4, #2048
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L71
	add	r0, r4, #4096
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L71
	add	r0, r4, #6144
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L71
	ldr	r0, [fp, #28]
	add	r0, r8, r0
	sub	r0, r0, #1
	add	r0, r7, r0, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L71
	cmp	lr, #119
	movgt	r0, #0
	movle	r0, #1
	mvn	lr, #0
	cmp	r1, #0
	moveq	r0, #0
	str	r7, [fp, #12]
	str	lr, [r5]
	rsb	r0, r0, #0
.L71:
	ldr	lr, .L198+48
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L72
	ldr	lr, [fp, #4]
	ldr	r9, [fp, #24]
	add	r4, lr, r9
	cmp	r4, #239
	bgt	.L72
	add	r8, fp, #8
	ldm	r8, {r8, r10}
	add	r9, r9, r10
	add	r4, r9, r8, lsl #8
	ldr	r7, .L198+56
	lsl	r6, r4, #1
	ldrh	r6, [r7, r6]
	cmp	r6, #0
	beq	.L72
	add	r6, r4, #2048
	lsl	r6, r6, #1
	ldrh	r6, [r7, r6]
	cmp	r6, #0
	beq	.L72
	add	r6, r4, #4096
	lsl	r6, r6, #1
	ldrh	r6, [r7, r6]
	cmp	r6, #0
	beq	.L72
	add	r4, r4, #6144
	lsl	r4, r4, #1
	ldrh	r4, [r7, r4]
	cmp	r4, #0
	beq	.L72
	ldr	r4, [fp, #28]
	add	r4, r8, r4
	sub	r4, r4, #1
	add	r4, r9, r4, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r7, r4]
	cmp	r4, #0
	beq	.L72
	cmp	r1, #15
	movhi	r4, #0
	movls	r4, #1
	cmp	lr, #120
	movle	r4, #0
	mov	lr, #1
	cmp	r4, #0
	movne	r0, lr
	add	r10, r10, lr
	str	r10, [fp, #12]
	str	lr, [r5]
.L72:
	ldr	lr, .L198+64
	add	r3, ip, r3
	ldr	ip, .L198+32
	add	r1, r1, r0
	ldrh	r6, [ip]
	lsl	ip, r1, #16
	ldr	r1, [lr]
	ldr	r4, .L198+68
	add	r2, r1, r2
	ldr	r1, .L198+60
	ldr	r5, [r4]
	lsr	ip, ip, #16
	strh	ip, [r1]	@ movhi
	lsl	r3, r3, #16
	ldr	r1, .L198+52
	lsr	r3, r3, #16
	add	r0, r5, r0
	tst	r6, #2
	strh	r3, [r1]	@ movhi
	str	r0, [r4]
	str	r2, [lr]
	beq	.L190
	ldr	r2, .L198+40
	ldrh	r2, [r2]
	ands	r5, r2, #2
	bne	.L190
	ldr	r3, .L198+44
.L89:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bgt	.L193
	add	r5, r5, #1
	cmp	r5, #5
	add	r3, r3, #376
	bne	.L89
	mov	r3, #0
	str	r3, [sp, #24]
	b	.L88
.L192:
	ldr	r2, .L198+24
	ldr	r3, [r2]
	cmp	r3, #0
	bne	.L65
	b	.L64
.L191:
	ldr	r2, .L198+40
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L55
	ldr	r2, .L198+36
	b	.L56
.L92:
	ldr	r3, [sp, #20]
	cmp	r3, #0
	ldr	r0, [fp, #12]
	ldr	r1, [fp, #8]
	bne	.L104
	mov	lr, #8
	mov	r3, #2
	ldr	ip, [r10, #60]
	ldr	r2, [r10, #12]
	add	r2, r2, ip
	ldr	ip, [r10, #20]
	add	ip, ip, r2, lsl #3
	ldr	r4, [r10, #16]
	ldr	r2, [r10, #64]
	str	ip, [sp, #4]
	ldr	ip, [r10, #24]
	add	r2, r4, r2
	add	r2, ip, r2, lsl #3
	str	r2, [sp]
	str	lr, [sp, #12]
	str	lr, [sp, #8]
	mov	r2, r3
	ldr	ip, .L198+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L102
.L189:
	ldr	r3, .L198+52
	ldr	r2, .L198+60
	ldrh	r3, [r3]
	ldrh	ip, [r2]
.L190:
	ldr	r1, [fp, #8]
	ldr	r0, [fp, #12]
.L74:
	sub	r3, r1, r3
	sub	r0, r0, ip
	str	r3, [fp]
	str	r0, [fp, #4]
	add	sp, sp, #252
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L49:
	mov	lr, #96
	mov	ip, #256
	add	r2, fp, #24
	ldm	r2, {r2, r3}
	str	r0, [sp, #4]
	str	r0, [sp]
	ldr	r1, [fp, #8]
	str	lr, [sp, #12]
	ldr	r0, [fp, #12]
	str	ip, [sp, #8]
	ldr	ip, .L198+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L51
	ldr	r2, .L198+36
	str	r0, [r6]
	str	r0, [r2]
	b	.L50
.L193:
	mov	r4, #0
	ldr	r2, .L198+72
	mov	r3, r4
	mov	r1, #2592
	ldr	r0, .L198+76
	ldr	r6, .L198+80
	mov	lr, pc
	bx	r6
	ldr	r3, .L198+44
	add	ip, r5, r5, lsl #1
	rsb	ip, r5, ip, lsl #4
	add	ip, r3, ip, lsl #3
	add	r2, ip, #24
	ldm	r2, {r2, r3}
	subs	r1, r4, r2
	and	r1, r1, #7
	and	r0, r2, #7
	rsbpl	r0, r1, #0
	subs	lr, r4, r3
	and	lr, lr, #7
	and	r1, r3, #7
	rsbpl	r1, lr, #0
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [ip, #24]
	str	r3, [ip, #28]
	mov	r2, #208
	ldr	r3, .L198+84
	mov	r1, r4
	add	r0, sp, #40
	str	r4, [ip, #4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L198+88
	ldr	r3, [r3]
	mov	r2, r3
	str	r3, [sp, #36]
	ldr	r3, .L198+92
	ldr	r3, [r3]
	cmp	r2, r4
	str	r3, [sp, #28]
	ble	.L77
	ldr	r8, .L198+96
	mov	r10, r8
	str	r4, [sp, #32]
	str	r4, [sp, #20]
.L78:
	mov	r7, #0
	ldr	r0, .L198+44
.L87:
	ldr	r1, [r0]
	cmp	r1, #0
	ble	.L86
	ldr	r2, [r0, #28]
	add	r3, r2, #7
	cmp	r2, #0
	movlt	r2, r3
	add	lr, r1, r1, lsl #2
	add	lr, r1, lr, lsl #1
	ldr	r1, .L198+44
	add	r1, r1, r7
	mov	r3, r0
	ldr	ip, [r10, #12]
	ldr	r4, [r0, #20]
	asr	r2, r2, #3
	add	r1, r1, lr, lsl #2
	b	.L83
.L79:
	add	r3, r3, #44
	cmp	r1, r3
	beq	.L86
.L83:
	ldr	lr, [r3, #72]
	add	lr, r4, lr
	add	lr, lr, r2
	cmp	ip, lr
	bne	.L79
	ldr	lr, [r0, #24]
	cmp	lr, #0
	add	r6, lr, #7
	movge	r6, lr
	ldr	r5, [r3, #68]
	ldr	lr, [r0, #16]
	add	lr, lr, r5
	ldr	r5, [r10, #8]
	add	lr, lr, r6, asr #3
	cmp	r5, lr
	bne	.L79
	ldr	lr, [sp, #20]
	cmp	lr, #0
	streq	lr, [sp, #24]
	beq	.L80
	mov	r9, #0
	ldr	r6, [sp, #20]
	lsl	r6, r6, #2
	add	lr, sp, #40
	str	r6, [sp, #24]
	add	r8, r6, lr
.L82:
	ldr	r6, [lr], #4
	cmp	ip, r6
	bne	.L81
	ldr	r6, [lr]
	cmp	r5, r6
	moveq	r9, #1
.L81:
	cmp	r8, lr
	bne	.L82
	cmp	r9, #0
	bne	.L79
.L80:
	ldr	r6, [sp, #24]
	add	lr, sp, #248
	add	lr, lr, r6
	str	ip, [lr, #-208]
	ldr	lr, [sp, #28]
	ldr	r8, [sp, #20]
	sub	lr, lr, #1
	add	r6, sp, #248
	add	r3, r3, #44
	add	r6, r6, r8, lsl #2
	str	lr, [sp, #28]
	cmp	r1, r3
	add	lr, r8, #2
	str	r5, [r6, #-204]
	str	lr, [sp, #20]
	bne	.L83
.L86:
	ldr	r3, .L198+100
	add	r7, r7, #376
	cmp	r7, r3
	add	r0, r0, #376
	bne	.L87
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #36]
	add	r3, r3, #1
	cmp	r2, r3
	str	r3, [sp, #32]
	add	r10, r10, #52
	bne	.L78
.L77:
	ldr	r3, .L198+104
	ldr	r2, [sp, #28]
	str	r2, [r3]
	mov	r3, #1
	str	r3, [sp, #24]
.L88:
	ldr	r10, .L198+108
	ldr	r3, [r10]
	cmp	r3, #0
	ble	.L93
	add	r2, r10, #20
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
	ldr	r1, [r10, #16]
	ldr	r0, [r10, #12]
	sub	r3, r3, ip
	add	r2, r2, r0, lsl #3
	add	r3, r3, r1, lsl #3
	add	r3, r3, r2, lsl #8
	ldr	r2, .L198+56
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	bne	.L194
.L93:
	ldr	r3, [sp, #24]
	cmp	r3, #1
	streq	r3, [sp, #20]
	beq	.L92
	ldr	r6, [sp, #24]
	b	.L91
.L122:
	ldr	r3, [sp, #24]
	str	r3, [sp, #20]
.L188:
	mov	r3, #1
.L96:
	add	r6, r6, #1
	cmp	r6, #4
	movgt	r3, #0
	andle	r3, r3, #1
	cmp	r3, #0
	beq	.L92
.L91:
	lsl	r8, r6, #1
	add	r3, r8, r6
	ldr	r2, .L198+44
	rsb	r3, r6, r3, lsl #4
	add	r2, r2, r3, lsl #3
	ldr	r4, [r2, #4]
	cmp	r4, #0
	bne	.L122
	ldr	r2, .L198+44
	ldr	r9, [r2, r3, lsl #3]
	cmp	r9, #0
	str	r4, [sp, #20]
	ble	.L188
.L97:
	mov	r3, #2
	mov	ip, #8
	add	r7, r8, r6
	add	r2, r4, r4, lsl r3
	rsb	r7, r6, r7, lsl #4
	ldr	r1, .L198+44
	lsl	r5, r7, #3
	add	r2, r4, r2, lsl #1
	add	r2, r5, r2, lsl r3
	add	r2, r1, r2
	add	r5, r1, r5
	add	r1, r2, #68
	ldm	r1, {r1, r2}
	ldr	r0, [r5, #16]
	add	r0, r0, r1
	add	r1, r5, #20
	ldm	r1, {r1, lr}
	add	r1, r1, r2
	ldr	r2, [r5, #28]
	add	r0, lr, r0, lsl #3
	add	r2, r2, r1, lsl #3
	ldr	r1, [fp, #8]
	str	r0, [sp, #4]
	ldr	r0, [fp, #12]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	ip, [sp, #8]
	mov	r2, r3
	ldr	ip, .L198+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	add	r4, r4, #1
	bne	.L195
	cmp	r9, r4
	bgt	.L97
	ldr	r3, [sp, #20]
	eor	r3, r3, #1
	and	r3, r3, #1
	b	.L96
.L195:
	mov	r3, #0
	str	r4, [r5, #4]
	ldr	r2, .L198+72
	mov	r1, #7488
	ldr	r0, .L198+112
	ldr	ip, .L198+80
	mov	lr, pc
	bx	ip
	ldr	r3, .L198+44
	ldr	r4, [r3, r7, lsl #3]
	add	r4, r4, #1
	cmp	r4, r9
	bge	.L196
	mov	r3, #1
	mov	r6, #5
	str	r3, [sp, #20]
	mov	r8, #10
	b	.L97
.L196:
	ldr	r0, [fp, #12]
	ldr	r1, [fp, #8]
.L104:
	ldr	r3, .L198+52
	ldr	r2, .L198+60
	ldrh	r3, [r3]
	ldrh	ip, [r2]
	b	.L74
.L194:
	mov	r3, #0
	ldr	r2, .L198+72
	mov	r1, #2592
	ldr	r0, .L198+76
	ldr	r4, .L198+80
	mov	lr, pc
	bx	r4
	ldr	r2, [r10, #20]
	ldr	r3, [r10, #24]
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
	mov	r5, #0
	ldr	r1, [r10, #12]
	add	r1, r1, ip, asr #3
	sub	r3, r3, r0
	cmp	r1, #2
	str	r2, [r10, #20]
	str	r3, [r10, #24]
	str	r5, [r10]
	beq	.L197
.L94:
	ldr	r4, .L198+116
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L189
	ldr	r3, .L198+120
	mov	lr, pc
	bx	r3
	ldr	r5, .L198+124
	mov	r3, #1
	ldr	r2, .L198+72
	ldr	r1, .L198+128
	ldr	r0, .L198+132
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4]
	b	.L189
.L102:
	mov	ip, #1
	ldr	r1, [sp, #20]
	ldr	r0, .L198+28
	mov	r3, r1
	str	r1, [r0]
	ldr	r2, .L198+72
	mov	r1, #7488
	ldr	r0, .L198+112
	ldr	r4, .L198+80
	str	ip, [r10]
	mov	lr, pc
	bx	r4
	b	.L189
.L197:
	add	r2, r3, #7
	cmp	r3, r5
	movlt	r3, r2
	ldr	r2, [r10, #16]
	add	r3, r2, r3, asr #3
	cmp	r3, #19
	bne	.L94
	ldr	r3, .L198+120
	mov	lr, pc
	bx	r3
	ldr	r6, .L198+124
	mov	r3, #1
	ldr	r2, .L198+72
	ldr	r1, .L198+136
	ldr	r0, .L198+140
	mov	lr, pc
	bx	r6
	mov	r3, r5
	ldr	r2, .L198+72
	ldr	r1, .L198+144
	ldr	r0, .L198+148
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r2, .L198+116
	ldr	r1, .L198+28
	str	r3, [r2]
	str	r3, [r1]
	b	.L189
.L199:
	.align	2
.L198:
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
	.word	windRowdel
	.word	windColdel
	.word	11025
	.word	BlockDownSFX
	.word	playSoundB
	.word	memset
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
	ldr	r0, .L209
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, [r0]
	cmp	r5, #0
	ble	.L201
	mov	r2, #0
	ldmib	r0, {r4, r6}
	add	r9, r0, #428
	add	r10, r0, #220
	mov	ip, #8
	mov	r1, r2
	mov	r8, #1
	mov	r7, #16
	ldr	r3, .L209+4
	add	r0, r0, #12
	b	.L205
.L208:
	ldr	fp, [lr, #4]
	ldr	lr, [r0, r2, lsl #3]
	str	fp, [r3, #12]
	str	lr, [r3, #8]
.L203:
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
	beq	.L201
.L205:
	cmp	r4, #0
	add	lr, r0, r2, lsl #3
	beq	.L208
	cmp	r4, #1
	addeq	lr, r10, r2, lsl #3
	addne	lr, r9, r2, lsl #3
	ldreq	fp, [lr, #4]
	ldrne	fp, [lr, #4]
	ldreq	lr, [r10, r2, lsl #3]
	ldrne	lr, [r9, r2, lsl #3]
	str	fp, [r3, #12]
	str	lr, [r3, #8]
	b	.L203
.L201:
	mov	r6, #116
	mov	r5, #96
	mov	r4, #0
	mov	lr, #22
	mov	r1, #64
	mov	ip, #2
	mov	r0, #126
	ldr	r3, .L209+8
	ldrh	r2, [r3]
	ldr	r3, .L209+12
	sub	r2, r6, r2
	str	r2, [r3, #4]
	ldr	r2, .L209+16
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
.L210:
	.align	2
.L209:
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
	beq	.L212
	mov	r1, #512
	ldr	r3, .L217
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L212:
	push	{r4, r5, lr}
	add	r1, r0, #40
	ldr	r5, [r0, #36]
	ldm	r1, {r1, r4}
	ldr	ip, [r0, #4]
	ldr	lr, .L217
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
.L218:
	.align	2
.L217:
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
	ldr	r2, .L220
	ldr	r3, .L220+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	ip, [r0, #8]
	ldr	r1, [r0, #12]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	stm	r0, {r2, r3}
	bx	lr
.L221:
	.align	2
.L220:
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
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #8
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #30
	mov	r6, #17
	mov	r4, #0
	mov	r7, #32
	ldr	r8, .L229
	sub	sp, sp, #52
	ldmia	r8!, {r0, r1, r2, r3}
	add	lr, sp, ip
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r8!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldr	r3, .L229+4
	ldm	r8, {r0, r1}
	ldr	r2, .L229+8
	ldrh	r3, [r3]
	ldr	r10, .L229+12
	stm	lr, {r0, r1}
	ldrh	fp, [r2]
	str	r3, [sp, #4]
	ldr	r0, .L229+16
	add	r9, r10, #20
	add	r8, sp, ip
.L225:
	ldm	r8, {r2, r3}
	str	r2, [r0, #16]
	rsb	r2, fp, r2, lsl #3
	ldr	lr, [r10], #4
	str	r2, [r0, #8]
	ldr	r2, [sp, #4]
	str	r3, [r0, #20]
	cmp	lr, #0
	rsb	r3, r2, r3, lsl #3
	str	r4, [r0, #4]
	str	r7, [r0, #44]
	str	r7, [r0, #40]
	str	r4, [r0, #24]
	str	r4, [r0, #28]
	str	r4, [r0, #52]
	str	r6, [r0, #56]
	str	r4, [r0, #60]
	str	r5, [r0, #64]
	str	r3, [r0, #12]
	str	lr, [r0]
	ble	.L223
	mov	r1, r5
	mov	r3, r0
	mov	r2, r9
	str	r0, [sp]
	add	lr, lr, r5
.L224:
	ldr	r0, [r2]
	str	r1, [r3, #108]
	str	r0, [r3, #68]
	add	r1, r1, #1
	ldr	r0, [r2, #4]
	cmp	r1, lr
	str	ip, [r3, #84]
	str	ip, [r3, #88]
	str	r0, [r3, #72]
	add	r2, r2, #8
	add	r3, r3, #44
	bne	.L224
	ldr	r0, [sp]
.L223:
	add	r6, r6, #1
	cmp	r6, #22
	add	r0, r0, #376
	add	r8, r8, #8
	add	r5, r5, #10
	add	r9, r9, #56
	bne	.L225
	mov	r1, #0
	mov	r0, #8
	mov	r7, #53
	mov	r6, #9
	mov	r5, #1
	mov	r4, #19
	mov	lr, #2
	mov	ip, #88
	ldr	r2, [sp, #4]
	ldr	r3, .L229+20
	rsb	fp, fp, #424
	rsb	r2, r2, #72
	str	fp, [r3, #4]
	str	r2, [r3, #8]
	str	r7, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #48]
	str	r4, [r3, #52]
	str	lr, [r3, #56]
	str	ip, [r3, #68]
	str	r1, [r3]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #60]
	str	r1, [r3, #64]
	str	r0, [r3, #36]
	str	r0, [r3, #40]
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L230:
	.align	2
.L229:
	.word	.LANCHOR1
	.word	hOff
	.word	vOff
	.word	.LANCHOR0+636
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
	mov	ip, #20
	ldr	r1, .L233
	push	{r4, lr}
	ldr	r2, [r1]
	str	r0, [r1, #4]
	ldr	lr, .L233+4
	ldr	r0, .L233+8
	ldr	r1, .L233+12
	str	r2, [lr]
	str	r2, [r0]
	str	r3, [r1]
	ldr	lr, .L233+16
	ldr	r0, .L233+20
	ldr	r1, .L233+24
	ldr	r2, .L233+28
	strh	r3, [lr]	@ movhi
	str	r3, [r0]
	ldr	lr, .L233+32
	str	r3, [r1]
	str	r3, [r2]
	ldr	r0, .L233+36
	ldr	r1, .L233+40
	ldr	r2, .L233+44
	ldr	r4, .L233+48
	str	r3, [lr]
	strh	r3, [r4]	@ movhi
	str	r3, [r0]
	str	r3, [r1]
	str	ip, [r2]
	bl	initPlayer
	bl	initBoard
	pop	{r4, lr}
	b	initPieceParents
.L234:
	.align	2
.L233:
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
	ble	.L235
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
	ldr	r4, .L242
	ldr	r8, .L242+4
	lsr	r6, r6, #16
	b	.L239
.L238:
	add	ip, ip, #1
	cmp	ip, r5
	add	r1, r1, #44
	beq	.L235
.L239:
	ldr	r3, [r1, #108]
	cmp	lr, #0
	lsl	r2, r3, #3
	strhne	r7, [r4, r2]	@ movhi
	bne	.L238
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
	bne	.L239
.L235:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L243:
	.align	2
.L242:
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
	ldr	r6, .L253
	bl	drawPlayer
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L245
	mov	r5, #0
	ldr	r4, .L253+4
.L246:
	mov	r0, r4
	bl	drawBoardSquare
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #52
	bgt	.L246
.L245:
	ldr	r0, .L253+8
	bl	drawPieceParent
	ldr	r0, .L253+12
	bl	drawPieceParent
	ldr	r0, .L253+16
	bl	drawPieceParent
	ldr	r0, .L253+20
	bl	drawPieceParent
	ldr	r0, .L253+24
	bl	drawPieceParent
	ldr	r3, .L253+28
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
	beq	.L247
	mov	r3, #512
	ldr	r7, .L253+32
	lsl	r1, r1, #3
	strh	r3, [r7, r1]	@ movhi
.L248:
	ldr	r0, .L253+36
	ldr	ip, [r0, #4]
	mvn	r3, #15
	cmp	ip, #160
	movle	lr, #0
	movgt	lr, #1
	ldr	r1, .L253+40
	ldr	r2, .L253+44
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
	ldr	r8, .L253+48
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
	beq	.L249
	mov	r2, #512
	lsl	r3, r3, #3
	strh	r2, [r7, r3]	@ movhi
.L250:
	mov	r3, #67108864
	ldr	r2, .L253+52
	ldrh	r0, [r2]
	ldr	r1, .L253+56
	strh	r0, [r3, #24]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #26]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #28]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #30]	@ movhi
	ldr	r3, .L253+60
	mov	lr, pc
	bx	r3
	ldr	r4, .L253+64
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L253+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L249:
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
	b	.L250
.L247:
	ldr	ip, [r3, #60]
	ldr	lr, [r3, #64]
	ldr	r0, [r3, #8]
	add	r2, r2, ip, lsl #3
	add	ip, r3, #52
	add	r0, r0, lr, lsl #3
	ldr	r4, [r3, #48]
	ldm	ip, {ip, lr}
	ldr	r7, .L253+32
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
	b	.L248
.L254:
	.align	2
.L253:
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
	ldr	r2, .L259
	ldr	r3, .L259+4
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
	ble	.L256
	ldr	r4, .L259+8
	ldr	lr, .L259+12
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
.L256:
	add	r2, r2, ip
	add	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	pop	{r4, lr}
	bx	lr
.L260:
	.align	2
.L259:
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
	ldr	r5, .L275
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L263
	ldr	r3, .L275+4
	ldr	r2, .L275+8
	ldr	r3, [r3]
	ldr	r2, [r2]
	sub	r3, r3, r2
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, .L275+12
	ldr	r1, .L275+16
	ldr	r2, .L275+20
	ldr	r4, [r0]
	ldr	r0, [r1]
	ldr	r1, .L275+24
	ldr	r7, [r2]
	sub	r4, r4, r0, lsl #1
	ldr	r6, .L275+28
	ldr	r8, [r1]
	lsl	r4, r4, #16
	add	r7, r7, #1
	lsr	r4, r4, #16
	str	r7, [r2]
	mov	r1, r8
	ldr	r2, .L275+32
	strh	r3, [r6, #2]	@ movhi
	mov	r0, r7
	strh	r4, [r6]	@ movhi
	mov	lr, pc
	bx	r2
	add	r1, r8, r8, lsl #1
	cmp	r7, r1, lsl #1
	moveq	r2, #0
	lsl	r0, r0, #7
	add	r0, r0, #82
	orr	r0, r0, #8192
	orreq	r3, r4, #512
	strh	r0, [r6, #4]	@ movhi
	strheq	r3, [r6]	@ movhi
	streq	r2, [r5]
.L263:
	bl	updatePlayer
	ldr	r3, .L275+36
	ldr	r0, [r3]
	cmp	r0, #0
	ldr	r5, .L275+40
	ldr	r4, .L275+44
	ble	.L265
	add	r2, r0, r0, lsl #1
	ldr	r3, .L275+48
	add	r0, r0, r2, lsl #2
	ldrh	lr, [r5]
	ldrh	ip, [r4]
	add	r0, r3, r0, lsl #2
.L266:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	rsb	r1, lr, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	stm	r3, {r1, r2}
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L266
.L265:
	ldr	r0, .L275+52
	bl	updatePieceParent
	ldr	r0, .L275+56
	bl	updatePieceParent
	ldr	r0, .L275+60
	bl	updatePieceParent
	ldr	r0, .L275+64
	bl	updatePieceParent
	ldr	r0, .L275+68
	bl	updatePieceParent
	ldr	r3, .L275+72
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
	ble	.L267
	ldr	r6, .L275+76
	ldr	r5, .L275+80
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
.L268:
	ldr	r4, .L275+84
	ldr	r3, .L275+88
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
.L267:
	add	r1, r1, r4
	add	r2, r2, r0
	stmib	r3, {r1, r2}
	b	.L268
.L276:
	.align	2
.L275:
	.word	windIsOn
	.word	windCol
	.word	windColdel
	.word	windRow
	.word	windRowdel
	.word	windCount
	.word	windFrameRate
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
	.comm	windColdel,4,4
	.comm	windRowdel,4,4
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
	.word	23
	.word	10
	.word	30
	.word	12
	.word	23
	.word	26
	.word	31
	.word	25
	.word	28
	.word	21
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
	.word	42
	.word	20
	.word	42
	.word	21
	.word	42
	.word	22
	.word	42
	.word	23
	.word	42
	.word	24
	.word	43
	.word	20
	.word	43
	.word	21
	.word	43
	.word	24
	.word	44
	.word	13
	.word	44
	.word	14
	.word	44
	.word	15
	.word	44
	.word	16
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
	.word	44
	.word	24
	.word	45
	.word	13
	.word	45
	.word	15
	.word	45
	.word	20
	.word	45
	.word	21
	.word	45
	.word	22
	.word	45
	.word	23
	.word	45
	.word	24
	.type	tempBoardVals3, %object
	.size	tempBoardVals3, 208
tempBoardVals3:
	.word	38
	.word	16
	.word	38
	.word	17
	.word	38
	.word	18
	.word	39
	.word	16
	.word	39
	.word	18
	.word	40
	.word	16
	.word	40
	.word	17
	.word	40
	.word	18
	.word	40
	.word	19
	.word	41
	.word	19
	.word	42
	.word	19
	.word	42
	.word	20
	.word	42
	.word	21
	.word	43
	.word	19
	.word	43
	.word	20
	.word	43
	.word	21
	.word	43
	.word	22
	.word	43
	.word	23
	.word	44
	.word	19
	.word	44
	.word	20
	.word	44
	.word	21
	.word	45
	.word	20
	.word	45
	.word	21
	.word	46
	.word	18
	.word	46
	.word	19
	.word	46
	.word	20
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
