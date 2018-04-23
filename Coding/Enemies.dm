obj
	enemyarea
		icon='Void.dmi'
		layer=TURF_LAYER
		alpha = 100
		var
			mob/Enemy/owner = null
		New(location, mob/shooter)
			if(shooter)
				src.owner = shooter
		Entered(mob/m)
			if(istype(m,/mob/player/))
				var/mob/player/pl = m
				if(src.owner && !src.owner.target)

					for(var/mob/Enemy/tr in src.owner.ContainMobs)
						tr.foundTarget(pl)



turf
	var
		mob/aiowner

turf/Entered(mob/player/M)
	var/obj/enemyarea/A = locate() in src
	if(A)
		src.aiowner =A.owner
		A.Entered(M)

mob
	Bosses
	Enemy
		New(/*Phat T*/)
			..(/*Phat T*/)
			src.stats["hp"].setValue(stats["hp"].limit())
			src.home_loc = src.loc
		var/speactext
		var/list/ContainMobs=list()
		icon='Enemies.dmi'


		proc
			Enemy_stats()
				src.stats["hp"].setValue(100)
				src.stats["strenght"].setValue(5)
				src.stats["magic"].setValue(5)
				src.stats["defense"].setValue(5)

		Earthregion
			Brusolini3
				icon_state="enemy11"
				bounds="12,6 to 36,39"
				step_size=4


				New()
					..()
					var/turf/T
					Enemy_stats()
					for(T in range(3, src))
						if(T)
							if(!T.density)

								new/obj/enemyarea(T,src)

					for(var/mob/Enemy/c in oview(3,src))
						src.ContainMobs+=c
					src.ContainMobs+=src
			Brusolini3nor
				icon_state="enemy11"
				bounds="12,6 to 36,39"
				step_size=4
				New()
					..()
					Enemy_stats()

			Brusolini5
				icon_state="enemy3"
				bounds="12,6 to 36,39"
				step_size=4
				New()
					..()
					var/turf/T
					Enemy_stats()
					for(T in range(3, src))
						if(T)
							if(!T.density)

								new/obj/enemyarea(T,src)

					for(var/mob/Enemy/c in oview(3,src))
						src.ContainMobs+=c
					src.ContainMobs+=src

