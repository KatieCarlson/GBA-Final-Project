// Constants
#define MAPHEIGHT 256
#define MAPWIDTH 256

// Variables
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

// Prototypes
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

#define BULLETCOUNT 5
extern BULLET bullets[BULLETCOUNT];

#define ENEMYCOUNT 40
extern ENEMY enemies[ENEMYCOUNT];

#define ENEMYBULLETCOUNT 10
extern BULLET enemyBullets[ENEMYBULLETCOUNT];

extern int enemyCounter;