# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 68 "myLib.h"
extern unsigned short *videoBuffer;
# 89 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 160 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int sheetRow;
    int sheetCol;
    int palRow;
} ANISPRITE;
# 205 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 216 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 256 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "game.h" 1







typedef struct {
    int rowOffset;
    int colOffset;
    int rdel;
    int cdel;
    int width;
    int height;
    int hide;
    int sheetRow;
    int sheetCol;
    int palRow;
    int spriteNum;
} pieceKid;

typedef struct {
    int numOfActiveKids;
    int selected;

    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int hide;
    int sheetRow;
    int sheetCol;
    int palRow;
    int num;

    pieceKid kids[];
} pieceParent;

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int hide;
    int sheetRow;
    int sheetCol;
    int palRow;
    int spriteNum;
} boardSquare;


extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
extern boardSquare board[5];


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void initBoard();
void drawBoardSquare();
void updateBoardSquare();
void initPieceParents();
void drawPieceParent();
void updatePieceParent();
void initPieceKids();
# 3 "main.c" 2
# 1 "STATE_start.h" 1
# 22 "STATE_start.h"
extern const unsigned short STATE_startTiles[2144];


extern const unsigned short STATE_startMap[1024];


extern const unsigned short STATE_startPal[256];
# 4 "main.c" 2
# 1 "STATE_instructions.h" 1
# 22 "STATE_instructions.h"
extern const unsigned short STATE_instructionsTiles[1600];


extern const unsigned short STATE_instructionsMap[1024];


extern const unsigned short STATE_instructionsPal[256];
# 5 "main.c" 2
# 1 "STATE_pause.h" 1
# 22 "STATE_pause.h"
extern const unsigned short STATE_pauseTiles[1536];


extern const unsigned short STATE_pauseMap[1024];


extern const unsigned short STATE_pausePal[256];
# 6 "main.c" 2
# 1 "STATE_win.h" 1
# 22 "STATE_win.h"
extern const unsigned short STATE_winTiles[1104];


extern const unsigned short STATE_winMap[1024];


extern const unsigned short STATE_winPal[256];
# 7 "main.c" 2
# 1 "city.h" 1
# 22 "city.h"
extern const unsigned short cityTiles[48];


extern const unsigned short cityMap[2048];


extern const unsigned short cityPal[256];
# 8 "main.c" 2
# 1 "clocktower.h" 1
# 22 "clocktower.h"
extern const unsigned short clocktowerTiles[192];


extern const unsigned short clocktowerMap[2048];


extern const unsigned short clocktowerPal[256];
# 9 "main.c" 2


enum {START, INSTRUCTIONS, GAME, PAUSE, WIN};
int state;


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


unsigned short buttons;
unsigned short oldButtons;


int seed;


char buffer[41];

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


void initialize() {

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<10) | (1<<12);


    DMANow(3, clocktowerPal, ((unsigned short *)0x5000000), 256);

    (*(volatile unsigned short*)0x4000008) = ((2)<<2) | ((31)<<8) | (0<<7) | (0<<14);

    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((29)<<8) | (0<<7) | (2<<14);
    DMANow(3, clocktowerTiles, &((charblock *)0x6000000)[0], 384 / 2);
    DMANow(3, clocktowerMap, &((screenblock *)0x6000000)[29], 4096 / 2);

    (*(volatile unsigned short*)0x400000C) = ((1)<<2) | ((27)<<8) | (0<<7) | (2<<14);
 DMANow(3, cityTiles, &((charblock *)0x6000000)[1], 96 / 2);
    DMANow(3, cityMap, &((screenblock *)0x6000000)[27], 4096 / 2);

    initGame();
    goToStart();
}

void start() {

    seed++;

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        srand(seed);
        goToGame();
    }
    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        srand(seed);
        goToInstructions();
    }
}

void instructions() {

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
        initGame();
    }
}

void game() {

    updateGame();
    drawGame();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToPause();
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToWin();
    }
}

void pause() {

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToGame();
    else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
        goToStart();
}

void win() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToStart();
}

void goToStart() {

    hideSprites();
    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    DMANow(3, STATE_startPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, STATE_startTiles, &((charblock *)0x6000000)[2], 4288 / 2);
    DMANow(3, STATE_startMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = START;
    seed = 0;
}

void goToInstructions() {

    hideSprites();
    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    DMANow(3, STATE_instructionsPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, STATE_instructionsTiles, &((charblock *)0x6000000)[2], 3200 / 2);
    DMANow(3, STATE_instructionsMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = INSTRUCTIONS;
}

void goToGame() {

    hideSprites();
    DMANow(3, clocktowerPal, ((unsigned short *)0x5000000), 256);

    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<10) | (1<<12);

    state = GAME;
}

void goToPause() {

    hideSprites();
    (*(unsigned short *)0x4000000) |= (1<<8);

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, STATE_pausePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, STATE_pauseTiles, &((charblock *)0x6000000)[2], 3072 / 2);
    DMANow(3, STATE_pauseMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = PAUSE;
}

void goToWin() {

    hideSprites();
    (*(unsigned short *)0x4000000) |= (1<<8);

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, STATE_winPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, STATE_winTiles, &((charblock *)0x6000000)[2], 2208 / 2);
    DMANow(3, STATE_winMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = WIN;
}
