
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

			..()
	                //prevent diagonal movement



		proc
			BossStage()
			foundTarget(var/mob/player/c)

				if(!src.target)

					src.target = c
					aggro_loc = src.loc
				/*	if(src.speactext)
						var/s = speech_bubble("[src.speactext]", width = 4)

						sleep(5)
						del s*/
					src.chaseState(/*Phat T*/)




			resetState(/*Phat T*/)
				set waitfor=0
				var
                       //allow us longer than it should take to get home via distance
					returntime = world.time + get_dist(src,home_loc) * (3 + chase_speed) // they are also walking back to the spawn if they cant chase anymore

				while(world.time<returntime&&src.loc!=home_loc)
                       //if the path is blocked, take a random step
					if(!src.home_loc)
						src.target=null
						src.aggro_loc=null
						src.target=null
					//	src.loc=null
						break


					. = step(src,get_dir(src,home_loc))
					if(!.)
						step_rand(src)
					if(src.target)
						break
					if(world.time>=returntime&&src.loc!=home_loc)
						src.loc = home_loc
						src.hp = src.maxhp
						src.aggro_loc=null
						src.target=null
						break
					sleep(chase_speed)
				src.hp = src.maxhp

			chaseState(/*Phat T*/)
				set waitfor=0
				var/d = bounds_dist(src,target)
				var/distance = (target.bound_x + target.bound_y) / 2
				while(d>distance)
					//if the target is out of range of dead, bail out.
					if(!src.target)
						resetState(/*Phat T*/)
						return 0

					. = step(src,get_dir(src,target))
					if(!.)
						step_rand(src)
					sleep(chase_speed)
					d = bounds_dist(src,target)
				attackState(/*Phat T*/)
				return 1


			attackState(/*Phat T*/)
				set waitfor=0
				var/d
				var/distance = (target.bound_x + target.bound_y) / 2
				while(target)
					if(!src.target)
						resetState(/*Phat T*/)
						return 0
					d = bounds_dist(src,target)

                        //if the target is too far away, chase
                        //if the target is too close, avoid

                        //if we are eligible to attack, do it.

					if(d>distance)
						chaseState(/*Phat T*/)
						return
					else
						if(world.time>=next_attack)
							if(src.dir==get_dir(src,target))

								melee()

							else
								. = step(src,get_dir(src,target))
					sleep(chase_speed)

			blast()
			melee()

				var/power = src.str*rand(25.1,34.9)
				var/defense = target.def*2
				var/_damage = round(power/defense)
				src.DamageAI(src.target, _damage)
				src.next_attack = world.time+rand(10,15)

