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
# 2 "game.c" 2
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
boardSquare board[5];
pieceParent pieceParents[4];







int boardSpriteNumStart = 1;


enum {DOWN, UP, RIGHT, LEFT, IDLE};


unsigned short hOff;
unsigned short vOff;

void initGame() {

    initPlayer();
    initBoard();
    initPieceParents();

}

void updateGame() {

 updatePlayer();

    for (int i = 0; i < 5; i++) {
  updateBoardSquare(&board[i]);
 }
    for (int i = 0; i < 4; i++) {
  updatePieceParent(&pieceParents[i]);
 }
}

void drawGame() {

    drawPlayer();

    for (int i = 0; i < 5; i++) {
  drawBoardSquare(&board[i]);
 }
    for (int i = 0; i < 4; i++) {
  drawPieceParent(&pieceParents[i]);
 }

    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x04000018) = hOff / 2;
    (*(volatile unsigned short *)0x0400001A) = vOff / 2;

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
    player.palRow = 1;
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
    shadowOAM[0].attr2 = ((player.palRow)<<12) | ((player.sheetRow + player.curFrame * player.height / 8)*32+(player.sheetCol + player.aniState * player.width / 8))

                                                                  ;
}

void initBoard() {
    int tempBoardVals [10] = {42, 17, 42, 18, 43, 17, 43, 18, 44, 17};

    for (int i = 0; i < 5; i++) {
        board[i].worldRow = tempBoardVals[i * 2];
        board[i].worldCol = tempBoardVals[i * 2 + 1];
        board[i].rdel = 0;
        board[i].cdel = 0;
        board[i].width = 8;
        board[i].height = 8;
        board[i].hide = 0;
        board[i].sheetRow = 1;
        board[i].sheetCol = 8;
        board[i].palRow = 0;
        board[i].spriteNum = i + boardSpriteNumStart;
    }

}

void drawBoardSquare(boardSquare* bs) {
    shadowOAM[bs->spriteNum].attr0 = bs->screenRow | (0<<14) | (0<<13);
    shadowOAM[bs->spriteNum].attr1 = bs->screenCol | (0<<14);
    shadowOAM[bs->spriteNum].attr2 = ((bs->palRow)<<12) | ((bs->sheetRow)*32+(bs->sheetCol))
                                   ;
}

void updateBoardSquare(boardSquare* bs) {

    bs->screenRow = bs->worldRow * 8 - vOff;
    bs->screenCol = bs->worldCol * 8 - hOff;

}

void initPieceParents() {
    for (int i = 0; i < 4; i++) {
        pieceParents[i].numOfActiveKids = 4;
        pieceParents[i].selected = 0;
        pieceParents[i].worldRow = i * 2;
        pieceParents[i].worldCol = i * 2;
        pieceParents[i].rdel = 0;
        pieceParents[i].cdel = 0;
        pieceParents[i].width = 0;
        pieceParents[i].height = 0;
        pieceParents[i].hide = 0;
        pieceParents[i].sheetRow = 0;
        pieceParents[i].sheetCol = 9 + i;
        pieceParents[i].palRow = 0;
        pieceParents[i].num = i * 10;

        initPieceKids(&pieceParents[i]);
    }
}

void drawPieceParent(pieceParent* pp) {
    for (int i = 0; i < pp->numOfActiveKids; i++) {
        if(pp->kids[i].spriteNum > 29){
        shadowOAM[pp->kids[i].spriteNum].attr0 = pp->kids[i].rowOffset * 8 + pp->screenRow | (0<<14) | (0<<13);
        shadowOAM[pp->kids[i].spriteNum].attr1 = pp->kids[i].colOffset * 8 + pp->screenCol | (0<<14);
        shadowOAM[pp->kids[i].spriteNum].attr2 = ((pp->palRow)<<12) | ((pp->sheetRow)*32+(pp->sheetCol))
                                       ;
        }
    }
}

void updatePieceParent(pieceParent* pp) {
    pp->screenRow = pp->worldRow * 8 - vOff;
    pp->screenCol = pp->worldCol * 8 - hOff;
}

void initPieceKids(pieceParent* pp) {
    for (int i = 0; i < pp->numOfActiveKids; i++) {
        pp->kids[i].rowOffset = i;
        pp->kids[i].colOffset = i;
        pp->kids[i].rdel = 0;
        pp->kids[i].cdel = 0;
        pp->kids[i].width = 8;
        pp->kids[i].height = 8;
        pp->kids[i].hide = 0;
        pp->kids[i].spriteNum = pp->num + i;
    }
}
