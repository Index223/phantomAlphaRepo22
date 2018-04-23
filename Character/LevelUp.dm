mob


	proc
		Lvlupindicator(/*Phat T*/)
			src.underlays += /obj/Indicators/Levelup
			spawn(0.25*45)
			if(client)
				src.underlays -= /obj/Indicators/Levelup

obj
	Indicators
		Levelup
			icon = 'lvlup.dmi'

			density = FALSE
			pixel_y = 48
			layer = 100