
mob
	verb
		jump()
			usr.density=0
			usr.step_size=6
			animate(usr, pixel_z = 36, time = 2)
			usr.layer=11
			usr.icon_state="run"

			spawn(3)
				if(client)
					animate(usr, pixel_z = 0, time = 2)
					spawn(3)
						if(client)
							usr.layer=MOB_LAYER
							usr.density=1
							usr.step_size=4
							usr.icon_state=""




