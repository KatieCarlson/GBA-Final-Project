
//{{BLOCK(loseState)

//======================================================================
//
//	loseState, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2019-10-22, 18:43:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESTATE_H
#define GRIT_LOSESTATE_H

#define loseStateTilesLen 64
extern const unsigned short loseStateTiles[32];

#define loseStateMapLen 2048
extern const unsigned short loseStateMap[1024];

#define loseStatePalLen 512
extern const unsigned short loseStatePal[256];

#endif // GRIT_LOSESTATE_H

//}}BLOCK(loseState)
