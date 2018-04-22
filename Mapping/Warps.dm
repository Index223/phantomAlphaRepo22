obj
	Hud
		Fog
			icon='FogTest.dmi'
			screen_loc="1,1"
			icon_state="1"
			alpha =0
			New()
				spawn
					if(src)
						animate(src, transform = matrix()*1, alpha = 255, time = 10)
		Fog2
			icon='FogTest.dmi'
			screen_loc="1,1"
			icon_state="2"
			alpha =0
			New()
				spawn
					if(src)
						animate(src, transform = matrix()*1, alpha = 100, time = 10)
mob
	player
		var
			fog=0
mob
	player
		proc
			AddFog()
				var/mob/player/c = src
				if(!c.fog)
					c.fog=1
					var/chatbox_gui/background/b = locate() in  c.client.screen
					if(b)
						b.alpha=0
					c.client.screen +=  new/obj/Hud/Fog
					c.screenobjects +=  new/obj/Hud/Fog
			RemoveFog()
				var/mob/player/c = src
				if(c.fog==1)
					c.fog = 0
					var/chatbox_gui/background/b = locate() in  c.client.screen
					if(b)
						b.alpha=200
					var/obj/Hud/Fog/fg =locate() in c.client.screen
					if(fg)
						c.client.screen-=fg
						var/obj/Hud/Fog/fog =locate() in c.screenobjects
						if(fog)
							c.screenobjects-= fog
			AddWater()
				var/mob/player/c = src
				if(!c.fog)
					c.fog=2
					var/chatbox_gui/background/b = locate() in  c.client.screen
					if(b)
						b.alpha=0
					c.client.screen +=  new/obj/Hud/Fog2
					c.screenobjects +=  new/obj/Hud/Fog2
			RemoveWater()
				var/mob/player/c = src
				if(c.fog==2)
					c.fog = 0
					var/chatbox_gui/background/b = locate() in  c.client.screen
					if(b)
						b.alpha=200
					var/obj/Hud/Fog2/fg =locate() in c.client.screen
					if(fg)
						c.client.screen-=fg
						var/obj/Hud/Fog2/fog =locate() in c.screenobjects
						if(fog)
							c.screenobjects-= fog
turf
	TutorialWarp

		FogActivate
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.AddFog()

		FogDeactivate
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.RemoveFog()

		DogSaved

		StarterCaveEntered2
			Entered(mob/player/m)
				m.loc=locate(140,11,2)

		StarterCaveExited2
			Entered(mob/player/m)
				m.loc=locate(57,141,2)
		StarterCaveEntered3
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.loc=locate(73,13,2)
					c.AddFog()
		StarterCaveExited3
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.loc=locate(53,191,2)
					c.RemoveFog()
		WarpToUnderworld
			Entered(mob/m)
				var/mob/player/c = m
				if(istype(c,/mob/player))


					c.frozen=1
					animate(c,pixel_z =-128, time = 10)

					spawn(20*0.25)
						if(c)
							c.frozen=0
							c.pixel_z += 128
							c.loc=locate(6,11,3)
							c.AddWater()

				else
					show_damage(c,"Require bubble hat","yellow")

		WarpBackUnderworld
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m

					animate(c,pixel_z =128, time = 10)
					c.frozen=1
					spawn(10*0.25)
						if(c)
							c.frozen=0
							animate(c,pixel_z =0)
							c.loc=locate(191,108,1)
							c.RemoveWater()
		EnterBank
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.savezone=1
					c.loc=pick(locate(7,85,2),locate(8,85,2))
		ExitBank
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.savezone=0
					c.loc=locate(109,92,1)
		EnterArena
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					if(c.level > 19)
						c.savezone=1
						c.loc=pick(locate(17,63,2),locate(16,63,2))
					else
						show_damage2(c,"<font size=1>LvL 20","white")
		ExitArena
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.savezone=0
					c.loc=locate(81,92,1)
		Enterwater2
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.loc=locate(15,36,3)
		Exitwater2
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.loc=locate(196,22,3)
		Entershop
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.savezone=1
					c.loc=pick(locate(36,94,2),locate(37,94,2))
		Exitshop
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.savezone=0
					c.loc=locate(82,104,1)
		EnterGuildHouse
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.savezone=1
					c.loc=pick(locate(24,80,2),locate(23,80,2))
		ExitGuildHouse
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.savezone=0
					c.loc=locate(95,103,1)
		ExitTemple
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.loc=pick(locate(38,43,3),locate(39,43,3))
		EnterTemple
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m
					c.loc=locate(161,53,3)
		WarpToDeadWorld
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m

					c.frozen=1
					animate(c,alpha=0, time = 10)
					spawn(40*0.25)
						if(c)
							c.frozen=0
							animate(c,alpha=255,time = 10)
							c.loc=locate(15,25,5)



		WarpBackDeadWorld
			Entered(mob/m)
				if(istype(m,/mob/player))
					var/mob/player/c = m

					animate(c,alpha=0, time = 10)
					c.frozen=1
					spawn(40*0.25)
						if(c)
							c.frozen=0
							animate(c,alpha=255,time = 10)
							c.loc=locate(155,67,1)

