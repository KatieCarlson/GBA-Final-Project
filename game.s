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
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L4
	push	{r4, lr}
	ldm	r2, {r0, r3}
	ldr	r4, .L4+4
	orr	r3, r3, #16384
	strh	r3, [r4, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	ldr	r2, .L4+8
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L4+12
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
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
	ldr	r4, .L8
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #16
	mov	r4, #1
	mov	lr, #135
	mov	ip, #100
	mov	r0, #20
	mov	r1, #7
	ldr	r3, .L8+20
	str	r4, [r3, #12]
	str	lr, [r3]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	ip, [r3, #4]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	83886592
	.word	spritesheet2Pal
	.word	100728832
	.word	spritesheet2Tiles
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
	ldr	r3, .L25
	ldrh	r1, [r3, #48]
	ldr	r3, .L25+4
	tst	r1, #32
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	ldr	r1, [r3, #4]
	bne	.L12
	cmp	r1, r2
	mvngt	r2, #0
	strgt	r2, [r3, #12]
.L12:
	ldr	r2, .L25
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L15
	ldr	r2, [r3, #16]
	add	r2, r1, r2
	cmp	r2, #239
	ble	.L24
.L15:
	ldr	ip, [r3, #12]
.L14:
	ldr	r2, .L25
	ldrh	r2, [r2, #48]
	tst	r2, #64
	ldr	r2, [r3]
	bne	.L16
	cmp	r2, #0
	mvngt	r0, #0
	strgt	r0, [r3, #8]
.L16:
	ldr	r0, .L25
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L19
	ldr	r0, [r3, #20]
	add	r0, r2, r0
	cmp	r0, #159
	bgt	.L19
	str	lr, [sp, #-4]!
	mov	lr, #1
	add	r1, r1, ip
	add	r2, r2, lr
	str	lr, [r3, #8]
	str	r1, [r3, #4]
	str	r2, [r3]
	ldr	lr, [sp], #4
	bx	lr
.L19:
	ldr	r0, [r3, #8]
	add	r1, r1, ip
	add	r2, r2, r0
	str	r1, [r3, #4]
	str	r2, [r3]
	bx	lr
.L24:
	mov	r2, #1
	mov	ip, r2
	str	r2, [r3, #12]
	b	.L14
.L26:
	.align	2
.L25:
	.word	67109120
	.word	player
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
	@ link register save eliminated.
	mov	r1, #0
	ldr	r3, .L29
	ldm	r3, {r0, r2}
	ldr	r3, .L29+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
