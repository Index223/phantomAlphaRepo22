

mob/proc
	WidthTotal()
		width_total=winget(src,"default.stats","size")
		width_total=text2num(copytext(width_total,1,findtext(width_total,"x")))
	GetWidth()
		pl_width=src.hp * width_total / src.maxhp
		ki_width=src.ki * width_total / src.maxki
		en_width=src.energy * width_total / src.maxenergy
		exp_width=src.exp * width_total / src.maxexp
		if(pl_width<1)
			pl_width=1
		if(ki_width<1)
			ki_width=1
		if(en_width<1)
			en_width=1
		if(exp_width<1)
			exp_width=1
	Check()
		if(src.hp>=src.maxhp)
			src.hp=src.maxhp
		if(src.ki>=src.maxki)
			src.ki=src.maxki
		if(src.energy>=src.maxenergy)
			src.energy=src.maxenergy
		if(src.exp>=src.maxexp)
			src.exp=src.maxexp
		if(src.hp<0)
			src.hp=1
		if(src.ki<0)
			src.ki=1
		if(src.energy<0)
			src.energy=1
		if(src.exp<0)
			src.exp=1
mob/var

	width_total=0
	pl_width=0
	ki_width=0
	en_width=0
	exp_width=0

mob
	proc/UpdateHud()
		winset(src,"stats.hp","size=[src.pl_width]x12; text=[src.hp]")
		winset(src,"stats.ki","size=[src.ki_width]x12; text=[src.ki]")
		winset(src,"stats.energy","size=[src.en_width]x12; text=[src.energy]")
		winset(src,"stats.exp","size=[src.exp_width]x12; text=[src.exp]")
