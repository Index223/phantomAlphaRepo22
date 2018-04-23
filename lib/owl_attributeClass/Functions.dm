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
			"deflect" = new/attribute("deflect" , 5, 1, 100, 2, 1.1),


			//Don't need "bonus" attributes.
			//call stats[attribute].setValue()
			//to change the stat's potency.
			"bonusstr" = new/attribute("bonusstr" , 5, 1, 100, 2, 1.1),
			"bonusmag" = new/attribute("bonusmag" , 5, 1, 100, 2, 1.1),
			"bonusdef" = new/attribute("bonusdef" , 5, 1, 100, 2, 1.1))


		attribute_give_xp(attribute, amount)
			/*
			This is an overhead function, that allows us to call to an attribute for it it gain_xp()
			Don't use this specific proc elsewhere. This is only used by give_xp(): Line 47
			*/
			var/attribute/a = stats && stats[attribute]
			if(a) a.gain_xp(amount)
			else
				throw EXCEPTION("[src.name].give_xp() : could not find [attribute] in [src.name]/var/list/stats \n file: Attributes.dm, Line 125")

		/*Then we have the actual proc that is used to grant experience to a player*/
		give_xp(attr, amount)
			attribute_give_xp(attr, amount)
			attribute_give_xp("level", amount) //Give level XP at all times, so you don't have to deal with giving level experience elsewhere
			attribute_give_xp("stamina", amount) //stamina could grow on it's own as you level up.

			/*
			This could be changable later.
			*/