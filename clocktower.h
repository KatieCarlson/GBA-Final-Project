
//{{BLOCK(clocktower)

//======================================================================
//
//	clocktower, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 12 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 384 + 4096 = 4992
//
//	Time-stamp: 2019-11-12, 21:52:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CLOCKTOWER_H
#define GRIT_CLOCKTOWER_H

#define clocktowerTilesLen 384
extern const unsigned short clocktowerTiles[192];

#define clocktowerMapLen 4096
extern const unsigned short clocktowerMap[2048];

#define clocktowerPalLen 512
extern const unsigned short clocktowerPal[256];

#endif // GRIT_CLOCKTOWER_H

//}}BLOCK(clocktower)
