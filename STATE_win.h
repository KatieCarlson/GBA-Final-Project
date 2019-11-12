
//{{BLOCK(STATE_win)

//======================================================================
//
//	STATE_win, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 170 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5440 + 2048 = 8000
//
//	Time-stamp: 2019-10-24, 17:28:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STATE_WIN_H
#define GRIT_STATE_WIN_H

#define STATE_winTilesLen 5440
extern const unsigned short STATE_winTiles[2720];

#define STATE_winMapLen 2048
extern const unsigned short STATE_winMap[1024];

#define STATE_winPalLen 512
extern const unsigned short STATE_winPal[256];

#endif // GRIT_STATE_WIN_H

//}}BLOCK(STATE_win)
