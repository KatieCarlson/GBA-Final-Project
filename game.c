#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "collisionmap.h"

// Variables
OBJ_ATTR shadowOAM[128];
ANISPRITE player;

// Animation states for player
enum {DOWN, UP, RIGHT, LEFT, IDLE};

// Background Variables
unsigned short hOff;
unsigned short vOff;

void initGame() {

    initPlayer();

}

void updateGame() {

	updatePlayer();
}

void drawGame() {

    drawPlayer();

    REG_BG2HOFF = hOff;
    REG_BG2VOFF = vOff;
    REG_BG1HOFF = hOff / 2;
    REG_BG1VOFF = vOff / 2;

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void initPlayer() {

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;

    player.worldRow = SCREENHEIGHT/2-player.width/2 + vOff;
    player.worldCol = SCREENWIDTH/2-player.height/2 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = DOWN;
    player.hide = 0;
    player.sheetRow = 0;
    player.sheetCol = 0;
}

// Handle every-frame actions of the player
void updatePlayer() {

    int vOffdel = 0;
    int hOffdel = 0;

    if(BUTTON_HELD(BUTTON_UP)) {
        if (player.screenRow > 0 
        && collisionmapBitmap[OFFSET(player.worldCol, player.worldRow - 1, 256)]
        && collisionmapBitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow - 1, 256)]) {
            player.worldRow -= 1;
            if (vOff > 0 && player.screenRow < 80) {
                vOffdel = -1;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (player.screenRow + player.height < 320
        && collisionmapBitmap[OFFSET(player.worldCol, player.worldRow + player.height, 256)]
        && collisionmapBitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow + player.height, 256)]) {
            player.worldRow += 1;
            if (vOff < 512 - 160 && player.screenRow > 80) {
                vOffdel = 1;
            }
        }
    }
    vOff += vOffdel;
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.screenCol > 0
        && collisionmapBitmap[OFFSET(player.worldCol - 1, player.worldRow, 256)]
        && collisionmapBitmap[OFFSET(player.worldCol - 1, player.worldRow + player.height - 1, 256)]) {
            player.worldCol -=1;
            if (hOff > 0 && player.screenCol < 120) {
                hOffdel = -1;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.screenCol + player.width < 240
        && collisionmapBitmap[OFFSET(player.worldCol + player.width, player.worldRow, 256)]
        && collisionmapBitmap[OFFSET(player.worldCol + player.width, player.worldRow + player.height - 1, 256)]) {
            player.worldCol += 1;
            if (hOff < 256 - 240 && player.screenCol > 120) {
                hOffdel = 1;
            }
        }
    }

    hOff += hOffdel;
    vOff += vOffdel;

    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    animatePlayer();
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    player.prevAniState = player.aniState;
    player.aniState = IDLE;

    // Change the animation frame every 20 frames of gameplay
    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP))
        player.aniState = UP;
    if(BUTTON_HELD(BUTTON_DOWN))
        player.aniState = DOWN;
    if(BUTTON_HELD(BUTTON_LEFT))
        player.aniState = LEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        player.aniState = RIGHT;

    // If the player aniState is idle, frame is player standing
    if (player.aniState == IDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.screenRow | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = player.screenCol | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(
            player.sheetCol + player.aniState * player.width / 8, 
            player.sheetRow + player.curFrame * player.height / 8);
}