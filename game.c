#include "myLib.h"
#include "game.h"

// Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE pikachu;

// Pikachu animation states for aniState
enum {PIKAFRONT, PIKABACK, PIKARIGHT, PIKALEFT, PIKAIDLE};

// Initialize the game
void initGame() {

	// Place screen on map
    vOff = 96;
    hOff = 9;

    initPlayer();
}

// Updates the game each frame
void updateGame() {

	updatePlayer();
}

// Draws the game each frame
void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Initialize the player
void initPlayer() {

    pikachu.width = 16;
    pikachu.height = 16;
    pikachu.rdel = 1;
    pikachu.cdel = 1;

    // Place in the middle of the screen in the world location chosen earlier
    pikachu.worldRow = SCREENHEIGHT/2-pikachu.width/2 + vOff;
    pikachu.worldCol = SCREENWIDTH/2-pikachu.height/2 + hOff;
    pikachu.aniCounter = 0;
    pikachu.curFrame = 0;
    pikachu.numFrames = 3;
    pikachu.aniState = PIKAFRONT;
}

// Handle every-frame actions of the player
void updatePlayer() {

    int vOffdel = 0;
    int hOffdel = 0;

    // TODO 1.0: Update to include complex camera movement
    // TODO 2.2: Update to include collision map

    /*Delete that 1, then:
    for TODO 1.0, make sure pikachu doesn't go off the map here,
    for TODO 2.2, check collision map here as well*/
    // Update pikachu's world position if the above is true

    if(BUTTON_HELD(BUTTON_UP)) {
        if (pikachu.screenRow > 0) {
            pikachu.worldRow -= 1;
            if (vOff > 0 && pikachu.screenRow < 80) {
                vOffdel = -1;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (pikachu.screenRow + pikachu.height < 160) {
            pikachu.worldRow += 1;
            if (vOff < 256 - 160 && pikachu.screenRow > 80) {
                vOffdel = 1;
            }
        }
    }
    vOff += vOffdel;
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (pikachu.screenCol > 0) {
            pikachu.worldCol -=1;
            if (hOff > 0 && pikachu.screenCol < 120) {
                hOffdel = -1;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (pikachu.screenCol + pikachu.width < 240) {
            pikachu.worldCol += 1;
            if (hOff < 256 - 240 && pikachu.screenCol > 120) {
                hOffdel = 1;
            }
        }
    }
    hOff += hOffdel;

    // TODO 1.0: Update screen row and screen col
    pikachu.screenRow = pikachu.worldRow - vOff;
    pikachu.screenCol = pikachu.worldCol - hOff;

    animatePlayer();
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    pikachu.prevAniState = pikachu.aniState;
    pikachu.aniState = PIKAIDLE;

    // Change the animation frame every 20 frames of gameplay
    if(pikachu.aniCounter % 20 == 0) {
        pikachu.curFrame = (pikachu.curFrame + 1) % pikachu.numFrames;
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP))
        pikachu.aniState = PIKABACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        pikachu.aniState = PIKAFRONT;
    if(BUTTON_HELD(BUTTON_LEFT))
        pikachu.aniState = PIKALEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        pikachu.aniState = PIKARIGHT;

    // If the pikachu aniState is idle, frame is pikachu standing
    if (pikachu.aniState == PIKAIDLE) {
        pikachu.curFrame = 0;
        pikachu.aniCounter = 0;
        pikachu.aniState = pikachu.prevAniState;
    } else {
        pikachu.aniCounter++;
    }
}

// Draw the player
void drawPlayer() {

    if (pikachu.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & pikachu.screenRow) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & pikachu.screenCol) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(pikachu.aniState * 2, pikachu.curFrame * 2);
    }
}