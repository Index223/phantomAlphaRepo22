/*
	***************************************
	Author: Tafe
	Link: http://www.byond.com/members/Tafe
	Contact: irc.freenode.net:##BYOND_owl
	***************************************

	Originates from library: Owl_attributeClass
	Link: http://www.byond.com/developer/Tafe/owl_attributeClass

*/


#define LEVELCAP 100	//defines levelcap. precompilement

//attribute acts as stats
//The mob tree is below

attribute
	var/name		//name
	var/value = 0	//The value of this attribute
	var/limit = 0   // max is a built-in proc, so don't use it as a var name
	var/level = 1	// Current level
	var/xp = 0		//current experience
	var/xp_next = 100 	// xp for next level
	var/xp_total = 0	//Total amount of xp required, ever
	var/limit_gain_rate = 1.9	//How fast it's value increases after leveling /attribute
	var/xp_gain_rate = 1.12		//How fast xp grows after leveling /attribute

	//set all variables at creation
	New(name,value=0,level=1,xp_next=100,limit_gain_rate=1.5, xp_gain_rate=1.04)
		src.name = name
		src.value = value
		src.limit = value
		src.level = level
		src.xp_next = xp_next
		src.limit_gain_rate = limit_gain_rate
		src.xp_gain_rate = xp_gain_rate

	/*

	OK WOW MAN THIS IS NICE

	NOW I FINNALY GET IT WOW


	Yeah, so:

	limit = max value, i.e :   	maxhp
	value = current value :		hp

	*/

	proc
		//here
		gain_xp(_xp)
			//add argument _xp to xp wow so you can set it for each how much to lvl up
			//Yes, and how fast they can grow in value so i dont need stupid += round( blalbaboost)
			//Nope
			xp += _xp
			xp_total += _xp

			. = level
			while(xp >= xp_next && level < LEVELCAP)//This is it
				//this increases limit/value.
				//round(level * limit_gain_rate) makes it increase faster at higher levels.
				//It scales exponentially
				limit += round(level * limit_gain_rate) //and this sets
				value = limit
				++level
				xp -= xp_next
				xp_next = round(xp_next * xp_gain_rate, 1)// so i dont actually need lvl up proc now ? Sort of, no. i have one here tho

		//get values
				//	if this is true ? do this : this otherwise false nice :D yeah. skipping a lot of ifs i al
		name()	return name ? name : 0
		value() return value ? value : 0
		limit() return limit ? limit : 0 // this is so nice :O
		xp() 	return xp ? xp : 0
		xp_next() return xp_next ? xp_next : 0
		limit_gain_rate() 	return limit_gain_rate ? limit_gain_rate : 0
		xp_gain_rate()		return xp_gain_rate ? xp_gain_rate : 0

		//set values
		setValue(val)
			try
				value = val
			catch(var/exception/e)
				world.log << "[e] on [e.file]:[e.line]"
		setLimit(val)
			try
				limit = val
			catch(var/exception/e)
				world.log << "[e] on [e.file]:[e.line]"
		setLevel(val)
			try
				level = val
			catch(var/exception/e)
				world.log << "[e] on [e.file]:[e.line]"
		setXp(val)
			try
				xp = val
			catch(var/exception/e)
				world.log << "[e] on [e.file]:[e.line]"
		setXp_next(val)
			try
				xp_next = val
			catch(var/exception/e)
				world.log << "[e] on [e.file]:[e.line]"
		setLimit_gain_rate(val)
			try
				limit_gain_rate = val
			catch(var/exception/e)
				world.log << "[e] on [e.file]:[e.line]"
		setXp_gain_rate(val)
			try
				xp_gain_rate = val
			catch(var/exception/e)
				world.log << "[e] on [e.file]:[e.line]"

