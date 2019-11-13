# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
} ANISPRITE;
# 204 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 215 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 255 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "game.h" 1





extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
# 3 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "game.c" 2
# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[131072];
# 5 "game.c" 2


OBJ_ATTR shadowOAM[128];
ANISPRITE player;


enum {DOWN, UP, RIGHT, LEFT, IDLE};


unsigned short hOff;
unsigned short vOff;

void initGame() {

    initPlayer();

}

void updateGame() {

 updatePlayer();
}

void drawGame() {

    drawPlayer();

    (*(volatile unsigned short *)0x04000018) = hOff;
    (*(volatile unsigned short *)0x0400001A) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff / 2;
    (*(volatile unsigned short *)0x04000016) = vOff / 2;

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void initPlayer() {

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
 DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;

    player.worldRow = 160/2-player.width/2 + vOff;
    player.worldCol = 240/2-player.height/2 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = DOWN;
    player.hide = 0;
    player.sheetRow = 0;
    player.sheetCol = 0;
}


void updatePlayer() {

    int vOffdel = 0;
    int hOffdel = 0;

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (player.screenRow > 0
        && collisionmapBitmap[((player.worldRow - 1)*(256)+(player.worldCol))]
        && collisionmapBitmap[((player.worldRow - 1)*(256)+(player.worldCol + player.width - 1))]) {
            player.worldRow -= 1;
            if (vOff > 0 && player.screenRow < 80) {
                vOffdel = -1;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (player.screenRow + player.height < 320
        && collisionmapBitmap[((player.worldRow + player.height)*(256)+(player.worldCol))]
        && collisionmapBitmap[((player.worldRow + player.height)*(256)+(player.worldCol + player.width - 1))]) {
            player.worldRow += 1;
            if (vOff < 512 - 160 && player.screenRow > 80) {
                vOffdel = 1;
            }
        }
    }
    vOff += vOffdel;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.screenCol > 0
        && collisionmapBitmap[((player.worldRow)*(256)+(player.worldCol - 1))]
        && collisionmapBitmap[((player.worldRow + player.height - 1)*(256)+(player.worldCol - 1))]) {
            player.worldCol -=1;
            if (hOff > 0 && player.screenCol < 120) {
                hOffdel = -1;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.screenCol + player.width < 240
        && collisionmapBitmap[((player.worldRow)*(256)+(player.worldCol + player.width))]
        && collisionmapBitmap[((player.worldRow + player.height - 1)*(256)+(player.worldCol + player.width))]) {
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


void animatePlayer() {


    player.prevAniState = player.aniState;
    player.aniState = IDLE;


    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))))
        player.aniState = UP;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))))
        player.aniState = DOWN;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))))
        player.aniState = LEFT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))))
        player.aniState = RIGHT;


    if (player.aniState == IDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.screenRow | (0<<14) | (0<<13);
    shadowOAM[0].attr1 = player.screenCol | (1<<14);
    shadowOAM[0].attr2 = ((0)<<12) | ((player.sheetRow + player.curFrame * player.height / 8)*32+(player.sheetCol + player.aniState * player.width / 8))

                                                                  ;
}
