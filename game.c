#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "collisionmap.h"

// Variables
OBJ_ATTR shadowOAM[128];
ANISPRITE player;
boardSquare board[BOARDSQUARECOUNT];
pieceParent pieceParents[PIECEPARENTCOUNT];

/* Sprites
Player = 0
BoardSquares = 1 - 29
PieceKids = parentsNum * 10
*/

int boardSpriteNumStart = 1;

// Animation states for player
enum {DOWN, UP, RIGHT, LEFT, IDLE};

// Background Variables
unsigned short hOff;
unsigned short vOff;

void initGame() {

    initPlayer();
    initBoard();
    initPieceParents();

}

void updateGame() {

	updatePlayer();

    for (int i = 0; i < BOARDSQUARECOUNT; i++) {
		updateBoardSquare(&board[i]);
	}
    for (int i = 0; i < PIECEPARENTCOUNT; i++) {
		updatePieceParent(&pieceParents[i]);
	}
}

void drawGame() {

    drawPlayer();

    for (int i = 0; i < BOARDSQUARECOUNT; i++) {
		drawBoardSquare(&board[i]);
	}
    for (int i = 0; i < PIECEPARENTCOUNT; i++) {
		drawPieceParent(&pieceParents[i]);
	}

    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
    REG_BG2HOFF = hOff / 2;
    REG_BG2VOFF = vOff / 2;

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
    player.palRow = 1;
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
    shadowOAM[0].attr2 = ATTR2_PALROW(player.palRow) | ATTR2_TILEID(
            player.sheetCol + player.aniState * player.width / 8, 
            player.sheetRow + player.curFrame * player.height / 8);
}

void initBoard() {
    int tempBoardVals [10] = {42, 17, 42, 18, 43, 17, 43, 18, 44, 17};

    for (int i = 0; i < BOARDSQUARECOUNT; i++) {
        board[i].worldRow = tempBoardVals[i * 2];
        board[i].worldCol = tempBoardVals[i * 2 + 1];
        board[i].rdel = 0;
        board[i].cdel = 0;
        board[i].width = 8;
        board[i].height = 8;
        board[i].hide = 0;
        board[i].sheetRow = 1;
        board[i].sheetCol = 8;
        board[i].palRow = 0;
        board[i].spriteNum = i + boardSpriteNumStart;
    }

}

void drawBoardSquare(boardSquare* bs) {
    shadowOAM[bs->spriteNum].attr0 = bs->screenRow | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[bs->spriteNum].attr1 = bs->screenCol | ATTR1_TINY;
    shadowOAM[bs->spriteNum].attr2 = ATTR2_PALROW(bs->palRow) | ATTR2_TILEID(
        bs->sheetCol, bs->sheetRow);
}

void updateBoardSquare(boardSquare* bs) {

    bs->screenRow = bs->worldRow * 8 - vOff;
    bs->screenCol = bs->worldCol * 8 - hOff;

}

void initPieceParents() {
    for (int i = 0; i < PIECEPARENTCOUNT; i++) {
        pieceParents[i].numOfActiveKids = 4;
        pieceParents[i].selected = 0;
        pieceParents[i].worldRow = i * 8 + 50;
        pieceParents[i].worldCol = i * 8 + 50;
        pieceParents[i].rdel = 0;
        pieceParents[i].cdel = 0;
        pieceParents[i].width = 0;
        pieceParents[i].height = 0;
        pieceParents[i].hide = 0;
        pieceParents[i].sheetRow = 0;
        pieceParents[i].sheetCol = 9 + i;
        pieceParents[i].palRow = 0;
        pieceParents[i].num = i;

        initPieceKids(&pieceParents[i]);
    }
}

void drawPieceParent(pieceParent* pp) {
    for (int i = 0; i < pp->numOfActiveKids; i++) {
        shadowOAM[pp->kids[i].spriteNum].attr0 = pp->kids[i].rowOffset + pp->screenRow | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[pp->kids[i].spriteNum].attr1 = pp->kids[i].colOffset + pp->screenCol | ATTR1_TINY;
        shadowOAM[pp->kids[i].spriteNum].attr2 = ATTR2_PALROW(pp->palRow) | ATTR2_TILEID(
            pp->sheetCol, pp->sheetRow);
    }
}

void updatePieceParent(pieceParent* pp) {
    pp->screenRow = pp->worldRow * 8 - vOff;
    pp->screenCol = pp->worldCol * 8 - hOff;
}

void initPieceKids(pieceParent* pp) {
    for (int i = 0; i < pp->numOfActiveKids; i++) {
        pp->kids[i].rowOffset = i;
        pp->kids[i].colOffset = 0;
        pp->kids[i].rdel = 0;
        pp->kids[i].cdel = 0;
        pp->kids[i].width = 8;
        pp->kids[i].height = 8;
        pp->kids[i].hide = 0;
        pp->kids[i].spriteNum = (pp->num + 3) * 10 + i;
    }
}