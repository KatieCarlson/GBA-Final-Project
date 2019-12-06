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
	ldr	r2, .L42
	mov	r1, #6336
	ldr	r0, .L42+4
	ldr	r5, .L42+8
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
	beq	.L34
	cmp	r3, #1
	mvneq	r2, #0
	beq	.L34
	cmp	r3, #2
	movne	r2, #3
	moveq	r2, #1
.L34:
	ldr	r3, [r4, #20]
	ldr	r1, [r4]
	add	r3, r3, r2
	cmp	r1, #0
	str	r3, [r4, #20]
	ble	.L33
	mov	r0, r4
	mov	r2, #0
.L36:
	ldr	r3, [r0, #72]
	add	r2, r2, #1
	rsb	r3, r3, #3
	cmp	r2, r1
	str	r3, [r0, #72]
	add	r0, r0, #44
	bne	.L36
.L33:
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
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
	mov	r6, #512
	mov	lr, #64
	ldr	r4, .L157
	ldr	r7, .L157+4
	ldr	r5, .L157+8
	sub	sp, sp, #28
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	str	ip, [sp, #4]
	str	ip, [sp]
	str	r6, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [r7]
	str	ip, [r5]
	ldr	ip, .L157+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r6, .L157+16
	beq	.L45
.L47:
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
.L46:
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
	ldr	ip, .L157+12
	mov	lr, pc
	bx	ip
	ldr	r2, .L157+20
	cmp	r0, #0
	ldrne	r3, [r2]
	ldreq	r3, .L157+24
	addne	r3, r3, #1
	streq	r0, [r3]
	strne	r3, [r2]
	ldr	r3, .L157+28
	ldr	r3, [r3]
	streq	r0, [r2]
	cmp	r3, #0
	beq	.L50
	ldr	r3, .L157+32
	ldrh	r1, [r3]
	tst	r1, #1
	bne	.L149
.L51:
	ldr	r3, [r6]
	cmp	r3, #80
	ble	.L54
	ldr	r3, .L157+36
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L52
.L54:
	tst	r1, #512
	beq	.L58
	ldr	r3, .L157+40
	ldrh	r3, [r3]
	tst	r3, #512
	bne	.L58
	ldr	r3, .L157+24
.L59:
	mov	r2, #1
	ldr	r4, .L157+44
	str	r2, [r3]
	add	r5, r4, #1872
	add	r5, r5, #8
.L62:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movgt	r0, r4
	blgt	flipPiece
.L61:
	add	r4, r4, #376
	cmp	r5, r4
	bne	.L62
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L50:
	ldr	r3, [r6]
	cmp	r3, #80
	ble	.L58
	ldr	r3, .L157+36
	ldr	r1, [r3]
	cmp	r1, #0
	bne	.L58
.L52:
	mov	r2, #1
	ldr	r4, .L157+44
	str	r2, [r3]
	add	r5, r4, #1872
	add	r5, r5, #8
.L56:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movgt	r0, r4
	blgt	turnPiece
.L55:
	add	r4, r4, #376
	cmp	r5, r4
	bne	.L56
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L58:
	ldr	r3, [r2]
	cmp	r3, #80
	bgt	.L150
.L60:
	ldr	r3, .L157+48
	ldrh	r3, [r3, #48]
	ands	r2, r3, #64
	ldr	r3, .L157+52
	movne	r2, #0
	ldrh	r3, [r3]
	bne	.L64
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L64
	ldr	ip, [r4, #8]
	ldr	r8, [r4, #12]
	sub	ip, ip, #1
	lsl	lr, ip, #8
	add	r2, lr, r8
	ldr	r6, .L157+56
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	cmp	r2, #0
	beq	.L64
	ldr	r2, [r4, #24]
	add	r2, lr, r2
	add	r2, r2, r8
	add	r2, r6, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	bne	.L151
.L64:
	ldr	r1, .L157+48
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L144
	ldr	r9, [r4]
	ldr	r1, [r4, #28]
	add	ip, r9, r1
	cmp	ip, #320
	blt	.L67
.L144:
	lsl	r2, r2, #16
	lsr	r1, r2, #16
.L66:
	add	r3, r1, r3
	ldr	r2, .L157+52
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2]	@ movhi
	ldr	r2, .L157+48
	ldrh	r2, [r2, #48]
	ldr	r0, .L157+60
	ands	r2, r2, #32
	ldrh	r0, [r0]
	movne	r2, #0
	bne	.L70
	ldr	ip, [r4, #4]
	cmp	ip, #0
	ble	.L70
	add	r6, r4, #8
	ldm	r6, {r6, lr}
	sub	lr, lr, #1
	add	r2, lr, r6, lsl #8
	ldr	r7, .L157+56
	lsl	r2, r2, #1
	ldrh	r2, [r7, r2]
	cmp	r2, #0
	beq	.L70
	ldr	r2, [r4, #28]
	add	r2, r6, r2
	sub	r2, r2, #1
	add	r2, lr, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r7, r2]
	cmp	r2, #0
	bne	.L152
.L70:
	ldr	ip, .L157+48
	ldrh	ip, [ip, #48]
	tst	ip, #16
	bne	.L145
	ldr	r10, [r4, #4]
	ldr	ip, [r4, #24]
	add	r6, r10, ip
	cmp	r6, #239
	ble	.L73
.L145:
	lsl	r2, r2, #16
	lsr	r2, r2, #16
.L72:
	ldr	ip, .L157+32
	add	r3, r3, r1
	ldrh	r1, [ip]
	add	r2, r2, r0
	lsl	r2, r2, #16
	tst	r1, #2
	ldr	r1, .L157+60
	lsr	r2, r2, #16
	strh	r2, [r1]	@ movhi
	lsl	r3, r3, #16
	ldr	r1, .L157+52
	lsr	r3, r3, #16
	strh	r3, [r1]	@ movhi
	beq	.L148
	ldr	r1, .L157+40
	ldrh	r1, [r1]
	ands	r6, r1, #2
	bne	.L148
	ldr	r5, .L157+44
	mov	r3, r5
.L89:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bgt	.L153
	add	r6, r6, #1
	cmp	r6, #5
	add	r3, r3, #376
	bne	.L89
	mov	r3, #0
	str	r3, [sp, #20]
	b	.L88
.L150:
	ldr	r3, .L157+24
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L60
	b	.L59
.L149:
	ldr	r3, .L157+40
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L51
	ldr	r3, .L157+36
	b	.L52
.L92:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	bne	.L102
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
	ldr	ip, .L157+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L101
.L147:
	ldr	r3, .L157+52
	ldr	r2, .L157+60
	ldrh	r3, [r3]
	ldrh	r2, [r2]
.L148:
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
.L77:
	sub	r3, r1, r3
	sub	r2, r0, r2
	str	r3, [r4]
	str	r2, [r4, #4]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L45:
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
	ldr	ip, .L157+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L47
	ldr	r3, .L157+36
	str	r0, [r6]
	str	r0, [r3]
	b	.L46
.L73:
	add	r7, r4, #8
	ldm	r7, {r7, r8}
	add	ip, ip, r8
	add	r6, ip, r7, lsl #8
	ldr	r9, .L157+56
	lsl	r6, r6, #1
	ldrh	r6, [r9, r6]
	cmp	r6, #0
	beq	.L145
	ldr	r6, [r4, #28]
	add	r6, r7, r6
	sub	r6, r6, #1
	add	ip, ip, r6, lsl #8
	lsl	ip, ip, #1
	ldrh	ip, [r9, ip]
	cmp	ip, #0
	beq	.L145
	cmp	r10, #120
	movle	lr, #0
	movgt	lr, #1
	cmp	r0, #15
	mov	ip, #1
	movhi	lr, #0
	add	r8, r8, ip
	cmp	lr, #0
	str	r8, [r4, #12]
	str	ip, [r5]
	movne	r2, ip
	beq	.L145
	b	.L72
.L67:
	add	ip, r4, #8
	ldm	ip, {ip, lr}
	add	r1, r1, ip
	lsl	r1, r1, #8
	add	r6, r1, lr
	ldr	r8, .L157+56
	lsl	r6, r6, #1
	ldrh	r6, [r8, r6]
	cmp	r6, #0
	beq	.L144
	ldr	r6, [r4, #24]
	add	r1, r1, r6
	add	lr, r1, lr
	add	lr, r8, lr, lsl #1
	ldrh	r1, [lr, #-2]
	cmp	r1, #0
	beq	.L144
	cmp	r9, #80
	movle	r0, #0
	movgt	r0, #1
	cmp	r3, #352
	movcs	r0, #0
	mov	r1, #1
	cmp	r0, #0
	add	ip, ip, r1
	str	r1, [r7]
	lsleq	r1, r2, #16
	str	ip, [r4, #8]
	lsreq	r1, r1, #16
	b	.L66
.L153:
	mov	r3, #0
	ldr	r2, .L157+64
	mov	r1, #2592
	ldr	r0, .L157+68
	ldr	r7, .L157+72
	mov	lr, pc
	bx	r7
	mov	r2, #0
	add	r3, r6, r6, lsl #1
	rsb	r6, r6, r3, lsl #4
	ldr	r3, .L157+44
	add	r6, r3, r6, lsl #3
	add	r1, r6, #24
	ldm	r1, {r1, r3}
	subs	r0, r2, r1
	and	r0, r0, #7
	ldr	lr, .L157+76
	and	ip, r1, #7
	rsbpl	ip, r0, #0
	subs	r0, r2, r3
	and	r0, r0, #7
	ldr	lr, [lr]
	sub	r1, r1, ip
	and	ip, r3, #7
	rsbpl	ip, r0, #0
	ldr	r0, .L157+80
	sub	r3, r3, ip
	cmp	lr, r2
	str	lr, [sp, #20]
	str	r1, [r6, #24]
	str	r3, [r6, #28]
	str	r2, [r6, #4]
	ldr	fp, [r0]
	ble	.L80
	mov	r0, fp
	str	r2, [sp, #16]
	ldr	r10, .L157+84
.L81:
	mov	r7, r5
	mov	fp, #0
.L87:
	ldr	r6, [r7]
	cmp	r6, #0
	ble	.L86
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
.L83:
	ldr	r3, [ip, #72]
	add	r3, r8, r3
	add	r3, r3, lr
	cmp	r9, r3
	bne	.L82
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
.L82:
	add	ip, ip, #44
	cmp	r6, ip
	bne	.L83
.L86:
	ldr	r3, .L157+88
	add	fp, fp, #376
	cmp	fp, r3
	add	r7, r7, #376
	bne	.L87
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [sp, #16]
	add	r10, r10, #52
	bne	.L81
	mov	fp, r0
.L80:
	ldr	r3, .L157+92
	str	fp, [r3]
	mov	r3, #1
	str	r3, [sp, #20]
.L88:
	ldr	fp, .L157+96
	ldr	r3, [fp]
	cmp	r3, #0
	ble	.L93
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
	ldr	r2, .L157+56
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	bne	.L154
.L93:
	ldr	r3, [sp, #20]
	cmp	r3, #1
	streq	r3, [sp, #16]
	beq	.L92
	ldr	r7, [sp, #20]
	b	.L91
.L114:
	ldr	r3, [sp, #20]
	str	r3, [sp, #16]
.L146:
	mov	r3, #1
.L95:
	add	r7, r7, #1
	cmp	r7, #4
	movgt	r3, #0
	andle	r3, r3, #1
	cmp	r3, #0
	beq	.L92
.L91:
	lsl	r9, r7, #1
	add	r3, r9, r7
	ldr	r2, .L157+44
	rsb	r3, r7, r3, lsl #4
	add	r2, r2, r3, lsl #3
	ldr	r5, [r2, #4]
	cmp	r5, #0
	bne	.L114
	ldr	r2, .L157+44
	ldr	r10, [r2, r3, lsl #3]
	cmp	r10, #0
	str	r5, [sp, #16]
	ble	.L146
.L96:
	mov	r3, #2
	mov	ip, #8
	add	r8, r9, r7
	add	r2, r5, r5, lsl r3
	rsb	r8, r7, r8, lsl #4
	ldr	r1, .L157+44
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
	ldr	ip, .L157+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	add	r5, r5, #1
	bne	.L155
	cmp	r10, r5
	bgt	.L96
	ldr	r3, [sp, #16]
	eor	r3, r3, #1
	and	r3, r3, #1
	b	.L95
.L155:
	mov	r3, #0
	str	r5, [r6, #4]
	ldr	r2, .L157+64
	mov	r1, #7488
	ldr	r0, .L157+100
	ldr	ip, .L157+72
	mov	lr, pc
	bx	ip
	ldr	r3, .L157+44
	ldr	r5, [r3, r8, lsl #3]
	add	r5, r5, #1
	cmp	r10, r5
	ble	.L156
	mov	r3, #1
	mov	r7, #5
	str	r3, [sp, #16]
	mov	r9, #10
	b	.L96
.L156:
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
.L102:
	ldr	r3, .L157+52
	ldr	r2, .L157+60
	ldrh	r3, [r3]
	ldrh	r2, [r2]
	b	.L77
.L151:
	cmp	r0, #79
	movgt	r2, #0
	movle	r2, #1
	cmp	r3, #0
	moveq	r2, #0
	mvn	r1, #0
	rsb	r2, r2, #0
	str	ip, [r4, #8]
	str	r1, [r7]
	b	.L64
.L152:
	cmp	ip, #119
	movgt	r2, #0
	movle	r2, #1
	cmp	r0, #0
	moveq	r2, #0
	mvn	ip, #0
	rsb	r2, r2, #0
	str	lr, [r4, #12]
	str	ip, [r5]
	b	.L70
.L154:
	mov	r3, #0
	ldr	r2, .L157+64
	mov	r1, #2592
	ldr	r0, .L157+68
	ldr	r5, .L157+72
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
	bne	.L147
	add	r2, r3, #7
	cmp	r3, lr
	movlt	r3, r2
	ldr	r2, [fp, #16]
	add	r3, r2, r3, asr #3
	cmp	r3, #9
	moveq	r3, #1
	ldreq	r2, .L157+28
	streq	r3, [r2]
	b	.L147
.L101:
	mov	ip, #1
	ldr	r1, [sp, #16]
	ldr	r0, .L157+28
	mov	r3, r1
	str	r1, [r0]
	ldr	r2, .L157+64
	mov	r1, #7488
	ldr	r0, .L157+100
	ldr	r5, .L157+72
	str	ip, [fp]
	mov	lr, pc
	bx	r5
	b	.L147
.L158:
	.align	2
.L157:
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
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initBoard
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoard, %function
initBoard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #212
	ldr	r3, .L164
	mov	r0, sp
	mov	r2, #208
	ldr	r1, .L164+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L164+8
	ldr	r5, [r3]
	cmp	r5, #0
	ble	.L160
	mov	r2, sp
	mov	r0, #0
	mov	ip, #8
	mov	r7, #1
	mov	r6, #16
	ldr	r1, [r3, #4]
	ldr	r3, .L164+12
	add	r5, r5, r1
.L161:
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
	bne	.L161
.L160:
	mov	r6, #116
	mov	r5, #96
	mov	r1, #64
	mov	r4, #0
	mov	lr, #22
	mov	ip, #2
	mov	r0, #127
	ldr	r3, .L164+16
	ldrh	r2, [r3]
	ldr	r3, .L164+20
	sub	r2, r6, r2
	str	r2, [r3, #4]
	ldr	r2, .L164+24
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
	add	sp, sp, #212
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L165:
	.align	2
.L164:
	.word	memcpy
	.word	.LANCHOR1
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
	beq	.L167
	mov	r1, #512
	ldr	r3, .L172
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L167:
	push	{r4, r5, lr}
	add	r1, r0, #40
	ldr	r5, [r0, #36]
	ldm	r1, {r1, r4}
	ldr	ip, [r0, #4]
	ldr	lr, .L172
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
.L173:
	.align	2
.L172:
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
	ldr	r2, .L175
	ldr	r3, .L175+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	ip, [r0, #8]
	ldr	r1, [r0, #12]
	rsb	r2, r2, ip, lsl #3
	rsb	r3, r3, r1, lsl #3
	stm	r0, {r2, r3}
	bx	lr
.L176:
	.align	2
.L175:
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #20
	mov	r5, #30
	mov	r6, #17
	mov	r10, #12
	mov	r4, #0
	mov	ip, #8
	ldr	r2, .L184
	ldr	r3, .L184+4
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	ldr	r1, .L184+8
	sub	sp, sp, #20
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	str	r1, [sp]
	ldr	r0, .L184+12
	rsb	r8, r2, #160
	rsb	r7, r3, #96
	add	fp, r1, r9
.L180:
	ldr	r3, [sp]
	ldr	lr, [r3], #4
	str	r3, [sp]
	mov	r3, #32
	cmp	lr, #0
	str	r4, [r0, #4]
	str	r9, [r0, #16]
	str	r10, [r0, #20]
	str	r8, [r0, #8]
	str	r7, [r0, #12]
	str	r3, [r0, #44]
	str	r3, [r0, #40]
	str	r4, [r0, #24]
	str	r4, [r0, #28]
	str	r4, [r0, #52]
	str	r6, [r0, #56]
	str	r4, [r0, #60]
	str	r5, [r0, #64]
	str	lr, [r0]
	ble	.L178
	mov	r1, r5
	mov	r3, r0
	mov	r2, fp
	str	r0, [sp, #4]
	add	lr, lr, r5
.L179:
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
	bne	.L179
	ldr	r0, [sp, #4]
.L178:
	add	r6, r6, #1
	cmp	r6, #22
	add	r0, r0, #376
	add	r9, r9, #4
	add	r10, r10, #2
	add	r8, r8, #32
	add	r7, r7, #16
	add	r5, r5, #10
	add	fp, fp, #56
	bne	.L180
	mov	r2, #0
	mov	r4, #2
	mov	lr, #19
	mov	ip, #8
	mov	r6, #1
	mov	r5, #88
	ldr	r1, [sp, #8]
	rsb	r0, r1, #16
	ldr	r1, [sp, #12]
	ldr	r3, .L184+16
	rsb	r1, r1, #152
	stmib	r3, {r0, r1}
	str	r6, [r3, #48]
	str	r5, [r3, #68]
	str	r2, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r4, [r3, #12]
	str	r4, [r3, #56]
	str	lr, [r3, #16]
	str	lr, [r3, #52]
	str	ip, [r3, #36]
	str	ip, [r3, #40]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L185:
	.align	2
.L184:
	.word	vOff
	.word	hOff
	.word	.LANCHOR0+8
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
	ldr	r2, .L188
	ldr	ip, .L188+4
	ldr	r2, [r2]
	ldr	r0, .L188+8
	push	{r4, lr}
	str	r2, [ip]
	str	r2, [r0]
	ldr	lr, .L188+12
	ldr	ip, .L188+16
	ldr	r0, .L188+20
	ldr	r2, .L188+24
	strh	r3, [lr]	@ movhi
	str	r3, [ip]
	ldr	lr, .L188+28
	str	r3, [r0]
	str	r3, [r2]
	ldr	ip, .L188+32
	ldr	r0, .L188+36
	ldr	r2, .L188+40
	ldr	r4, .L188+44
	str	r3, [lr]
	strh	r3, [r4]	@ movhi
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	bl	initPlayer
	bl	initBoard
	pop	{r4, lr}
	b	initPieceParents
.L189:
	.align	2
.L188:
	.word	.LANCHOR0
	.word	fitted
	.word	fittedReset
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
	ble	.L190
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
	ldr	r4, .L197
	ldr	r8, .L197+4
	lsr	r6, r6, #16
	b	.L194
.L193:
	add	ip, ip, #1
	cmp	ip, r5
	add	r1, r1, #44
	beq	.L190
.L194:
	ldr	r3, [r1, #108]
	cmp	lr, #0
	lsl	r2, r3, #3
	strhne	r7, [r4, r2]	@ movhi
	bne	.L193
	ldr	r2, [r1, #72]
	ldr	r9, [r0, #12]
	ldr	r10, [r1, #68]
	ldr	fp, [r0, #52]
	add	r9, r9, r2, lsl #3
	ldr	r2, [r0, #56]
	add	r10, r6, r10, lsl #3
	add	r2, r2, fp, lsl #5
	ldr	fp, [r0, #60]
	lsl	r3, r3, #3
	and	r10, r10, #255
	add	ip, ip, #1
	and	r9, r9, r8
	orr	r2, r2, fp, lsl #12
	strh	r10, [r4, r3]	@ movhi
	cmp	ip, r5
	add	r3, r4, r3
	strh	r9, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	add	r1, r1, #44
	bne	.L194
.L190:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L198:
	.align	2
.L197:
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
	ldr	r6, .L208
	bl	drawPlayer
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L200
	mov	r5, #0
	ldr	r4, .L208+4
.L201:
	mov	r0, r4
	bl	drawBoardSquare
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #52
	bgt	.L201
.L200:
	ldr	r0, .L208+8
	bl	drawPieceParent
	ldr	r0, .L208+12
	bl	drawPieceParent
	ldr	r0, .L208+16
	bl	drawPieceParent
	ldr	r0, .L208+20
	bl	drawPieceParent
	ldr	r0, .L208+24
	bl	drawPieceParent
	ldr	r3, .L208+28
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
	beq	.L202
	mov	r3, #512
	ldr	r7, .L208+32
	lsl	r1, r1, #3
	strh	r3, [r7, r1]	@ movhi
.L203:
	ldr	r0, .L208+36
	ldr	ip, [r0, #4]
	cmp	ip, #160
	movle	lr, #0
	movgt	lr, #1
	ldr	r3, .L208+40
	ldr	r2, .L208+44
	ldr	r1, [r3]
	smull	r4, r5, r1, r2
	ldr	r3, [r0, #40]
	rsb	r3, r3, #0
	cmp	ip, r3
	orrlt	lr, lr, #1
	add	r4, r1, r5
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
	ldr	r8, .L208+48
	rsb	r5, r5, r5, lsl #4
	sub	r5, r10, r5, lsl #3
	add	r2, r2, r2, lsl #1
	ldr	r4, [r8, r5, lsl #2]
	rsb	r2, r2, r2, lsl #4
	sub	r2, r1, r2, lsl #3
	ldr	r5, [r8, r2, lsl #2]
	ldr	r1, [r6, #308]
	ldr	r2, [r8, r3, lsl #2]
	lsl	r3, r4, #16
	asr	r3, r3, #16
	cmp	lr, #0
	strh	r3, [r1, #6]	@ movhi
	strh	r3, [r1, #30]	@ movhi
	strh	r5, [r1, #14]	@ movhi
	strh	r2, [r1, #22]	@ movhi
	ldr	r3, [r0, #68]
	beq	.L204
	mov	r2, #512
	lsl	r3, r3, #3
	strh	r2, [r7, r3]	@ movhi
.L205:
	mov	r3, #67108864
	ldr	r2, .L208+52
	ldrh	r0, [r2]
	ldr	r1, .L208+56
	strh	r0, [r3, #24]	@ movhi
	ldrh	r0, [r1]
	strh	r0, [r3, #26]	@ movhi
	ldrh	r2, [r2]
	lsr	r2, r2, #1
	strh	r2, [r3, #28]	@ movhi
	ldrh	r2, [r1]
	lsr	r2, r2, #1
	strh	r2, [r3, #30]	@ movhi
	ldr	r3, .L208+60
	mov	lr, pc
	bx	r3
	ldr	r4, .L208+64
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L208+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L204:
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
	b	.L205
.L202:
	ldr	ip, [r3, #60]
	ldr	lr, [r3, #64]
	ldr	r0, [r3, #8]
	add	r2, r2, ip, lsl #3
	add	ip, r3, #52
	add	r0, r0, lr, lsl #3
	ldr	r4, [r3, #48]
	ldm	ip, {ip, lr}
	ldr	r7, .L208+32
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
	b	.L203
.L209:
	.align	2
.L208:
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
	ldr	r2, .L214
	ldr	r3, .L214+4
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
	ble	.L211
	ldr	r4, .L214+8
	ldr	lr, .L214+12
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
.L211:
	add	r2, r2, ip
	add	r3, r3, r1
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	pop	{r4, lr}
	bx	lr
.L215:
	.align	2
.L214:
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
	ldr	r5, .L230
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L218
	ldr	r2, .L230+4
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L230+8
	ldr	r2, [r2]
	ldr	ip, [r1]
	ldr	r1, .L230+12
	ldr	r0, .L230+16
	rsb	r2, r2, ip, lsl #1
	ldr	r8, [r1]
	sub	r2, r2, #32
	ldr	r7, .L230+20
	ldr	r4, [r0]
	lsl	r6, r2, #16
	add	r8, r8, #1
	lsr	r6, r6, #16
	ldr	r2, .L230+24
	str	r8, [r1]
	strh	r3, [r7, #2]	@ movhi
	mov	r1, r4
	mov	r0, r8
	strh	r6, [r7]	@ movhi
	mov	lr, pc
	bx	r2
	add	r4, r4, r4, lsl #1
	cmp	r8, r4, lsl #1
	moveq	r3, #0
	lsl	r0, r0, #7
	add	r0, r0, #82
	orr	r0, r0, #8192
	orreq	r2, r6, #512
	strh	r0, [r7, #4]	@ movhi
	strheq	r2, [r7]	@ movhi
	streq	r3, [r5]
.L218:
	bl	updatePlayer
	ldr	r3, .L230+28
	ldr	r0, [r3]
	cmp	r0, #0
	ldr	r5, .L230+32
	ldr	r4, .L230+36
	ble	.L220
	add	r2, r0, r0, lsl #1
	ldr	r3, .L230+40
	add	r0, r0, r2, lsl #2
	ldrh	lr, [r5]
	ldrh	ip, [r4]
	add	r0, r3, r0, lsl #2
.L221:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	rsb	r1, lr, r1, lsl #3
	rsb	r2, ip, r2, lsl #3
	stm	r3, {r1, r2}
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L221
.L220:
	ldr	r0, .L230+44
	bl	updatePieceParent
	ldr	r0, .L230+48
	bl	updatePieceParent
	ldr	r0, .L230+52
	bl	updatePieceParent
	ldr	r0, .L230+56
	bl	updatePieceParent
	ldr	r0, .L230+60
	bl	updatePieceParent
	ldr	r3, .L230+64
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
	ble	.L222
	ldr	r6, .L230+68
	ldr	r5, .L230+72
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
.L223:
	ldr	r4, .L230+76
	ldr	r3, .L230+80
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
.L222:
	add	r1, r1, r4
	add	r2, r2, r0
	stmib	r3, {r1, r2}
	b	.L223
.L231:
	.align	2
.L230:
	.word	windIsOn
	.word	player
	.word	windRow
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
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	BOARDSQUARECOUNT, %object
	.size	BOARDSQUARECOUNT, 4
BOARDSQUARECOUNT:
	.word	26
	.type	boardSpriteNumStart, %object
	.size	boardSpriteNumStart, 4
boardSpriteNumStart:
	.word	100
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
