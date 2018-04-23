obj
	CharacterHud
		icon='Hud.dmi'
		var/mob/owner

		New(mob/m)
			..()
			owner = m

		h1
			icon_state="1"
			screen_loc="12,1"
		h2
			icon_state="2"
			screen_loc="13,1 to 17,1"
		h3
			icon_state="3"
			screen_loc="18,1"
		h4
			icon_state="4"
			screen_loc="12,2"
		h5
			icon_state="5"
			screen_loc="13,2 to 17,2"
		h6
			icon_state="6"
			screen_loc="18,2"
		h7
			icon_state="7"
			screen_loc="12,3"
		h8
			icon_state="8"
			screen_loc="13,3 to 17,3"
		h10
			icon_state="10"
			screen_loc="18,3"
		h14
			layer=5
			icon_state="14"
			screen_loc="12:20,2:-20"
			maptext_y = 16
			maptext_x = 44

		h15
			layer=5
			icon_state="15"
			screen_loc="12:20,2:-38"
			maptext_x = 44
			maptext_y = 16
			New()
				if(owner)
					try
						if(!usr.stats["magic"])  world.log << "could not find stats: mamaggic"; return 0
						maptext_y = 16
						maptext_x = 44
						maptext="<b>[owner.stats["magic"].value()]"
					catch(var/exception/e) world.log << "[e] at [e.file]:[e.line]"
		h16
			layer=5
			icon_state="16"
			screen_loc="12:20,2:-54"
			maptext_x = 44
			maptext_y = 16
			New() // i think usr = null yeah... thats what i'm afraid of
				if(owner)
					try
						if(!usr.stats["defence"])  world.log << "could not find stats: defence"; return 0
						maptext_y = 16
						maptext_x = 44
						maptext="<b>[owner.stats["defence"].value()]"
					catch(var/exception/e) world.log << "[e] at [e.file]:[e.line]"
		stats
			icon='TechTree.dmi'
			icon_state ="stats"
			screen_loc="9,1"
			layer=OBJ_LAYER+1

			Click()
				var/mob/player/m = usr
				if(m.frozen)return
				if(!m.ttopen)
					m.ttopen =1
					m.StartTech()
				else
					m.ttopen=0
					m.CloseTech()

		quest
			icon='TechTree.dmi'
			icon_state ="Quest"
			screen_loc="10,1"
			layer=OBJ_LAYER+1
			var/PortretIcon
			Click()
				var/mob/player/m = usr
				if(!m.skilltree)
					src.PortretIcon =icon('SkillTree.dmi',icon_state="[m.element]")
					m.skilltree=1
					m.UpdateTech()
					winshow(m,"TechTree",1)
					winset(m,"TechTree.ClassLabel", "image=\ref[fcopy_rsc(src.PortretIcon)]\"")
				else
					m.skilltree=0
					winshow(m,"TechTree",0)





		Bag
			icon='TechTree.dmi'
			icon_state ="Bag"
			screen_loc="11,1"
			layer=OBJ_LAYER+1
			Click(/*Phat T*/)
				var/mob/player/m = usr

				if(!m.bagopened)
					m.bagopened=1
					m.Inventory()
				else
					m.bagopened=0
					m.CloseInventory()


mob
	player
		proc
			StartHud()

				src.screenobjects +=list(new/obj/CharacterHud/h1,
										new/obj/CharacterHud/h2,
										new/obj/CharacterHud/h3,
										new/obj/CharacterHud/h4,
										new/obj/CharacterHud/h5,
										new/obj/CharacterHud/h6,
										new/obj/CharacterHud/h7,
										new/obj/CharacterHud/h8,
										new/obj/CharacterHud/h10,
										new/obj/CharacterHud/h14(src),
										new/obj/CharacterHud/h15(src),
										new/obj/CharacterHud/h16(src),
										new/obj/CharacterHud/stats,
										new/obj/CharacterHud/quest,
										new/obj/CharacterHud/Bag)
				var/obj/CharacterHud/h14/a = locate() in src.screenobjects
				if(a)
					a.maptext="<b>[src.stats["strength"].value()]"

				var/obj/CharacterHud/h15/b = locate() in src.screenobjects
				if(b)
					b.maptext="<b>[src.stats["magic"].value()]"

				var/obj/CharacterHud/h16/c = locate() in src.screenobjects
				if(c)
					c.maptext="<b>[src.stats["defence"].value()]"
