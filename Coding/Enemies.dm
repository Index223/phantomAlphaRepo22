/*obj
	Enemyarea
		icon= 'TestRange.dmi'
		var
			mob/Enemy/owner

		bounds = "1,1 to 256,256"
		New(location, mob/Enemy/shooter)
			if(!ismob(shooter)) return
			if(shooter)
				src.owner = shooter
			..(/*Phat T*/)


		Entered(mob/m)
			_message(world, "[m] entered")
			if(istype(m,/mob/player))

 				src.owner.foundTarget(m)*/


turf
	enemyarea
		icon='Void.dmi'
		density=0
		alpha=100
		layer=5
		layer=TURF_LAYER

		var
			mob/Enemy/owner = null
		New(location, mob/shooter)

			if(shooter)

				src.owner = shooter




		Entered(mob/m)
			if(istype(m,/mob/player/))
				var/mob/player/pl = m
				if(src.owner)
					for(var/mob/Enemy/tr in src.owner.ContainMobs)
						tr.foundTarget(pl)
					//src.owner.foundTarget(pl)
		Exited(mob/m)
			if(istype(m,/mob/player/))

				if(src.owner)
					for(var/mob/Enemy/tr in src.owner.ContainMobs)

						tr.target=null





mob
	verb
		Test()
			var/turf/T
			for(var/mob/Enemy/m in world)
				for(T in range(3, m))
					if(T)
						new/turf/enemyarea(T,m)

						m.ContainMobs+=m


mob
	Bosses
	Enemy
		New(/*Phat T*/)
			..(/*Phat T*/)

			maxhp=hp
			src.home_loc = src.loc
		var/speactext
		var/list/ContainMobs=list()

		icon='Enemies.dmi'
		Earthregion
			Brusolini3
				icon_state="enemy11"
				bounds="12,6 to 36,39"
				step_size=4
				New()
					var/turf/T

					for(T in range(3, src))

						if(T)
							if(!T.density)
								new/turf/enemyarea(T,src)
					for(var/mob/Enemy/c in range(3,src))

						src.ContainMobs+=c


			Brusolini5
				icon_state="enemy3"
				bounds="12,6 to 36,39"
				step_size=4
				New()
					var/turf/T

					for(T in range(3, src))

						if(T)
							if(!T.density)
								new/turf/enemyarea(T,src)

					for(var/mob/Enemy/c in range(3,src))

						src.ContainMobs+=c

