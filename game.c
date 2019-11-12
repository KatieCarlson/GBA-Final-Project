#include "myLib.h"
#include "game.h"
#include "spritesheet2.h"

// Variables
OBJ_ATTR shadowOAM[128];
ANISPRITE player;

void initGame() {

    initPlayer();

}

void updateGame() {

	updatePlayer();
}

void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void initPlayer() {

    DMANow(3, spritesheet2Pal, SPRITEPALETTE, 256);
	DMANow(3, spritesheet2Tiles, &CHARBLOCK[4], spritesheet2TilesLen / 2);

    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.row = 135;
    player.col = 100;
    player.bulletTimer = 20;
    player.score = 7;
}

void updatePlayer() {
    player.cdel = 0;
    player.rdel = 0;

    // action listeners for movement button input
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if(player.col > 0) {
            player.cdel = -1;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if(player.col + player.width < 240) {
            player.cdel = 1;
        }
    }
    if(BUTTON_HELD(BUTTON_UP)) {
        if(player.row > 0) {
            player.rdel = -1;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if(player.row + player.height < 160) {
            player.rdel = 1;
        }
    }

    // update the row and column attribute
    player.col += player.cdel;
    player.row += player.rdel;
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
}