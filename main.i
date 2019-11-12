# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
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
# 156 "myLib.h"
void hideSprites();






typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int curFrame;
    int numFrames;
    int hide;
    int bulletTimer;
    int score;
} ANISPRITE;
# 195 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 206 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 246 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "game.h" 1





extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE rocket;

typedef struct {
 int col;
 int row;
 int rdel;
 int width;
 int height;
 int active;
} BULLET;

typedef struct {
 int col;
 int row;
 int cdel;
 int rdel;
 int width;
 int height;
 int active;
 int num;
} ENEMY;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *, int);
void initEnemies();
void updateEnemies();
void drawEnemies();


extern BULLET bullets[5];


extern ENEMY enemies[40];


extern BULLET enemyBullets[10];

extern int enemyCounter;
# 3 "main.c" 2
# 1 "STATE_start.h" 1
# 22 "STATE_start.h"
extern const unsigned short STATE_startTiles[7680];


extern const unsigned short STATE_startMap[1024];


extern const unsigned short STATE_startPal[256];
# 4 "main.c" 2
# 1 "STATE_game.h" 1
# 22 "STATE_game.h"
extern const unsigned short STATE_gameTiles[9552];


extern const unsigned short STATE_gameMap[1024];


extern const unsigned short STATE_gamePal[256];
# 5 "main.c" 2
# 1 "STATE_pause.h" 1
# 22 "STATE_pause.h"
extern const unsigned short STATE_pauseTiles[8352];


extern const unsigned short STATE_pauseMap[1024];


extern const unsigned short STATE_pausePal[256];
# 6 "main.c" 2
# 1 "STATE_win.h" 1
# 22 "STATE_win.h"
extern const unsigned short STATE_winTiles[2720];


extern const unsigned short STATE_winMap[1024];


extern const unsigned short STATE_winPal[256];
# 7 "main.c" 2
# 1 "STATE_lose.h" 1
# 22 "STATE_lose.h"
extern const unsigned short STATE_loseTiles[2896];


extern const unsigned short STATE_loseMap[1024];


extern const unsigned short STATE_losePal[256];
# 8 "main.c" 2


enum {START, GAME, PAUSE, WIN};
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

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((31)<<8) | (0<<7) | (0<<14);

    initGame();
    goToStart();
}

void start() {

    seed++;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        srand(seed);
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
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, STATE_startPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, STATE_startTiles, &((charblock *)0x6000000)[0], 15360 / 2);
    DMANow(3, STATE_startMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = START;
    seed = 0;
}

void goToGame() {
    hideSprites();
    DMANow(3, STATE_gamePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, STATE_gameTiles, &((charblock *)0x6000000)[0], 19104 / 2);
    DMANow(3, STATE_gameMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = GAME;
}

void goToPause() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, STATE_pausePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, STATE_pauseTiles, &((charblock *)0x6000000)[0], 16704 / 2);
    DMANow(3, STATE_pauseMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = PAUSE;
}

void goToWin() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, STATE_winPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, STATE_winTiles, &((charblock *)0x6000000)[0], 5440 / 2);
    DMANow(3, STATE_winMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = WIN;
}
