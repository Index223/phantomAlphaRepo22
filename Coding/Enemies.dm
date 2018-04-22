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





area
	enemyarea
		icon='Void.dmi'
		layer=5
		alpha = 100
		var

			tmp/mob/Enemy/owner = null
		New(location, mob/shooter) // store your location / src who is shooting
			if(!ismob(shooter)) return
			if(shooter)
				src.owner = shooter // claim shooter as src.owner
			..(/*Phat T*/)

		Entered(mob/m)
			if(istype(m,/mob/player/))
				var/mob/player/pl = m
				if(src.owner)
					_message(world, "[pl] entered [src.owner.claimedarea]")
					_message(world, "[pl] entered [src.owner.name]")
					src.owner.foundTarget(pl)  // src.owner start to find target
		Exited(mob/m)
			if(istype(m,/mob/player/))
				var/mob/player/pl = m
				if(src.owner)
					_message(world, "[pl] exited [src.owner.name]") //You don't need src. tho but, redundancy i guess
					src.owner.target=null
mob
	Bosses
	Enemy
		New()
			..()

			maxhp=hp
			src.home_loc = src.loc
		var/speactext
		var/claimedarea
		icon='Enemies.dmi'
		Earthregion
			Brusolini
				icon_state="enemy4"
				bounds="12,6 to 36,39"
				step_size=4
				New()
					..()
					var/turf/T // wanna show you my prob :D
					var/area/enemyarea/L  //this is already a new one I want to claim each mob heir area
					for(T in range(3, src)) // in range(3)
						L= new/area/enemyarea(T,src) // put are on 3x3 map and claim src as src.owner
						L.name = src.name
						src.claimedarea = L // this is just something new i wanted to try




			Brusolini2
				icon_state="enemy5"
				bounds="12,6 to 36,39"
				step_size=4
				New()
					..()
					var/turf/T // wanna show you my prob :D
					var/area/enemyarea/L  //this is already a new one I want to claim each mob heir area
					for(T in range(3, src))
						L= new/area/enemyarea(T,src)
						src.claimedarea = L


			Brusolini3
				icon_state="enemy11"
				bounds="12,6 to 36,39"
				step_size=4
				New()
					..()
					var/turf/T // wanna show you my prob :D
					var/area/enemyarea/L  //This is a bit wierd. Cause it creates a new area, and the settings should only affect the areas created, for that spe
					//specific object(/mob) but still, all areas is attached to the latest compiled /Brusolini, and i can't see why that is.
					// it is weird as fuck
					for(T in range(3, src))
						L= new/area/enemyarea(T,src)
						src.claimedarea = L


//this is actually a bit wierd.
//however, claimedarea shouldn't that be a list?
//It is a bit hard to look at the code, figure out what it means and then figure out what the error is :o



