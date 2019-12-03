
//{{BLOCK(STATE_start)

//======================================================================
//
//	STATE_start, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 437 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 27968 + 2048 = 30528
//
//	Time-stamp: 2019-11-26, 10:06:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STATE_START_H
#define GRIT_STATE_START_H

#define STATE_startTilesLen 27968
extern const unsigned short STATE_startTiles[13984];

#define STATE_startMapLen 2048
extern const unsigned short STATE_startMap[1024];

#define STATE_startPalLen 512
extern const unsigned short STATE_startPal[256];

#endif // GRIT_STATE_START_H

//}}BLOCK(STATE_start)
