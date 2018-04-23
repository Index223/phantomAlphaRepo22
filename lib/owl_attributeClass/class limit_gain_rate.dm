/*

	Author: Tafe

	Desc:


	This defines how fast certain stats shall increase pr. level
*/



/*
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
*/
mob/var/const
	TANK_HP_RATE = 100 // you allready set everything ^^
	TANK_KI_RATE = 1
	TANK_ENERGY_RATE = 150

	MAGE_HP_RATE = 45
	MAGE_KI_RATE = 200
	MAGE_ENERGY_RATE = 1

	FIGHTER_HP_RATE = 65
	FIGHTER_KI_RATE = 1
	FIGHTER_ENERGY_RATE = 200

mob/proc
	//Initialize to tell leveling system how fast levels go wow man you did all of this ? lol yeah, but i had a reference on my other screen. oh xD cus its alot
	//This Proc is initialized to players after selecting class.
	stats_element_limit_gain()
		if(element == "Tank")
			/*
			The quick explanation is:
				every attribute levels up asynchron
				This defines how fast every stat increases.

				This needs to be called for players to innherit the correct gain_rate to each stat attribute.

				call stats_element_limit_gain()
				after character creation

				there is a few debug methods we need to add
			*/
			stats["hp"].set_limit_gain_rate(TANK_HP_RATE)
			stats["ki"].set_limit_gain_rate(TANK_KI_RATE)
			stats["energy"].set_limit_gain_rate(TANK_ENERGY_RATE)
		if(element == "Mage")
			stats["hp"].set_limit_gain_rate(MAGE_HP_RATE)
			stats["ki"].set_limit_gain_rate(MAGE_KI_RATE)
			stats["energy"].set_limit_gain_rate(MAGE_ENERGY_RATE)
		if(element == "Fighter")
			stats["hp"].set_limit_gain_rate(FIGHTER_HP_RATE)
			stats["ki"].set_limit_gain_rate(FIGHTER_KI_RATE)
			stats["energy"].set_limit_gain_rate(FIGHTER_ENERGY_RATE)

		#ifdef WORLDLOG // what is that ? i never knew about this. predefinitions.
		world.log << "[src].stats_element_limit_gain(), element: [src.element]"
		world.log << "hp limit_gain_rate: [src.stats["hp"].limit_gain_rate()]"
		world.log << "ki limit_gain_rate: [src.stats["ki"].limit_gain_rate()]"
		world.log << "energy limit_gain_rate: [src.stats["energy"].limit_gain_rate()]"
		#endif