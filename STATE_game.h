
//{{BLOCK(STATE_game)

//======================================================================
//
//	STATE_game, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 597 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 19104 + 2048 = 21664
//
//	Time-stamp: 2019-10-24, 17:22:54
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STATE_GAME_H
#define GRIT_STATE_GAME_H

#define STATE_gameTilesLen 19104
extern const unsigned short STATE_gameTiles[9552];

#define STATE_gameMapLen 2048
extern const unsigned short STATE_gameMap[1024];

#define STATE_gamePalLen 512
extern const unsigned short STATE_gamePal[256];

#endif // GRIT_STATE_GAME_H

//}}BLOCK(STATE_game)
