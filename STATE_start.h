
//{{BLOCK(STATE_start)

//======================================================================
//
//	STATE_start, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2019-11-24, 17:08:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STATE_START_H
#define GRIT_STATE_START_H

#define STATE_startTilesLen 32768
extern const unsigned short STATE_startTiles[16384];

#define STATE_startMapLen 2048
extern const unsigned short STATE_startMap[1024];

#define STATE_startPalLen 512
extern const unsigned short STATE_startPal[256];

#endif // GRIT_STATE_START_H

//}}BLOCK(STATE_start)
