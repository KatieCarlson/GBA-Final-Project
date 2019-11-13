#include "myLib.h"
#include "game.h"
#include "STATE_start.h"
#include "STATE_game.h"
#include "STATE_pause.h"
#include "STATE_win.h"
#include "STATE_lose.h"
#include "city.h"
#include "clocktower.h"

// States
enum {START, GAME, PAUSE, WIN};
int state;

// Prototypes
void initialize();

void goToStart();
void start();
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

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

    // load tile palette
    DMANow(3, clocktowerPal, PALETTE, 256);

    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;

    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_4BPP | BG_SIZE_TALL;
	DMANow(3, cityTiles, &CHARBLOCK[1], cityTilesLen / 2);
    DMANow(3, cityMap, &SCREENBLOCK[27], cityMapLen / 2);

    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(29) | BG_4BPP | BG_SIZE_TALL;
    DMANow(3, clocktowerTiles, &CHARBLOCK[0], clocktowerTilesLen / 2);
    DMANow(3, clocktowerMap, &SCREENBLOCK[29], clocktowerMapLen / 2);

    initGame();
    goToStart();
}

void start() {

    seed++;

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}

void game() {

    updateGame();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToWin();
    }
}

void pause() {

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void goToStart() {
    
    hideSprites();

    DMANow(3, STATE_startPal, PALETTE, STATE_startPalLen / 2);
    DMANow(3, STATE_startTiles, &CHARBLOCK[2], STATE_startTilesLen / 2);
    DMANow(3, STATE_startMap, &SCREENBLOCK[31], STATE_startMapLen / 2);
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = START;
    seed = 0;
}

void goToGame() {

    hideSprites();
    DMANow(3, clocktowerPal, PALETTE, 256);

    state = GAME;
}

void goToPause() {

    hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);
    DMANow(3, STATE_pausePal, PALETTE, STATE_pausePalLen / 2);
    DMANow(3, STATE_pauseTiles, &CHARBLOCK[2], STATE_pauseTilesLen / 2);
    DMANow(3, STATE_pauseMap, &SCREENBLOCK[31], STATE_pauseMapLen / 2);
    state = PAUSE;
}

void goToWin() {

    hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);
    DMANow(3, STATE_winPal, PALETTE, STATE_winPalLen / 2);
    DMANow(3, STATE_winTiles, &CHARBLOCK[2], STATE_winTilesLen / 2);
    DMANow(3, STATE_winMap, &SCREENBLOCK[31], STATE_winMapLen / 2);
    state = WIN;
}