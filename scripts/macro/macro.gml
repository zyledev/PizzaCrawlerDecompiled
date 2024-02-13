global.pausedisable = false
global.pausedisable2 = false

enum states
{
	normal,
	mach,
	actor,
	punch,
	hurt,
	cutscene,
	empty,
	noclip
}

enum enemystates
{
	normal,
	attack,
	chase,
	panic,
	controlled
}

enum curdir
{
	left, // 0
	right, // 1
	up, // 2
	upright, // 3
	upleft, // 4
	down, // 5
	downright, // 6
	downleft // 7

}