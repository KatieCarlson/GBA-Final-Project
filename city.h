
//{{BLOCK(city)

//======================================================================
//
//	city, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 3 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 96 + 4096 = 4704
//
//	Time-stamp: 2019-11-12, 16:45:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CITY_H
#define GRIT_CITY_H

#define cityTilesLen 96
extern const unsigned short cityTiles[48];

#define cityMapLen 4096
extern const unsigned short cityMap[2048];

#define cityPalLen 512
extern const unsigned short cityPal[256];

#endif // GRIT_CITY_H

//}}BLOCK(city)
