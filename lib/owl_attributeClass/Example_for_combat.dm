/*

mob/proc
	death()
		invisibility = 100
		density = 0
		dead = true
		see_invisible = 100
		deathSight(true)
		spawn(respawnTime)	src.respawn()
		#ifdef WORLDLOG
		print(world.log, "[src].death()")
		#endif
obj
	deathSight
		icon = 'deathSight.dmi'
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
				print(world.log, "[e] at [e.file]:[e.line]")
			return false

		regenSetStamina()
			try
				stats["stamina"].setValue(stats["stamina"].limit)
			catch(var/exception/e)
				print(world.log, "[e] at [e.file]:[e.line]")
			return true

		regen()

			combat_regenerating = true

			while(combat_regenerating)
				while(stats["stamina"].value() < stats["stamina"].limit())
					var/r = round(stats["regen"].value())
					stats["stamina"].setValue(stats["stamina"].value()+r)
					gainXP("regen", 10)

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
		set_attribute_value("stamina", get_attribute_limit("stamina"))
		#ifdef WORLDLOG
		print(world.log, "[src].respawn()")
		#endif
mob/proc
	takeDamage(_damage)
		set_attribute_value("stamina", get_attribute_value("stamina") - _damage)
		if(!combat_regenerating) regen()
		if(get_attribute_value("stamina") <= 0)
			death()
*/