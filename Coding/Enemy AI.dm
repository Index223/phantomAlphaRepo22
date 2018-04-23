
mob
	var
		bossable=0
	Enemy
		var
			mob/player/target=0
			keep_dist = 1
			chase_speed = 1
			turf/aggro_loc=0
			turf/home_loc=0
			energy_blast=0
			spawndelay=0
			next_attack = 0
			nonmovable=0
			fallower=0
			special=0
		Move()
			..()             //prevent diagonal movement
		proc
			BossStage()
			foundTarget(var/mob/player/c)
				if(!src.target)
					src.target = c
					aggro_loc = src.loc
					src.chaseState(/*Phat T*/)
			resetState(/*Phat T*/)
				set waitfor=0
                       //if the path is blocked, take a random step
				if(!src.home_loc)
					src.target=null
					src.aggro_loc=null
					src.target=null
					src.loc=null
				else
					src.loc = home_loc
					src.hp = src.maxhp
					src.aggro_loc=null
					src.target=null

			chaseState(/*Phat T*/)
				set waitfor=0
				var/d = bounds_dist(src,target)
				var/distance = (target.bound_x + target.bound_y) / 2
				while(target)
					//if the target is out of range of dead, bail out.
					if(get_dist(src,target) > 7)
						resetState(/*Phat T*/)
						return 0
					if(distance>d)
						if(world.time>=next_attack)
							melee()
					else
						. = step(src,get_dir(src,target))
						if(!.)
							step_rand(src)
					sleep(chase_speed)
					d = bounds_dist(src,target)
				resetState(/*Phat T*/)
			blast()
			melee()

				var/power = src.str*rand(25.1,34.9)
				var/defense = target.def*2
				var/_damage = round(power/defense)
				src.DamageAI(src.target, _damage)
				src.next_attack = world.time+rand(10,15)

