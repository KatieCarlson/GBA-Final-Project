
//{{BLOCK(winState)

//======================================================================
//
//	winState, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2019-10-22, 16:55:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSTATE_H
#define GRIT_WINSTATE_H

#define winStateTilesLen 64
extern const unsigned short winStateTiles[32];

#define winStateMapLen 2048
extern const unsigned short winStateMap[1024];

#define winStatePalLen 512
extern const unsigned short winStatePal[256];

#endif // GRIT_WINSTATE_H

//}}BLOCK(winState)
