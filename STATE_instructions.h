
//{{BLOCK(STATE_instructions)

//======================================================================
//
//	STATE_instructions, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 100 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3200 + 2048 = 5760
//
//	Time-stamp: 2019-11-14, 16:52:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STATE_INSTRUCTIONS_H
#define GRIT_STATE_INSTRUCTIONS_H

#define STATE_instructionsTilesLen 3200
extern const unsigned short STATE_instructionsTiles[1600];

#define STATE_instructionsMapLen 2048
extern const unsigned short STATE_instructionsMap[1024];

#define STATE_instructionsPalLen 512
extern const unsigned short STATE_instructionsPal[256];

#endif // GRIT_STATE_INSTRUCTIONS_H

//}}BLOCK(STATE_instructions)
