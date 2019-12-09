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
#include "PuzzleDoneChime.h"
#include "StartTheme.h"

SOUND soundA;
SOUND soundB;

// States
enum {START, INSTRUCTIONS, GAME, PAUSE, WIN};
int state;
int cursor;
int instructionsNum;
int puzzle;
int winV;

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
int clockHands;
int clockHandsSlower;

// Text Buffer
char buffer[41];

int main() {

    initialize();

    seed++;

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

    clockHands = 0;
    clockHandsSlower = 0;
    puzzle = 0;

    // 4bpp for the bg1 and 2 because they use 16 colors or less in their palettes
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(29) | BG_4BPP | BG_SIZE_TALL;
    REG_BG3CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_4BPP | BG_SIZE_TALL;

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    setupSounds();
	setupInterrupts();

    goToStart();
}

void start() {

    clockHands++;
    if (clockHands > 8 * 4500) {
        clockHands = 0;
        clockHandsSlower++;
    }
    int frame = clockHands / 4500;
    int frame2 = clockHandsSlower;
    if (clockHandsSlower == 8) {
        clockHandsSlower = 0;
    }

    shadowOAM[1].attr0 = 84 | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[1].attr1 = 37 | ATTR1_SMALL;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 2 + frame * 2);

    shadowOAM[2].attr0 = 84 | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[2].attr1 = 37 | ATTR1_SMALL;
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 8 + frame2 * 2);

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
    if (fitted == 0 && winV == 0) {
        stopSound();
        playSoundA(PuzzleDoneChime, PUZZLEDONECHIMELEN, PUZZLEDONECHIMEFREQ, 0);
        winV++;
    }
    if (winV > 0) {
        winV++;
    }
    if (winV == 200) {
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
    playSoundA(StartTheme, STARTTHEMELEN, STARTTHEMEFREQ, 1);

    cursor = 0;
    initGame(puzzle % 3);
    puzzle++;

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
    winV = 0;

    REG_DISPCTL = MODE0 | BG2_ENABLE | BG3_ENABLE | SPRITE_ENABLE;

    hideSprites();
    DMANow(3, clocktowerPal, PALETTE, 256);

    // load tiles and map for bg2
    //REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(29) | BG_8BPP | BG_SIZE_TALL;
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