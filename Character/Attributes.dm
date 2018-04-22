#define LEVELCAP 100

attribute
	var/name
	var/value = 0
	var/limit = 0   // max is a built-in proc, so don't use it as a var name
	var/level = 1
	var/xp = 0
	var/xp_next = 100 // xp for next level
	var/xp_total = 0
	var/limit_gain_rate = 1.9
	var/xp_gain_rate = 1.12

	New(name,value=0,level=1,xp_next=100,limit_gain_rate=1.5, xp_gain_rate=1.04)
		src.name = name
		src.value = value
		src.limit = value
		src.level = level
		src.xp_next = xp_next
		src.limit_gain_rate = limit_gain_rate
		src.xp_gain_rate = xp_gain_rate



