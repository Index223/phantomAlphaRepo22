mob
	player
		verb
			CloseNPCChat(/*Phat T*/)
				set hidden = 1
				var/mob/player/m = usr
				m.interacting=0
				m.frozen=0
				if(m.questbookopen)
					m.questbookopen=0
					winshow(m,"questbookchild",0)
				winshow(m,"default.npcdialog",0)

				winshow(src,"default.shopchil",0)
mob
	var
		list
			Questbooklist=list(new/obj/QuestItem/Ganos)
mob

	verb
		UpdateQuestBook()
			set hidden = 1
			var/iy = 0
			winshow(usr,"Quester.InfoQuest",0)
			winshow(usr,"Quester.QuestName",0)
			winshow(usr,"Quester.QIcons",0)
			winshow(usr,"Quester.leftquset",0)
			winshow(usr,"Quester.nameq_ID",0)
			winshow(usr,"Quester.Done_",0)
			winshow(usr,"Quester.Icon",0)
			for(var/obj/i in usr.Questbooklist)
				usr << output(i,"QuestDisplay:1,[++iy]")
				usr << output(i.suffix,"QuestDisplay:2,[iy]")

			winset(usr, "QuestDisplay", "cells=2x[iy]")
	player
		verb


			Interact()
				set hidden = 1
				var/mob/player/m = usr
				var/obj/Npcs/npcs = locate() in oview(m,1)
				if(npcs)

					if(!m.interacting)
						m.frozen=1
						m.interacting=1
						if(istype(npcs,/obj/Npcs/QuestBoard))
							if(!m.questbookopen)
								var/obj/QuestItem/c = locate() in m.Questbooklist
								if(c)
									spawn if(m) c.Display(m)
								m.questbookopen=1
								winshow(m,"questbookchild",1)
								m.UpdateQuestBook(/*Phat T*/)
						else

							winset(m,"QuestWindow.NPCName","text=\"[npcs.name]\"")
							winset(m,"QuestWindow.Icon", "image=\ref[fcopy_rsc(npcs.PortretIcon)]\"")
							winset(m,"QuestWindow.NPCText","text=\"[npcs.npctext]\"")
							winshow(m,"default.npcdialog",1)
					else if(m.interacting) CloseNPCChat(/*Phat T*/)

/*
		if(istype(npcs,/obj/Npcs/QuestBoard))
							if(!m.questbookopen)
								var/obj/QuestItem/c = locate() in m.Questbooklist
								if(c)
									spawn if(m) c.Display(m)
								m.questbookopen=1
								winshow(m,"Quester",1)
								m.UpdateQuestBook(/*Phat T*/)*/
obj
	Npcs
		var
			questhold
			PortretIcon
			npctext
		density=1
		layer=5
		Lancel
			icon='Npc.dmi'
			icon_state="Lancel"
			name="Lancel"
			bounds = "30,1 to 64,48"
			PortretIcon =icon('Portret.dmi',icon_state="lancel")
			npctext ="Hello there warrior! You are more than welcome here in our city. As you can see you are at the center of the city right now! There is a qeast board located north from here where you can start doing quests!"
		QuestBoard
			icon='QuestBorder.dmi'
			bounds="4,3 to 71,17"
			icon_state="fix"
			density=1


