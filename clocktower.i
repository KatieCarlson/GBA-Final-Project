# 1 "clocktower.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "clocktower.c"
# 18 "clocktower.c"
const unsigned short clocktowerTiles[192] __attribute__((aligned(4)))=
{
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
 0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
 0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
 0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,

 0x1111,0x1111,0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,
 0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,
 0x1111,0x1111,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x1111,0x1111,0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,
 0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,
 0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,
 0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,

 0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,
 0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,
 0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,0x1111,0x1111,
 0x1111,0x1111,0x0001,0x0000,0x0001,0x0000,0x0001,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x1111,0x1111,
 0x1111,0x1111,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,0x1111,0x1111,
 0x1111,0x1111,0x1000,0x0001,0x1000,0x0001,0x1000,0x0001,
};

const unsigned short clocktowerMap[2048] __attribute__((aligned(4)))=
{
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0001,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0001,0x0002,0x0001,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0002,0x0002,0x0002,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0001,0x0001,
 0x0002,0x0002,0x0002,0x0002,0x0002,0x0001,0x0001,0x0001,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0002,0x0002,
 0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,
 0x0001,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0001,0x0002,0x0002,0x0002,0x0002,
 0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,
 0x0002,0x0001,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0001,0x0002,0x0002,0x0002,0x0002,0x0002,
 0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,
 0x0002,0x0002,0x0001,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0001,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,
 0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,
 0x0002,0x0002,0x0002,0x0001,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0004,0x0005,0x0006,0x0005,
 0x0404,0x0003,0x0003,0x0003,0x0004,0x0005,0x0006,0x0005,
 0x0404,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0009,0x000A,0x000B,0x000A,
 0x0409,0x0003,0x0003,0x0003,0x0009,0x000A,0x000B,0x000A,
 0x0409,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0804,0x0805,0x0806,0x0805,
 0x0C04,0x0003,0x0003,0x0003,0x0804,0x0805,0x0806,0x0805,
 0x0C04,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0004,0x0005,0x0006,0x0005,
 0x0404,0x0003,0x0003,0x0003,0x0004,0x0005,0x0006,0x0005,
 0x0404,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0009,0x000A,0x000B,0x000A,
 0x0409,0x0003,0x0003,0x0003,0x0009,0x000A,0x000B,0x000A,
 0x0409,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0804,0x0805,0x0806,0x0805,
 0x0C04,0x0003,0x0003,0x0003,0x0804,0x0805,0x0806,0x0805,
 0x0C04,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0004,0x0005,0x0006,0x0005,
 0x0404,0x0003,0x0003,0x0003,0x0004,0x0005,0x0006,0x0005,
 0x0404,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0009,0x000A,0x000B,0x000A,
 0x0409,0x0003,0x0003,0x0003,0x0009,0x000A,0x000B,0x000A,
 0x0409,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0804,0x0805,0x0806,0x0805,
 0x0C04,0x0003,0x0003,0x0003,0x0804,0x0805,0x0806,0x0805,
 0x0C04,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0004,0x0005,0x0006,0x0005,
 0x0404,0x0003,0x0003,0x0003,0x0004,0x0005,0x0006,0x0005,
 0x0404,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0009,0x000A,0x000B,0x000A,
 0x0409,0x0003,0x0003,0x0003,0x0009,0x000A,0x000B,0x000A,
 0x0409,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0007,0x0000,0x0008,0x0000,
 0x0407,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0001,0x0003,0x0003,0x0003,0x0804,0x0805,0x0806,0x0805,
 0x0C04,0x0003,0x0003,0x0003,0x0804,0x0805,0x0806,0x0805,
 0x0C04,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0002,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0002,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0002,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0001,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0002,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,

 0x0000,0x0001,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0002,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0001,0x0000,0x0000,0x0000,
 0x0000,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
 0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0001,
};

const unsigned short clocktowerPal[256] __attribute__((aligned(4)))=
{
 0x7C1F,0x0000,0x1993,0x6B56,0x1D8F,0x3125,0x46B6,0x45A8,
 0x1565,0x3633,0x14A4,0x3677,0x25D2,0x152C,0x19C6,0x6000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x6EC6,0x7FF4,
};
