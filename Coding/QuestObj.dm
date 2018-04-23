
obj
	QuestItem
		var/PortretIcon=null
		var/npctext=null
		var/QIcons=null
		var/questlvl=null
		proc/Display()
		Ganos
			icon='QuestComplete.dmi'
			icon_state="incomplete"
			PortretIcon =icon('Portret.dmi',icon_state="1")
			name="Ganos"
			QIcons=icon('ObjsQuest.dmi',icon_state="shrooms")
			questlvl=1
			npctext="You... You are still alive?Ciar unleashed his powers and destroyed the entire galaxy, and somehow your powers could resist it! It is a miracle! And now you have been brought back to Earth? I guess your story didn't quite end for you. You have been given a second chance!You are wounded, go and collect green mushrooms. They will heal you! I heard they grow near the city, but is difficult to find. Find me 10 mushrooms and i will aid you with a medicine for your wounds. \n Reward:\n +100 Experience"
			suffix="Click face icon to see more info"

			Display(mob/m)
				if(m)
					winset(m,"nameq_ID","text=\"Name\"")
					winset(m,"Quester.QuestName","text=\"[src.name]\"")
					winset(m,"Quester.Icon", "image=\ref[fcopy_rsc(src.PortretIcon)]\"")

					src.suffix="<font size = 1>Quest level [src.questlvl] Incomplete</font color>"
					winset(m,"Quester.InfoQuest","text=\"[src.npctext]\"")
					winset(m,"Quester.QIcons","image=\ref[fcopy_rsc(src.QIcons)]\"")
					winset(m,"Quester.leftquset","text=\"X [m.shroomscollected]\"")

					m.UpdateQuestBook(/*Phat T*/)
					winshow(m,"Quester.InfoQuest",1)
					winshow(m,"Quester.QuestName",1)
					winshow(m,"Quester.QIcons",1)
					winshow(m,"Quester.leftquset",1)
					winshow(m,"Quester.nameq_ID",1)
					winshow(m,"Quester.Done_",1)
					winshow(m,"Quester.Icon",1)
					winshow(m,"Quester.Done_",1)
		Elyse
			icon='QuestComplete.dmi'
			icon_state="incomplete"
			PortretIcon =icon('Portret.dmi',icon_state="4")
			name="Elyse"
			QIcons=icon('ObjsQuest.dmi',icon_state="minerals")
			questlvl=2
			npctext="Oh, you are warrior!\nYou are the one who survived Ciar's attack! Wow, that is truly a miracle... \nYou... You could be the one to save our planet! \nHere, let me help you! Over there by that cave. Go inside the cave and bring me some minerals.\nI want to help you by making you a weapon! \nThe minerals can be a bit of a hazzle, so you need to throw a few punches before it breaks loose. \nBring me 20 mineral pieces from the cave, and i will make you a weapon!\n\n\nReward:\n+ 150 Experience \n+ Weapon"
			suffix="Click face icon to see more info"
			Click(/*Phat T*/)
				winset(usr,"nameq_ID","text=\"Name\"")
				winset(usr,"Quester.QuestName","text=\"[src.name]\"")
				winset(usr,"Quester.Icon", "image=\ref[fcopy_rsc(src.PortretIcon)]\"")
				src.suffix="<font size = 1>Quest level [src.questlvl] Incomplete</font color>"
				winset(usr,"Quester.InfoQuest","text=\"[src.npctext]\"")
				winset(usr,"Quester.QIcons","image=\ref[fcopy_rsc(src.QIcons)]\"")
				winset(usr,"Quester.leftquset","text=\"X [usr.mineralsgathered]\"")

				usr.UpdateQuestBook(/*Phat T*/)
				winshow(usr,"Quester.QuestName",1)
				winshow(usr,"Quester.InfoQuest",1)
				winshow(usr,"Quester.QIcons",1)
				winshow(usr,"Quester.leftquset",1)
				winshow(usr,"Quester.nameq_ID",1)
				winshow(usr,"Quester.Icon",1)
				winshow(usr,"Quester.Done_",1)



mob
	verb
		CompleteQuest(/*Phat T*/)
			set hidden = 1
			if(usr.queststage == 1 && usr.shroomscollected==5)
				var/obj/QuestItem/Ganos/c =locate(/*Phat T*/) in usr.Questbooklist
				usr.Questbooklist-=c
				usr.UpdateQuestBook()
				usr.give_xp(100)
				usr.queststage=2
				usr.Questbooklist+=new/obj/QuestItem/Elyse
			if(usr.queststage==2 && usr.mineralsgathered == 20)
				var/obj/QuestItem/Elyse/c =locate(/*Phat T*/) in usr.Questbooklist
				usr.Questbooklist-=c
				usr.UpdateQuestBook()
				usr.give_xp(150)
				usr.queststage=3



mob
	var
		shroomscollected=0
		mineralsgathered=0


obj
	Mushroom
		icon='MapTurfs2.dmi'
		icon_state="38"
		var/Amount=1

		MouseDrag(src_object,over_object,src_location,over_location,src_control,over_control,params)// When we drag it...

			if(!(src in usr.contents)) return // If its not in our inventory...just cancel ...
			var/icon/I = new(src.icon,src.icon_state)//this is so the cursor icon transforms into the item itself...cool little effect.
			mouse_drag_pointer = I // now lets set the mouse cursor to that.

		MouseDrop(over_object=src,src_location,over_location, src_control,over_control,params) //When we drop it...

			if(over_control =="inventory.Inv") //If its inside the inventory window.
				var/obj/O = over_object
				src.screen_loc = O.screen_loc //Move the object on the new slot.

			if(over_control == "default.map1")
				src.screen_loc = null
				src.loc = usr.loc //over_location if you want it to be where the mouse is


		verb
			Get()
				set category = null
				var/mob/player/m = usr
				set src in oview(1)
				if(m.queststage==1)



					if(m.shroomscollected<10)
						if(src in usr.contents) //If the item is inside my inventory
							return
						else   // If not...


							var/obj/Mushroom/b = locate(src.type) in m.contents
							if(b)
								if(b.type == src.type)
									if(b.Amount>=1)
										b.Amount ++
										b.maptext="<font color=white><b>x [b.Amount]"


							if(!b)
								src.maptext="<font color=white><b>x [src.Amount]"
								m.contents.Add(src) //Add the item to my inventory
								m.CloseInventory()
								m.Inventory()




						m.shroomscollected ++
						src.loc=pick(locate(53,147,1),locate(41,143,1),locate(21,138,1),locate(18,131,1),locate(33,129,1),locate(43,117,1),locate(89,113,1),locate(73,112,1),locate(88,104,1),locate(96,126,1),locate(80,147,1),locate(52,152,1))
					//else
