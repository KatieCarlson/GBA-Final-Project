
//{{BLOCK(city)

//======================================================================
//
//	city, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 281 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 8992 + 4096 = 13600
//
//	Time-stamp: 2019-12-05, 19:12:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CITY_H
#define GRIT_CITY_H

#define cityTilesLen 8992
extern const unsigned short cityTiles[4496];

#define cityMapLen 4096
extern const unsigned short cityMap[2048];

#define cityPalLen 512
extern const unsigned short cityPal[256];

#endif // GRIT_CITY_H

//}}BLOCK(city)
