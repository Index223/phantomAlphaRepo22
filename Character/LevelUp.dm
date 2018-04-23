mob
	var/tmp/leveling=0
	proc
		Level_Up(/*Phat T*/)
			if(src.exp >= src.maxexp)
				if(!src.leveling)
					src.leveling = 1
					var/max_exp = src.maxexp + 85
					var/hpboost
					var/kiboost
					var/staminaboost

					if(src.element =="Tank")

						hpboost = 100
						kiboost=1
						staminaboost=150
					else if(src.element =="Mage")
						hpboost = 45
						kiboost=200
						staminaboost=1
					else if(src.element =="Fighter")
						hpboost = 65
						kiboost=1
						staminaboost=200

					var/rollover_exp = src.exp - src.maxexp
					src.maxexp = max_exp

					src.maxhp += hpboost
					src.maxki+= kiboost
					src.maxenergy+= staminaboost
					src.exp = rollover_exp

					src.level ++
					src.techpoints +=3
					src.battlepoints += 3
					src.Lvlupindicator(/*Phat T*/) // meeeh
					/*
					It was big and messy. and i felt i wanted to instroduce something new. worked on it for a while tbh. cause i didn't know how
					to make it work. Then build 512 came. <3 list[].functionFromListDatum() oh but this is rly nice i can avoid my ugly lvl up system now
					Y
					*/

					if(src)
						src.leveling=0
						src.WidthTotal()
						src.GetWidth()
						src.Check()
						src.UpdateHud()

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