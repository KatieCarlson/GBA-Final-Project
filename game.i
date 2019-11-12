# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "spritesheet2.h" 1
# 21 "spritesheet2.h"
extern const unsigned short spritesheet2Tiles[16384];


extern const unsigned short spritesheet2Pal[256];
# 4 "game.c" 2


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
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void initPlayer() {

    DMANow(3, spritesheet2Pal, ((unsigned short *)0x5000200), 256);
 DMANow(3, spritesheet2Tiles, &((charblock *)0x6000000)[4], 32768 / 2);

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


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if(player.col > 0) {
            player.cdel = -1;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if(player.col + player.width < 240) {
            player.cdel = 1;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if(player.row > 0) {
            player.rdel = -1;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if(player.row + player.height < 160) {
            player.rdel = 1;
        }
    }


    player.col += player.cdel;
    player.row += player.rdel;
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | (0<<14) | (0<<13);
    shadowOAM[0].attr1 = player.col | (1<<14);
    shadowOAM[0].attr2 = ((0)<<12) | ((0)*32+(0));
}
