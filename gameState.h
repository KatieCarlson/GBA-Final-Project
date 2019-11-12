
//{{BLOCK(gameState)

//======================================================================
//
//	gameState, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2019-10-22, 16:55:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESTATE_H
#define GRIT_GAMESTATE_H

#define gameStateTilesLen 64
extern const unsigned short gameStateTiles[32];

#define gameStateMapLen 2048
extern const unsigned short gameStateMap[1024];

#define gameStatePalLen 512
extern const unsigned short gameStatePal[256];

#endif // GRIT_GAMESTATE_H

//}}BLOCK(gameState)
