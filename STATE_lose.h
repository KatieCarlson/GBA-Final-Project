
//{{BLOCK(STATE_lose)

//======================================================================
//
//	STATE_lose, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 181 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5792 + 2048 = 8352
//
//	Time-stamp: 2019-10-24, 17:23:31
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STATE_LOSE_H
#define GRIT_STATE_LOSE_H

#define STATE_loseTilesLen 5792
extern const unsigned short STATE_loseTiles[2896];

#define STATE_loseMapLen 2048
extern const unsigned short STATE_loseMap[1024];

#define STATE_losePalLen 512
extern const unsigned short STATE_losePal[256];

#endif // GRIT_STATE_LOSE_H

//}}BLOCK(STATE_lose)
