// Constants
#define MAPHEIGHT 512
#define MAPWIDTH 256

// Variables
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();