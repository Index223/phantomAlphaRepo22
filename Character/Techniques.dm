mob
	verb
		UpdateTech(/*Phat T*/)
			set hidden = 1
			var/iy = 1
			for(var/obj/Skill/i in Skilllist)
				src << output(i,"Skills:1,[++iy]")
				src << output("<b><font color=white> X[i.name]","Items:2,[iy]")
				src << output(i.suffix,"Skills:3,[iy]")

			winset(src, "Skills", "cells=3x[iy]")



proc
	Cool_Down(obj/Skill/T, n)
		while(n)
			if(n<=0)
				T.cooldown = 0
				break
			if(!n)
				T.cooldown = 0
				break
			if(n)
				T.cooldown = n
				n-= 0.1
			sleep(world.tick_lag)
mob
	var
		list
			techniques=list()
			Skilllist = list()
	verb
		Punch()
			set hidden = 1
			var/mob/player/m = usr
			if(m.savezone) return
			if(!m.attacking)


				m.attacking=1
				flick("punch",m)
				var/dx=0, dy=0, b
				b = min(bound_width, bound_height)
				if(dir & (NORTH|SOUTH)) dy = (dir & NORTH) ? b : -b
				if(dir & (EAST|WEST)) dx = (dir & EAST) ? b : -b


				for(var/mob/M in obounds(m,dx,dy))
					if(istype(M,/mob/Enemy))
						var/mob/Enemy/g = M
						g.foundTarget(m)
					var/power = m.stats["strength"].value()*rand(25.1,34.9)
					var/defense = M.stats["defence"].value()*2
					var/_damage = round(power/defense)

					m.Damage(M,_damage)

				spawn(m.attackspeed+1)
					if(m)
						m.attacking=0



