#include "myLib.h"
#include "game.h"
#include "STATE_start.h"
#include "STATE_instructions1.h"
#include "STATE_instructions2.h"
#include "STATE_instructions3.h"
#include "instructionsText1.h"
#include "instructionsText2.h"
#include "instructionsText3.h"
#include "STATE_pause.h"
#include "STATE_win.h"
#include "city.h"
#include "clocktower.h"
#include "spritesheet.h"

#include "sound.h"
#include "MainGameTheme.h"

/*
What is finished about the game so far:
Most of the art and background are done.  I might polish up my game state backgrounds, 
and edit the art of my main fairy player because it is ugly.

What still needs to be added:
Turning pieces with the wind
I need to add images to the instruction screen.
Making the puzzle more complicated, or having multiple levels so it's more of a 'game'
Adding the cheat, which will allow you to turn by pressing the 'A' button
I would like to add sound to the title screen that is different from the game music
I want to change the game music so that it is less static-y.
I want to try and make the delay of the block sound effect a lot shorter.

Any bugs that you have found:
It takes a couple tries to pick up a piece, and it seems like
you have to put the player's top left pixel in the middle of the piece to make it work.

How to play the game in its current state :
Move with arrow keys, pick up a block with the 'B' key.  The block you are picking up is the one
directly underneath the top left corner of the player
Move the block so that it covers the 'board' that has white outlines to win.

The sounds that are implemented: When you pick up or put down a block, there is a wooden block sound.

*/

SOUND soundA;
SOUND soundB;

// States
enum {START, INSTRUCTIONS, GAME, PAUSE, WIN};
int state;
int cursor;
int instructionsNum;

// Prototypes
void initialize();
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Text Buffer
char buffer[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
        }
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE; // only enable what you use in start first

    // 4bpp for the bg1 and 2 because they use 16 colors or less in their palettes
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(29) | BG_4BPP | BG_SIZE_TALL;
    REG_BG3CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_4BPP | BG_SIZE_TALL;

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    setupSounds();
	setupInterrupts();

    initGame();
    goToStart();
}

void start() {

    seed++;

    if (BUTTON_PRESSED(BUTTON_UP)) {
        if (cursor) {
            cursor = 0;
        } else {
            cursor = 1;
        }
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        if (cursor) {
            cursor = 0;
        } else {
            cursor = 1;
        }
    }

    if (cursor == 0) {
        shadowOAM[0].attr0 = 97 | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = 98 | ATTR1_TINY; 
    } else {
        shadowOAM[0].attr0 = 129 | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = 98 | ATTR1_TINY;
    }

    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        if (cursor == 0) {
            srand(seed);
            stopSound();
            playSoundA(MainGameTheme, MAINGAMETHEMELEN, MAINGAMETHEMEFREQ, 1);
            goToGame();
        } else {
            srand(seed);
            goToInstructions();
        }
    }
}

void instructions() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        if (instructionsNum == 1) {
            DMANow(3, STATE_instructions2Pal, PALETTE, STATE_instructions2PalLen / 2);
            DMANow(3, STATE_instructions2Tiles, &CHARBLOCK[2], STATE_instructions2TilesLen / 2);
            DMANow(3, STATE_instructions2Map, &SCREENBLOCK[31], STATE_instructions2MapLen / 2);

            DMANow(3, instructionsText2Tiles, &CHARBLOCK[0], instructionsText2TilesLen / 2);
            DMANow(3, instructionsText2Map, &SCREENBLOCK[29], instructionsText2MapLen / 2);

            // draw cursor
            shadowOAM[0].attr0 = 139 | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[0].attr1 = 175 | ATTR1_TINY;
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 1);

            DMANow(3, shadowOAM, OAM, 128 * 4);
        } else if (instructionsNum == 2) {
            DMANow(3, STATE_instructions3Pal, PALETTE, STATE_instructions3PalLen / 2);
            DMANow(3, STATE_instructions3Tiles, &CHARBLOCK[2], STATE_instructions3TilesLen / 2);
            DMANow(3, STATE_instructions3Map, &SCREENBLOCK[31], STATE_instructions3MapLen / 2);

            DMANow(3, instructionsText3Tiles, &CHARBLOCK[0], instructionsText3TilesLen / 2);
            DMANow(3, instructionsText3Map, &SCREENBLOCK[29], instructionsText3MapLen / 2);

            // draw cursor
            shadowOAM[0].attr0 = 139 | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[0].attr1 = 120 | ATTR1_TINY;
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 1);

            DMANow(3, shadowOAM, OAM, 128 * 4);
        } else {
            stopSound();
            playSoundA(MainGameTheme, MAINGAMETHEMELEN, MAINGAMETHEMEFREQ, 1);
            goToGame();
            initGame();
        }
        instructionsNum++;
    }
}

void game() {

    updateGame();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    }
    if (fitted == 0) {
        stopSound();
        goToWin();
    }
}

void pause() {

    if (BUTTON_PRESSED(BUTTON_UP)) {
        if (cursor) {
            cursor = 0;
        } else {
            cursor = 1;
        }
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        if (cursor) {
            cursor = 0;
        } else {
            cursor = 1;
        }
    }

    if (cursor == 0) {
        shadowOAM[0].attr0 = 89 | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = 124 | ATTR1_TINY; 
    } else {
        shadowOAM[0].attr0 = 121 | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = 124 | ATTR1_TINY;
    }

    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        if (cursor == 0) {
            unpauseSound();
            goToGame();
        } else {
            stopSound();
            goToStart();
        }
    }
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        goToStart();
    }
}

void goToStart() {
    cursor = 0;
    initGame();

    hideSprites();
    REG_DISPCTL |= BG1_ENABLE | SPRITE_ENABLE;
    // 8bpp because you use for more than 16 colors in the bg0 start palette!
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_8BPP | BG_SIZE_SMALL;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    DMANow(3, STATE_startPal, PALETTE, STATE_startPalLen / 2);
    DMANow(3, STATE_startTiles, &CHARBLOCK[2], STATE_startTilesLen / 2);
    DMANow(3, STATE_startMap, &SCREENBLOCK[31], STATE_startMapLen / 2);

    // draw cursor
    shadowOAM[0].attr0 = 97 | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = 98 | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 1);

    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = START;
    seed = 0;
}

void goToInstructions() {
    cursor = 0;
    instructionsNum = 1;

    hideSprites();
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE| SPRITE_ENABLE;

    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_8BPP | BG_SIZE_SMALL;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(29) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, instructionsText1Tiles, &CHARBLOCK[0], instructionsText1TilesLen / 2);
    DMANow(3, instructionsText1Map, &SCREENBLOCK[29], instructionsText1MapLen / 2);

    DMANow(3, STATE_instructions1Pal, PALETTE, STATE_instructions1PalLen / 2);
    DMANow(3, STATE_instructions1Tiles, &CHARBLOCK[2], STATE_instructions1TilesLen / 2);
    DMANow(3, STATE_instructions1Map, &SCREENBLOCK[31], STATE_instructions1MapLen / 2);

    // draw cursor
    shadowOAM[0].attr0 = 139 | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = 175 | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 1);

    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = INSTRUCTIONS;
}

void goToGame() {
    cursor = 0;

    REG_DISPCTL = MODE0 | BG2_ENABLE | BG3_ENABLE | SPRITE_ENABLE;

    hideSprites();
    DMANow(3, clocktowerPal, PALETTE, 256);

    // load tiles and map for bg2
    DMANow(3, clocktowerTiles, &CHARBLOCK[0], clocktowerTilesLen / 2);
    DMANow(3, clocktowerMap, &SCREENBLOCK[29], clocktowerMapLen / 2);

    // load tiles and map for bg3
    DMANow(3, cityTiles, &CHARBLOCK[1], cityTilesLen / 2);
    DMANow(3, cityMap, &SCREENBLOCK[27], cityMapLen / 2);

    state = GAME;
}

void goToPause() {
    cursor = 0;

    hideSprites();
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_8BPP | BG_SIZE_SMALL;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    DMANow(3, STATE_pausePal, PALETTE, STATE_pausePalLen / 2);
    DMANow(3, STATE_pauseTiles, &CHARBLOCK[2], STATE_pauseTilesLen / 2);
    DMANow(3, STATE_pauseMap, &SCREENBLOCK[31], STATE_pauseMapLen / 2);

    // draw cursor
    shadowOAM[0].attr0 = 97 | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = 98 | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 1);

    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = PAUSE;
}

void goToWin() {
    cursor = 0;

    hideSprites();
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_8BPP | BG_SIZE_SMALL;

    DMANow(3, STATE_winPal, PALETTE, STATE_winPalLen / 2);
    DMANow(3, STATE_winTiles, &CHARBLOCK[2], STATE_winTilesLen / 2);
    DMANow(3, STATE_winMap, &SCREENBLOCK[31], STATE_winMapLen / 2);

    // draw cursor
    shadowOAM[0].attr0 = 97 | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = 130 | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, 1);

    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = WIN;
}