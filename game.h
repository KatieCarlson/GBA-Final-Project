// Constants
#define MAPHEIGHT 512
#define MAPWIDTH 256
#define BOARDSQUARECOUNT 4
#define PIECEPARENTCOUNT 4

// Sprites for puzzle pieces
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
    int vOffset;
    int hOffset;
    int rdel;
    int cdel;
    int width;
    int height;
    int hide;
    int sheetRow;
    int sheetCol;
    int palRow;
    int num;

    pieceKid kids[5];
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

// Variables
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
extern boardSquare board[BOARDSQUARECOUNT];
extern int fitted;

// Prototypes
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