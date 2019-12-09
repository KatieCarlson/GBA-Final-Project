#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "collisionmap.h"
#include "sine.h"

#include "sound.h"
#include "MainGameTheme.h"
#include "DubstepGameTheme.h"
#include "CheatChime.h"
#include "WindEffect.h"
#include "BlockDownSFX.h"
#include "BlockTurnSFX.h"
#include "BlockUpSFX.h"

// Variables
OBJ_ATTR shadowOAM[128];
ANISPRITE player;
int BOARDSQUARECOUNT = 26;
boardSquare board[26];
pieceParent pieceParents[PIECEPARENTCOUNT];

// row, col
int numOfPieces [5] = {7, 7, 5, 2, 5};
int pieces [70] = {0,0,  1,0,  2,0,  3,0,  3,1,  3,2,  2,2,
                   1,0,  1,1,  1,2,  1,3,  0,3,  2,2,  3,2,
                   0,0,  1,0,  2,0,  3,0,  2,1,  0,0,  0,0,
                   0,0,  0,1,  0,0,  0,0,  0,0,  0,0,  0,0,
                   2,0,  2,1,  2,2,  1,2,  0,2,  0,0,  0,0};

int tempBoardVals1 [52]= {                                                   42,20, 42,21, 42,22, 42,23, 42,24,
                                                                             43,20, 43,21,               43,24,
                            44,13, 44,14, 44,15, 44,16, 44,17, 44,18, 44,19, 44,20, 44,21, 44,22,        44,24,
                            45,13,        45,15,                             45,20, 45,21, 45,22, 45,23, 45,24};

int tempBoardVals2 [52]= {  39,18, 39,19, 39,20, 39,21, 
                            40,18, 40,19, 40,20, 40,21, 
                            41,18, 41,19, 41,20, 41,21,
                            42,18, 42,19, 42,20, 42,21,
                            43,18, 43,19, 43,20, 43,21,
                    44,17, 44,18, 44,19, 44,20, 44,21, 44,22};

int tempBoardVals3 [52]= {  38,16, 38,17, 38,18,
                            39,16,        39,18,
                            40,16, 40,17, 40,18, 40,19,
                                                 41,19,
                                                 42,19, 42,20, 42,21,
                                                 43,19, 43,20, 43,21, 43,22, 43,23,
                                                 44,19, 44,20, 44,21,
                                                        45,20, 45,21,
                                          46,18, 46,19, 46,20};

int puzzleNum = 1;

/* Sprites
Player = 0
BoardSquares = 90 - 128
PieceKids = parentsNum * 10
99: wind
98: cheat block
*/

int boardSpriteNumStart = 100;
int vselDel;
int hselDel;
int fittedReset;
int fitted;
int windTimer;
int hasTurned;
int flipTimer;
int hasFlipped;
int cheat;

int windCount;
int windIsOn;
int windFrameRate;
int windRow;
int windCol;
int windRowdel;
int windColdel;

singleBlock cheatBlock;
singleBlock gear;
singleBlock gear2;
int gearTimer;
int soundWasSwitched;

// Animation states for player
enum {DOWN, UP, RIGHT, LEFT, IDLE};

// Background Variables
unsigned short hOff;
unsigned short vOff;

//afine sprites
OBJ_AFFINE* shadowAffine = (OBJ_AFFINE*)(shadowOAM);

void initGame(int p) {

    puzzleNum = p;
    soundWasSwitched = 0;

    vOff = 0;
    hOff = 0;

    fitted = BOARDSQUARECOUNT;
    fittedReset = BOARDSQUARECOUNT;

    windTimer = 0;
    hasTurned = 0;
    flipTimer = 0;
    hasFlipped = 0;
    cheat = 0;
    windIsOn = 0;
    windFrameRate = 20;

    initPlayer();
    initBoard();
    initPieceParents();

}

void updateGame() {

    // animate wind
    if (windIsOn) {
        windCount++;
        int state = windCount / windFrameRate;
        shadowOAM[89].attr0 = (windRow - windRowdel * 2) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[89].attr1 = (windCol - windColdel) | ATTR1_MEDIUM;
        shadowOAM[89].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(18, 2 + state * 4);
        if (windCount == 6 * windFrameRate) {
            windIsOn = 0;
            shadowOAM[89].attr0 |= ATTR0_HIDE;
        }
    }

	updatePlayer();

    for (int i = 0; i < BOARDSQUARECOUNT; i++) {
		updateBoardSquare(&board[i]);
	}
    for (int i = 0; i < PIECEPARENTCOUNT; i++) {
		updatePieceParent(&pieceParents[i]);
	}

    // update cheat block
    if (cheatBlock.selected > 0) {
        cheatBlock.vOffset += vselDel;
        cheatBlock.hOffset += hselDel;
        cheatBlock.screenRow = cheatBlock.worldRow * 8 - vOff + cheatBlock.vOffset;
        cheatBlock.screenCol = cheatBlock.worldCol * 8 - hOff + cheatBlock.hOffset;
    } else {
        cheatBlock.screenRow = cheatBlock.worldRow * 8 - vOff + cheatBlock.vOffset;
        cheatBlock.screenCol = cheatBlock.worldCol * 8 - hOff + cheatBlock.hOffset;
    }

    //update gear
    gear.screenRow = gear.worldRow - vOff;
    gear.screenCol = gear.worldCol - hOff;
    gear2.screenRow = gear2.worldRow - vOff;
    gear2.screenCol = gear2.worldCol - hOff;
    gearTimer++;
    if (gearTimer > 359) {
        gearTimer = 0;
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

    // draw cheat block
    // if screenrow or screen col aren't within 0 - 160
    if (cheatBlock.screenRow < 0 - cheatBlock.height || cheatBlock.screenRow > 160) {
        shadowOAM[cheatBlock.spriteNum].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[cheatBlock.spriteNum].attr0 = (ROWMASK & (cheatBlock.rowOffset * 8 + cheatBlock.screenRow)) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[cheatBlock.spriteNum].attr1 = (COLMASK & (cheatBlock.colOffset * 8 + cheatBlock.screenCol)) | ATTR1_TINY;
        shadowOAM[cheatBlock.spriteNum].attr2 = ATTR2_PALROW(cheatBlock.palRow) | ATTR2_TILEID(cheatBlock.sheetCol, cheatBlock.sheetRow);
    }

    // affine sprites
    int deg = (gearTimer % 360);
        shadowAffine[0].a = sin_lut_fixed8[(deg + 90) % 360];
        shadowAffine[0].b = sin_lut_fixed8[(deg + 180) % 360];
        shadowAffine[0].c = sin_lut_fixed8[(deg) % 360];
        shadowAffine[0].d = sin_lut_fixed8[(deg + 90) % 360];

    // draw gear
    // if screenrow or screen col aren't within 0 - 160
    if (gear.screenRow < 0 - gear.height - 16 || gear.screenRow > 160) {
        shadowOAM[gear.spriteNum].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[gear.spriteNum].attr0 = (ROWMASK & (gear.screenRow)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_DOUBLEAFFINE;
        shadowOAM[gear.spriteNum].attr1 = (COLMASK & (gear.screenCol)) | ATTR1_LARGE | ATTR1_AFFINEINDEX(0);
        shadowOAM[gear.spriteNum].attr2 = ATTR2_PALROW(gear.palRow) | ATTR2_TILEID(gear.sheetCol, gear.sheetRow);
    }
    if (gear2.screenRow < 0 - gear2.height - 16 || gear2.screenRow > 160) {
        shadowOAM[gear2.spriteNum].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[gear2.spriteNum].attr0 = (ROWMASK & (gear2.screenRow)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_DOUBLEAFFINE;
        shadowOAM[gear2.spriteNum].attr1 = (COLMASK & (gear2.screenCol)) | ATTR1_LARGE | ATTR1_AFFINEINDEX(0);
        shadowOAM[gear2.spriteNum].attr2 = ATTR2_PALROW(gear2.palRow) | ATTR2_TILEID(gear2.sheetCol, gear2.sheetRow);
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

    player.worldRow = SCREENHEIGHT/2-player.width/2 + vOff + 100;
    player.worldCol = SCREENWIDTH/2-player.height/2 + hOff + 40;
    vOff = 100;
    hOff = 16;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = DOWN;
    player.hide = 0;
    player.sheetRow = 0;
    player.sheetCol = 0;
    player.palRow = 1;
}

void updatePlayer() {

    int vOffdel = 0;
    int hOffdel = 0;

    vselDel = 0;
    hselDel = 0;

    if (collision(player.worldCol, player.worldRow, player.width, player.height, 0, 0, 8 * 8, 512) ||
        collision(player.worldCol, player.worldRow, player.width, player.height, 0, 0, 256, 8 * 12)) {
        windTimer++;
    } else {
        windTimer = 0;
        hasTurned = 0;
    }

    if (collision(player.worldCol, player.worldRow, player.width, player.height, 144 + 16, 160 + 16, 32, 32)) {
        flipTimer++;
    } else {
        flipTimer = 0;
        hasFlipped = 0;
    }

    if ((cheat && BUTTON_PRESSED(BUTTON_A)) || (windTimer > 80 && hasTurned == 0)) {
        hasTurned = 1;
        for (int i = 0; i < PIECEPARENTCOUNT; i++) {
            if (pieceParents[i].selected > 0) {
                if (windTimer > 0) {
                    turnPiece(&pieceParents[i], 1);
                } else {
                    turnPiece(&pieceParents[i], 0);
                }
            }
        }

    } else if ((cheat && BUTTON_PRESSED(BUTTON_L)) || (flipTimer > 80 && hasFlipped == 0)) {
        hasFlipped = 1;
        for (int i = 0; i < PIECEPARENTCOUNT; i++) {
            if (pieceParents[i].selected > 0) {
                flipPiece(&pieceParents[i]);
            }
        }
    } else {

        if (BUTTON_HELD(BUTTON_UP)) {
            if (player.screenRow > 0 
            && collisionmapBitmap[OFFSET(player.worldCol, player.worldRow - 1, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + 8, player.worldRow - 1, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + 16, player.worldRow - 1, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + 24, player.worldRow - 1, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow - 1, 256)]) {
                player.worldRow -= 1;
                vselDel = -1;
                if (vOff > 0 && player.screenRow < 80) {
                    vOffdel = -1;
                }
            }
        }
        if (BUTTON_HELD(BUTTON_DOWN)) {
            if (player.screenRow + player.height < 320
            && collisionmapBitmap[OFFSET(player.worldCol, player.worldRow + player.height, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + 8, player.worldRow + player.height, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + 16, player.worldRow + player.height, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + 24, player.worldRow + player.height, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow + player.height, 256)]) {
                player.worldRow += 1;
                vselDel = 1;
                if (vOff < 512 - 160 && player.screenRow > 80) {
                    vOffdel = 1;
                }
            }
        }
        vOff += vOffdel;
        if (BUTTON_HELD(BUTTON_LEFT)) {
            if (player.screenCol > 0
            && collisionmapBitmap[OFFSET(player.worldCol - 1, player.worldRow, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol - 1, player.worldRow + 8, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol - 1, player.worldRow + 16, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol - 1, player.worldRow + 24, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol - 1, player.worldRow + player.height - 1, 256)]) {
                player.worldCol -= 1;
                hselDel = -1;
                if (hOff > 0 && player.screenCol < 120) {
                    hOffdel = -1;
                }
            }
        }
        if (BUTTON_HELD(BUTTON_RIGHT)) {
            if (player.screenCol + player.width < 240
            && collisionmapBitmap[OFFSET(player.worldCol + player.width, player.worldRow, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + player.width, player.worldRow + 8, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + player.width, player.worldRow + 16, 256)]
            && collisionmapBitmap[OFFSET(player.worldCol + player.width, player.worldRow + 24, 256)]
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
        windColdel += hOffdel;
        windRowdel += vOffdel;

        // Check for collision with pieces
        if (BUTTON_PRESSED(BUTTON_B)){
            int actionDone = 0;
            for (int i = 0; i < PIECEPARENTCOUNT; i++) {
                if (pieceParents[i].selected > 0) {
                    actionDone = 1;
                    playSoundB(BlockDownSFX, BLOCKDOWNSFXLEN, BLOCKDOWNSFXFREQ, 0);
                    pieceParents[i].selected = 0;
                    pieceParents[i].vOffset -= (pieceParents[i].vOffset) % 8;
                    pieceParents[i].hOffset -= (pieceParents[i].hOffset) % 8;

                    int overlapCheck [52] = {0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0,
                                             0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0,
                                             0,0, 0,0, 0,0, 0,0, 0,0, 0,0};
                    int next = 0;
                            
                    int f = fittedReset;
                    for (int x = 0; x < BOARDSQUARECOUNT; x++) {
                        for (int pp = 0; pp < PIECEPARENTCOUNT; pp++) {
                            for (int j = 0; j < pieceParents[pp].numOfActiveKids; j++) {
                                if (board[x].worldCol == (pieceParents[pp].worldCol + pieceParents[pp].kids[j].colOffset) + pieceParents[pp].hOffset / 8 
                                && board[x].worldRow == (pieceParents[pp].worldRow + pieceParents[pp].kids[j].rowOffset) + pieceParents[pp].vOffset / 8){
                                    //f--;
                                    int alreadyTaken = 0;
                                    for (int xx = 0; xx < next; xx++) {
                                        if (board[x].worldCol == overlapCheck[xx] && board[x].worldRow == overlapCheck[xx + 1]) {
                                            alreadyTaken = 1;
                                        }
                                    }
                                    if (alreadyTaken == 0) {
                                        f--;
                                        overlapCheck[next] = board[x].worldCol;
                                        overlapCheck[next + 1] = board[x].worldRow;
                                        next += 2;
                                    }
                                }
                            }
                        }
                    }
                    fitted = f;
                    i = PIECEPARENTCOUNT;
                }
            }
            // check for cheat block putting down
            if (cheatBlock.selected > 0) {
                if(collisionmapBitmap[OFFSET(cheatBlock.worldCol * 8 + (cheatBlock.hOffset - (cheatBlock.hOffset % 8)), 
                    cheatBlock.worldRow * 8 + (cheatBlock.vOffset - (cheatBlock.vOffset % 8)), 256)]) {
                    playSoundB(BlockDownSFX, BLOCKDOWNSFXLEN, BLOCKDOWNSFXFREQ, 0);
                    cheatBlock.selected = 0;
                    cheatBlock.vOffset -= (cheatBlock.vOffset) % 8;
                    cheatBlock.hOffset -= (cheatBlock.hOffset) % 8;
                    actionDone = 1;

                    // check if cheat should be activated
                    if (cheatBlock.worldRow + cheatBlock.vOffset / 8 == 2 && cheatBlock.worldCol + cheatBlock.hOffset / 8 == 19) {
                        stopSound();
                        playSoundA(DubstepGameTheme, DUBSTEPGAMETHEMELEN, DUBSTEPGAMETHEMEFREQ, 1);
                        playSoundB(CheatChime, CHEATCHIMELEN, CHEATCHIMEFREQ, 0);
                        soundWasSwitched = 1;
                        cheat = 1;
                    } else if (soundWasSwitched){
                        stopSound();
                        playSoundA(MainGameTheme, MAINGAMETHEMELEN, MAINGAMETHEMEFREQ, 1);
                        soundWasSwitched = 0;
                    }
                }
            }
            for (int i = 0; i < PIECEPARENTCOUNT && actionDone == 0; i++) {
                int numOfKids = pieceParents[i].numOfActiveKids;
                if (pieceParents[i].selected == 0) {
                    for (int j = 0; j < numOfKids; j++) {
                        int r = (pieceParents[i].worldRow + pieceParents[i].kids[j].rowOffset) * 8 + pieceParents[i].vOffset;
                        int c = (pieceParents[i].worldCol + pieceParents[i].kids[j].colOffset) * 8 + pieceParents[i].hOffset;
                        if (collision(player.worldCol, player.worldRow, 2, 2, c, r, 8, 8)){
                            pieceParents[i].selected = j + 1;
                            actionDone = 1;
                            playSoundB(BlockUpSFX, BLOCKUPSFXLEN, BLOCKUPSFXFREQ, 0);
                            j = pieceParents[i].numOfActiveKids;
                            i = PIECEPARENTCOUNT;
                        }
                    }
                }
            }
            // check for cheat block picking up
            int r = (cheatBlock.worldRow + cheatBlock.rowOffset) * 8 + cheatBlock.vOffset;
            int c = (cheatBlock.worldCol + cheatBlock.colOffset) * 8 + cheatBlock.hOffset;
            if (actionDone == 0 && collision(player.worldCol, player.worldRow, 2, 2, c, r, 8, 8)) {
                cheatBlock.selected = 1;
                cheat = 0;
                actionDone = 1;
                playSoundB(BlockUpSFX, BLOCKUPSFXLEN, BLOCKUPSFXFREQ, 0);
            }
        }

        player.screenRow = player.worldRow - vOff;
        player.screenCol = player.worldCol - hOff;

    }

    animatePlayer();
}

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
            player.sheetRow + player.curFrame * player.height / 8 + cheat * 12);
}

void turnPiece(pieceParent* pp, int windy) {
    windCount = 0;
    if (windy) {
        windIsOn = 1;
        playSoundB(WindEffect, WINDEFFECTLEN, WINDEFFECTFREQ, 0);
    } else {
        playSoundB(BlockTurnSFX, BLOCKTURNSFXLEN, BLOCKTURNSFXFREQ, 0);
    }
    windRow = player.screenRow - 32;
    windCol = player.screenCol;
    if (windCol > 12) {
        windCol -= 8;
    }
    if (windCol > 40) {
        windCol = 40;
    }
    windRowdel = 0;
    windColdel = 0;

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

void flipPiece(pieceParent* pp) {
    playSoundB(BlockTurnSFX, BLOCKTURNSFXLEN, BLOCKTURNSFXFREQ, 0);

    pieceKid kid = pp->kids[pp->selected - 1];
    int c = kid.colOffset;
    int cDelta = 3;
    if (c == 0) {
        cDelta = -3;
    } else if (c == 1) {
        cDelta = -1;
    } else if (c == 2) {
        cDelta = 1;
    }

    //reset Parent x and y values
    pp->worldCol += cDelta;

    //reset kid values
    for (int i = 0; i < pp->numOfActiveKids; i++) {
        pp->kids[i].colOffset = 3 - pp->kids[i].colOffset;
    }
}

void initBoard() {

    for (int i = 0; i < BOARDSQUARECOUNT; i++) {
        if (puzzleNum == 0) {
            board[i].worldRow = tempBoardVals2[i * 2];
            board[i].worldCol = tempBoardVals2[i * 2 + 1];
        } else if (puzzleNum == 1) {
            board[i].worldRow = tempBoardVals1[i * 2];
            board[i].worldCol = tempBoardVals1[i * 2 + 1];
        } else {
            board[i].worldRow = tempBoardVals3[i * 2];
            board[i].worldCol = tempBoardVals3[i * 2 + 1];
        }
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

    gear.worldRow = 116;
    gear.worldCol = 96;
    gear.sheetRow = 0;
    gear.sheetCol = 22;
    gear.palRow = 2;
    gear.width = 64;
    gear.height = 64;
    gear.spriteNum = 126;
    gear.screenRow = gear.worldRow - vOff;
    gear.screenCol = gear.worldCol - hOff;

    gear2.worldRow = 116;
    gear2.worldCol = 96;
    gear2.sheetRow = 24;
    gear2.sheetCol = 0;
    gear2.palRow = 2;
    gear2.width = 64;
    gear2.height = 64;
    gear2.spriteNum = 127;
    gear2.screenRow = gear2.worldRow - vOff;
    gear2.screenCol = gear2.worldCol - hOff;

}

void drawBoardSquare(boardSquare* bs) {
    if (bs->screenRow < 0 - bs->height || bs->screenRow > 160) {
        shadowOAM[bs->spriteNum].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[bs->spriteNum].attr0 = (ROWMASK & bs->screenRow) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_BLEND;
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
    int randPositions [10] = {23, 10,
                              30, 12,
                              23, 26,
                              31, 25,
                              28, 21}; // red yellow blue green purple

    for (int i = 0; i < PIECEPARENTCOUNT; i++) {
        pieceParents[i].numOfActiveKids = numOfPieces[i];
        pieceParents[i].selected = 0;

        pieceParents[i].worldRow = randPositions[i * 2];
        pieceParents[i].worldCol = randPositions[i * 2 + 1];

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
            pieceParents[i].kids[j].rowOffset = pieces[i * 14 + j * 2];
            pieceParents[i].kids[j].colOffset = pieces[i * 14 + j * 2 + 1];
            pieceParents[i].kids[j].width = 8;
            pieceParents[i].kids[j].height = 8;
            pieceParents[i].kids[j].spriteNum = i * 10 + 30 + j;
        }
    }

    cheatBlock.selected = 0;
    cheatBlock.worldRow = 52; // 52 used to be 2
    cheatBlock.worldCol = 9; // 9 used to be 19
    cheatBlock.screenRow = cheatBlock.worldRow * 8 - vOff;
    cheatBlock.screenCol = cheatBlock.worldCol * 8 - hOff;
    cheatBlock.vOffset = 0;
    cheatBlock.hOffset = 0;
    cheatBlock.sheetRow = 1;
    cheatBlock.sheetCol = 19;
    cheatBlock.palRow = 2;

    cheatBlock.rowOffset = 0;
    cheatBlock.colOffset = 0;
    cheatBlock.width = 8;
    cheatBlock.height = 8;
    cheatBlock.spriteNum = 88;

}

void drawPieceParent(pieceParent* pp) {
    for (int i = 0; i < pp->numOfActiveKids; i++) {
        // if screenrow or screen col aren't within 0 - 160
        if (pp->screenRow < 0 - pp->height || pp->screenRow > 160) {
            shadowOAM[pp->kids[i].spriteNum].attr0 = ATTR0_HIDE;
        } else {
            shadowOAM[pp->kids[i].spriteNum].attr0 = (ROWMASK & (pp->kids[i].rowOffset * 8 + pp->screenRow)) 
            | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_BLEND;
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