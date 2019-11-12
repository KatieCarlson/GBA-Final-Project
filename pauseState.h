
//{{BLOCK(pauseState)

//======================================================================
//
//	pauseState, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2019-10-22, 16:55:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESTATE_H
#define GRIT_PAUSESTATE_H

#define pauseStateTilesLen 64
extern const unsigned short pauseStateTiles[32];

#define pauseStateMapLen 2048
extern const unsigned short pauseStateMap[1024];

#define pauseStatePalLen 512
extern const unsigned short pauseStatePal[256];

#endif // GRIT_PAUSESTATE_H

//}}BLOCK(pauseState)
