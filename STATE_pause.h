
//{{BLOCK(STATE_pause)

//======================================================================
//
//	STATE_pause, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 391 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 25024 + 2048 = 27584
//
//	Time-stamp: 2019-11-24, 19:35:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STATE_PAUSE_H
#define GRIT_STATE_PAUSE_H

#define STATE_pauseTilesLen 25024
extern const unsigned short STATE_pauseTiles[12512];

#define STATE_pauseMapLen 2048
extern const unsigned short STATE_pauseMap[1024];

#define STATE_pausePalLen 512
extern const unsigned short STATE_pausePal[256];

#endif // GRIT_STATE_PAUSE_H

//}}BLOCK(STATE_pause)
