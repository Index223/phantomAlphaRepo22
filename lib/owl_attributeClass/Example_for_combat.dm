#define true TRUE
#define false FALSE

//This is my example of a combat system
//Using the attributes.
//Implementing it to your system can turn out to be a bit wierd. but i will try.
// I didn't intend for you using it. It is merely an example you can look at to get a grasp of how attributes work.
mob
	var
		respawnTime = 50
		inCombat = FALSE

	// Just for an example.
	// To give "regen" attribute to stats, for regen functions to work
	proc/give_regen()
		stats += list("regen", new/attribute( "regen", 5, 1, 100, 2, 1.1))



mob/proc
	death()
		invisibility = 100
		density = 0
		dead = true
		see_invisible = 100
		deathSight(true)
		spawn(respawnTime)	src.respawn()

		#ifdef WORLDLOG
		world.log <<  "[src].death()"
		#endif
obj
	deathSight
		color = rgb(50,50,50, 50)
		layer = 7
		screen_loc = "SOUTHWEST to NORTHEAST"

mob/proc

	deathSight(toggle)
		if(client)
			var/obj/deathSight/o = new/obj/deathSight
			if(toggle)
				client.screen += o
			if(!toggle)
				for(var/obj/deathSight/_o in client.screen)
					client.screen -= _o
mob/proc
	inCombat(argument)
		if(argument == true)
			inCombat = true

mob
	var
		combat_regenerating = false
		alreadyRegening = false
		const
			REGEN_DELAY = 10
	proc
		regenCheckStamina()
			try
				return stats["stamina"].value() >= stats["stamina"].limit() ? true : false
			catch(var/exception/e)
				world.log << "[e] at [e.file]:[e.line]"
			return false

		regenSetStamina()
			try
				stats["stamina"].setValue(stats["stamina"].limit)
			catch(var/exception/e)
				world.log << "[e] at [e.file]:[e.line]"
			return true

		regen()
			/*Using stat["regen"]
			I will include this on top.*/

			combat_regenerating = true

			while(combat_regenerating)
				while(stats["stamina"].value() < stats["stamina"].limit())
					var/r = round(stats["regen"].value())
					stats["stamina"].setValue(stats["stamina"].value()+r)
					give_xp("regen", 10)

					if(regenCheckStamina())
						return regenSetStamina()
					sleep(REGEN_DELAY)
				sleep(REGEN_DELAY)
mob/proc
	respawn()
		invisibility = 0
		density = 1
		dead = false
		see_invisible = 0
		deathSight(false)
		stats["hp"].setValue(stats["hp"].limit())

		#ifdef WORLDLOG
		world.log <<  "[src].respawn()"
		#endif
mob/proc
	takeDamage(_damage)
		stats["hp"].setValue(stats["hp"].value() - _damage)
		if(!combat_regenerating) regen()
		if(stats["hp"].value() <= 0)
			death()
