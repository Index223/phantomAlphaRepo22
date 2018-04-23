

mob/proc
	WidthTotal()
		width_total=winget(src,"default.stats","size")
		width_total=text2num(copytext(width_total,1,findtext(width_total,"x")))
	GetWidth()
		pl_width=src.stats["hp"].value() * width_total / src.stats["hp"].limit()
		ki_width=src.stats["ki"].value() * width_total / src.stats["ki"].limit()
		en_width=src.stats["energy"].value() * width_total / src.stats["energy"].limit()
		exp_width=src.stats["level"].xp() * width_total / src.stats["level"].xp_next()
		if(pl_width<1)
			pl_width=1
		if(ki_width<1)
			ki_width=1
		if(en_width<1)
			en_width=1
		if(exp_width<1)
			exp_width=1
	Check()
		/*
		UPDATE ON THE WORK:
		This needs a ton of rework. there are functions that needs to be changed,
		some removed. Like, the stat attributes already work sort of on it's own.
		So we don't have to deal with ALOT of the functions you have atm.

		I also need to compare with my own game to check which functions i have and don't have.
		which one is needed. Just so i can get this over with fast.



		I just realized
		Don't even need this.rofl ?
		well maybe, let me check.

		 yeah, we do.
		 i did something on my own game, and i confused myself

		if(stats["hp"].value() >= stats["hp"].limit())

		if(stats["ki"].value() >= stats["ki"].limit())

		if(stats["hp"].value() >= stats["hp"].limit())


			// This we don't need.
			//each attribute level up on it's own.
		if(stats["xp"].value()>=src.maxexp)
			src.exp=src.maxexp
		if(src.hp<0)
			src.hp=1
		if(src.ki<0)
			src.ki=1
		if(src.energy<0)
			src.energy=1
		if(src.exp<0)
			src.exp=1
		*/
		if(src.stats["hp"].value() >= src.stats["hp"].limit())
			src.stats["hp"].reset_value()
		if(src.stats["ki"].value() >= src.stats["ki"].limit())
			src.stats["ki"].reset_value()
		if(src.stats["energy"].value() >=src.stats["energy"].limit())
			src.stats["energy"].reset_value()
// i dont think we dont need xD ye
		if(src.stats["hp"].value()<0)
			src.stats["hp"].setValue(0)//setValue(argument) < yeeh :D
		if(src.stats["ki"].value() <0)
			src.stats["ki"].setValue(0)
		if(src.stats["energy"].value() <0)
			src.stats["energy"].setValue(0)
mob/var

	width_total=0
	pl_width=0
	ki_width=0
	en_width=0
	exp_width=0

mob
	proc/UpdateHud()
		winset(src,"stats.hp","size=[src.pl_width]x12; text=[src.stats["hp"].value()]")
		winset(src,"stats.ki","size=[src.ki_width]x12; text=[src.stats["ki"].value()]")
		winset(src,"stats.energy","size=[src.en_width]x12; text=[src.stats["energy"].value()]")
		//this! important:   you can use interface experience bars to scale of stats["level"].xp() & stats["level"].xp_next()
		// for bars i am using interface ? yeah thats fine. but here
		winset(src,"stats.exp","size=[src.exp_width]x12; text=[src.stats["level"].xp()]")
