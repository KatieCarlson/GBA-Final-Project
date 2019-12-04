#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "collisionmap.h"

#include "sound.h"
#include "MainGameTheme.h"
#include "BlockDownSFX.h"
#include "BlockTurnSFX.h"
#include "BlockUpSFX.h"

// Variables
OBJ_ATTR shadowOAM[128];
ANISPRITE player;
int BOARDSQUARECOUNT = 16;
boardSquare board[16];
pieceParent pieceParents[PIECEPARENTCOUNT];

/* Sprites
Player = 0
BoardSquares = 100 - 128
PieceKids = parentsNum * 10
*/

int boardSpriteNumStart = 100;
int vselDel;
int hselDel;
int fittedReset;
int fitted;

// Animation states for player
enum {DOWN, UP, RIGHT, LEFT, IDLE};

// Background Variables
unsigned short hOff;
unsigned short vOff;

void initGame() {

    vOff = 0;
    hOff = 0;

    fitted = BOARDSQUARECOUNT;
    fittedReset = BOARDSQUARECOUNT;

    initPlayer();
    initBoard();
    initPieceParents();

}

void updateGame() {

	updatePlayer();
    //playSoundB(BlockTurnSFX, BLOCKTURNSFXLEN, BLOCKTURNSFXFREQ, 0);

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

    REG_BG2HOFF = hOff;
    REG_BG2VOFF = vOff;
    REG_BG3HOFF = hOff / 2;
    REG_BG3VOFF = vOff / 2;

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void initPlayer() {

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    player.width = 32;
    player.height = 32;
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

    vselDel = 0;
    hselDel = 0;

    if(BUTTON_PRESSED(BUTTON_A)) {

        for (int i = 0; i < PIECEPARENTCOUNT; i++) {
            if (pieceParents[i].selected > 0) {
                turnPiece(&pieceParents[i]);
            }
        }

    } else {

        if(BUTTON_HELD(BUTTON_UP)) {
            if (player.screenRow > 0 
            && collisionmapBitmap[OFFSET(player.worldCol, player.worldRow - 1, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow - 1, 256)]) {
                player.worldRow -= 1;
                vselDel = -1;
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
                vselDel = 1;
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
                player.worldCol -= 1;
                hselDel = -1;
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
                hselDel = 1;
                if (hOff < 256 - 240 && player.screenCol > 120) {
                    hOffdel = 1;
                }
            }
        }

        hOff += hOffdel;
        vOff += vOffdel;

        // Check for collision with pieces
        if(BUTTON_PRESSED(BUTTON_B)){
            for (int i = 0; i < PIECEPARENTCOUNT; i++) {
                if (pieceParents[i].selected == 0) {
                    for (int j = 0; j < pieceParents[i].numOfActiveKids; j++) {
                        int r = (pieceParents[i].worldRow + pieceParents[i].kids[j].rowOffset) * 8 + pieceParents[i].vOffset;
                        int c = (pieceParents[i].worldCol + pieceParents[i].kids[j].colOffset) * 8 + pieceParents[i].hOffset;
                        if (collision(player.worldCol, player.worldRow, 2, 2, c, r, 8, 8)){
                            pieceParents[i].selected = j + 1;
                            playSoundB(BlockUpSFX, BLOCKUPSFXLEN, BLOCKUPSFXFREQ, 0);
                        }
                    }
                } else {
                    playSoundB(BlockDownSFX, BLOCKDOWNSFXLEN, BLOCKDOWNSFXFREQ, 0);
                    pieceParents[i].selected = 0;
                    pieceParents[i].vOffset -= (pieceParents[i].vOffset) % 8;
                    pieceParents[i].hOffset -= (pieceParents[i].hOffset) % 8;
                    
                    int f = fittedReset;
                    for (int x = 0; x < BOARDSQUARECOUNT; x++) {
                        for (int pp = 0; pp < PIECEPARENTCOUNT; pp++) {
                            for (int j = 0; j < pieceParents[pp].numOfActiveKids; j++) {
                                if (board[x].worldCol == (pieceParents[pp].worldCol + pieceParents[pp].kids[j].colOffset) + pieceParents[pp].hOffset / 8 
                                && board[x].worldRow == (pieceParents[pp].worldRow + pieceParents[pp].kids[j].rowOffset) + pieceParents[pp].vOffset / 8){
                                    f--;
                                }
                            }
                        }
                    }
                    fitted = f;
                }
            }
        }

        player.screenRow = player.worldRow - vOff;
        player.screenCol = player.worldCol - hOff;

    }

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
    shadowOAM[0].attr1 = player.screenCol | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_PALROW(player.palRow) | ATTR2_TILEID(
            player.sheetCol + player.aniState * player.width / 8, 
            player.sheetRow + player.curFrame * player.height / 8);
}

void turnPiece(pieceParent* pp) {
    pieceKid kid = pp->kids[pp->selected - 1];
    int c = kid.colOffset;
    int r = kid.rowOffset;

    //reset Parent x and y values
    pp->worldRow += (- c + r);
    pp->worldCol += (-3 + c + r);

    //reset kid values
    for (int i = 0; i < pp->numOfActiveKids; i++) {
        int tempCol = pp->kids[i].colOffset;
        pp->kids[i].colOffset = 3 - pp->kids[i].rowOffset;
        pp->kids[i].rowOffset = tempCol;
    }
}

void initBoard() {
    int tempBoardVals [32] = {42, 17, 42, 18, 42, 19, 42, 20, 
                              43, 17, 43, 18, 43, 19, 43, 20, 
                              44, 17, 44, 18, 44, 19, 44, 20,
                              45, 17, 45, 18, 45, 19, 45, 20};
    
    //int tempBoardVals [8] = {42, 17, 43, 17, 44, 17, 45, 17};

    for (int i = 0; i < BOARDSQUARECOUNT; i++) {
        board[i].worldRow = tempBoardVals[i * 2];
        board[i].worldCol = tempBoardVals[i * 2 + 1];
        board[i].rdel = 0;
        board[i].cdel = 0;
        board[i].width = 8;
        board[i].height = 8;
        board[i].hide = 0;
        board[i].sheetRow = 1;
        board[i].sheetCol = 16;
        board[i].palRow = 0;
        board[i].spriteNum = i + boardSpriteNumStart;
    }

}

void drawBoardSquare(boardSquare* bs) {
    if (bs->screenRow < 0 - bs->height || bs->screenRow > 160) {
        shadowOAM[bs->spriteNum].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[bs->spriteNum].attr0 = (ROWMASK & bs->screenRow) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[bs->spriteNum].attr1 = (COLMASK & bs->screenCol) | ATTR1_TINY;
        shadowOAM[bs->spriteNum].attr2 = ATTR2_PALROW(bs->palRow) | ATTR2_TILEID(
            bs->sheetCol, bs->sheetRow);
    }
}

void updateBoardSquare(boardSquare* bs) {
    bs->screenRow = bs->worldRow * 8 - vOff;
    bs->screenCol = bs->worldCol * 8 - hOff;
}

void initPieceParents() {
    for (int i = 0; i < PIECEPARENTCOUNT; i++) {
        pieceParents[i].numOfActiveKids = 4;
        pieceParents[i].selected = 0;
        pieceParents[i].worldRow = 25;
        pieceParents[i].worldCol = 16 + i;
        pieceParents[i].screenRow = pieceParents[i].worldRow * 8 - vOff;
        pieceParents[i].screenCol = pieceParents[i].worldCol * 8 - hOff;
        pieceParents[i].height = 32;
        pieceParents[i].width = 32;
        pieceParents[i].vOffset = 0;
        pieceParents[i].hOffset = 0;
        pieceParents[i].sheetRow = 0;
        pieceParents[i].sheetCol = 17 + i;
        pieceParents[i].palRow = 0;
        pieceParents[i].num = i * 10 + 30;

        for (int j = 0; j < pieceParents[i].numOfActiveKids; j++) {
            pieceParents[i].kids[j].rowOffset = j;
            pieceParents[i].kids[j].colOffset = 0;
            pieceParents[i].kids[j].width = 8;
            pieceParents[i].kids[j].height = 8;
            pieceParents[i].kids[j].spriteNum = i * 10 + 30 + j;
        }
    }
}

void drawPieceParent(pieceParent* pp) {
    for (int i = 0; i < pp->numOfActiveKids; i++) {
        // if screenrow or screen col aren't within 0 - 160
        if (pp->screenRow < 0 - pp->height || pp->screenRow > 160) {
            shadowOAM[pp->kids[i].spriteNum].attr0 = ATTR0_HIDE;
        } else {
            shadowOAM[pp->kids[i].spriteNum].attr0 = (ROWMASK & (pp->kids[i].rowOffset * 8 + pp->screenRow)) | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[pp->kids[i].spriteNum].attr1 = (COLMASK & (pp->kids[i].colOffset * 8 + pp->screenCol)) | ATTR1_TINY;
            shadowOAM[pp->kids[i].spriteNum].attr2 = ATTR2_PALROW(pp->palRow) | ATTR2_TILEID(pp->sheetCol, pp->sheetRow);
        }
    }
}

void updatePieceParent(pieceParent* pp) {
    if (pp->selected > 0) {
        pp->vOffset += vselDel;
        pp->hOffset += hselDel;
        pp->screenRow = pp->worldRow * 8 - vOff + pp->vOffset;
        pp->screenCol = pp->worldCol * 8 - hOff + pp->hOffset;
    } else {
        pp->screenRow = pp->worldRow * 8 - vOff + pp->vOffset;
        pp->screenCol = pp->worldCol * 8 - hOff + pp->hOffset;
    }
}