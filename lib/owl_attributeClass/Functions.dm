mob
	var
		list/stats = list()	//initialize it as empty list, instead of null

	proc

		/*
			I will create a list of variables that is related to stats, then add them later on
		*/

		//need to refer mob/give_xp() to something else then attribute/gain_xp()

		give_stats()

			stats = list(\
			//New(name,value=0,level=1,xp_next=100,limit_gain_rate=1.5, xp_gain_rate=1.04)
			"level" = new/attribute("level", 1, 1, 100, 1, 1.1),
			"strength" = new/attribute("strength", 5,1, 100, 2, 1.1), // 5 str ok
			"defence" = new/attribute("defence", 5, 1, 100, 2, 1.1),
			"magic" = new/attribute("magic", 5, 1, 100, 2, 1.1),
			"hp" = new/attribute("magic", 200, 1, 100, 2, 1.1),

			"energy" = new/attribute("energy", 5, 1, 100, 2, 1.1),
			"ki" = new/attribute("ki" , 5, 1, 100, 2, 1.1),



			//Don't need "bonus" attributes.
			//call stats[attribute].setValue()
			//to change the stat's potency.
			"bonusstr" = new/attribute("bonusstr" , 5, 1, 100, 2, 1.1),
			"bonusmag" = new/attribute("bonusmag" , 5, 1, 100, 2, 1.1),
			"bonusdef" = new/attribute("bonusdef" , 5, 1, 100, 2, 1.1))

		/*Then we have the actual proc that is used to grant experience to a player*/
		//this is the whole level section.

		give_xp(amount)
			var/returnLevelUpIndicator = FALSE
			//give experience to an individual stat

			//static stats that gains experience no matter what.

			while(stats["strength"].gain_xp(amount) > 0) returnLevelUpIndicator = TRUE
			while(stats["defence"].gain_xp(amount) > 0) returnLevelUpIndicator = TRUE
			while(stats["magic"].gain_xp(amount) > 0) returnLevelUpIndicator = TRUE
			while(stats["level"].gain_xp(amount) > 0) returnLevelUpIndicator = TRUE
			while(stats["hp"].gain_xp(amount) > 0) returnLevelUpIndicator = TRUE
			while(stats["ki"].gain_xp(amount) > 0) returnLevelUpIndicator = TRUE
			while(stats["energy"].gain_xp(amount) > 0) returnLevelUpIndicator = TRUE
			if(returnLevelUpIndicator == TRUE) Lvlupindicator()
			/*
			This could be changable later. what is lvl up indicator :O ?
			Ops
			*/