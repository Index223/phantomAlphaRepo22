image/damage
	layer = FLY_LAYER+20
	maptext_height = 50 // or higher
	maptext_width = 55
image/damage2
	layer = FLY_LAYER
	maptext_height = 50 // or higher
	maptext_width = 55
	pixel_x = -64
proc
	show_damage(atom/atom,damage,color="#000")
		var/image/damage/dmg = new(loc=atom,icon=null)
		dmg.maptext = "<center align=top><b><font color=[color] face=Calibri size=2>[damage]"

		world << dmg
		spawn(1)
			for(var/i in 1 to 5)
				dmg.maptext_height += 8
				sleep(1)
			del dmg
	show_damage2(atom/atom,damage,color="#000")
		var/image/damage/dmg = new(loc=atom,icon=null)
		dmg.maptext = "<center align=top><b><font color=[color] face=Calibri size=2>[damage]"
		atom << dmg
		spawn(1)
			for(var/i in 1 to 5)
				dmg.maptext_height += 8
				sleep(1)
			del dmg
	show_damage4(atom/atom,damage,color="#ffff00")
		var/image/damage/dmg = new(loc=atom,icon=null)
		dmg.maptext = "<center align=top><b><font color=[color] face=Calibri size=2>[damage]"
		atom << dmg
		spawn(1)
			for(var/i in 1 to 5)
				dmg.maptext_height += 8
				sleep(1)
			del dmg
mob
	proc
		show_damage3(atom/atom,damage,color="#000")
			var/image/damage2/dmg = new(loc=atom,icon=null)
			dmg.maptext = "<center align=top><b><font color=[color] face=Calibri size=3>[damage]"
			dmg.maptext_width=183
			src << dmg
			spawn(1)
				for(var/i in 1 to 12)
					dmg.maptext_height += 8
					sleep(1.2)
				del dmg
mob

	proc
		DamageAI(mob/a,damage)
			if(a.dead)return
			if(prob(a.dodge) ||a.see_invisible ==2)
				show_damage(a,"Dodge","white")
				return
			if(prob(src.critical))
				var/criticaldmg = damage*2
				a.stats["hp"].setValue(a.stats["hp"].value() - criticaldmg)
				show_damage(a,"[criticaldmg]","yellow")
			else
				a.stats["hp"].setValue(a.stats["hp"].value() - damage)
				//a.hp -= damage
				show_damage(a,"[damage]","red")

			//	DeathCheck(m,src)
		Damage(mob/a,damage)
			if(a.dead)return
			if((istype(src,/mob/player)) && (istype(a,/mob/player)))


				if(a.stats["level"].value() < 20 || src.stats["level"].value() < 20)
					_message(src,"<font color=gray>PvP will be activated at lvl 20")
					return
			if(prob(a.dodge))
				show_damage(a,"Dodge","white")
				return
			if(prob(src.critical))
				var/criticaldmg = damage*2
				a.stats["hp"].setValue(a.stats["hp"].value() - criticaldmg)
			//	a.hp -= criticaldmg
				show_damage(a,"[criticaldmg]","yellow")
			else
				a.stats["hp"].setValue(a.stats["hp"].value() - damage)
			//	a.hp -= damage
				show_damage(a,"[damage]","red")
			if(istype(a,/mob/player))
				var/mob/player/m = a

				if(a.stats["hp"].value() < 1)
					src.money+= m.money
					m.money = 0
					src.give_xp(m.stats["level"].xp()) // Is this the experience it gives away if you kill it ?

					// if player kills player money is set to 0 and owner gets targets exphmmm....
					//This one is a bit tricky. because

				m.WidthTotal()
				m.GetWidth()
				m.Check()
				m.UpdateHud()







