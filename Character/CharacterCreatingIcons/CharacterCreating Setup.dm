mob
	creating
		proc/Create()
			var/obj/Hud/Txt1 = new/obj/Hud/Interface/Text_
			var/obj/Hud/Txt2 = new/obj/Hud/Interface/Text_
			var/obj/Hud/Txt3 = new/obj/Hud/Interface/Text_
			var/obj/Hud/Txt4 = new/obj/Hud/Interface/Text_
			var/obj/Hud/Txt5 = new/obj/Hud/Interface/Text_

			var/obj/Hud/CS1 = new/obj/Hud/CharacterInSlot
			var/obj/Hud/CS2 = new/obj/Hud/CharacterInSlot
			var/obj/Hud/CS3 = new/obj/Hud/CharacterInSlot
			var/obj/Hud/CS4 = new/obj/Hud/CharacterInSlot
			var/obj/Hud/DS1 = new/obj/Hud/DelSlot
			var/obj/Hud/DS2 = new/obj/Hud/DelSlot
			var/obj/Hud/DS3 = new/obj/Hud/DelSlot
			var/obj/Hud/DS4 = new/obj/Hud/DelSlot


			Txt1.screen_loc="10,8"
			Txt2.screen_loc="10,7"
			Txt3.screen_loc="10,6"
			Txt4.screen_loc="10,5"
			Txt5.screen_loc="9,9"

			CS1.screen_loc="8:24,8"
			CS2.screen_loc="8:24,7"
			CS3.screen_loc="8:24,6"
			CS4.screen_loc="8:24,5"

			DS1.screen_loc="13:-16,8"
			DS2.screen_loc="13:-16,7"
			DS3.screen_loc="13:-16,6"
			DS4.screen_loc="13:-16,5"

			src.client.screen+= Txt1
			src.client.screen+= Txt2
			src.client.screen+= Txt3
			src.client.screen+= Txt4
			src.client.screen+= Txt5


			src.client.screen+= CS1
			src.client.screen+= CS2
			src.client.screen+= CS3
			src.client.screen+= CS4

			src.client.screen+= DS1
			src.client.screen+= DS2
			src.client.screen+= DS3
			src.client.screen+= DS4
			Txt5.maptext_x = 24
			Txt5.maptext_y = 8

			Txt5.maptext="<font color=white><font family=Calibri> <b><font size=3>Character creation"

			if(fexists("CharacterSavefiles/[copytext(src.ckey,1,2)]/[src.ckey](S1).sav")) // if we have savefile
				Txt1.maptext="<font color=#3366ff><font family=Calibri> <b><font size=3>  Continue"
				CS1.overlays += icon('CW.dmi',icon_state="42")
				DS1.icon = icon('CW.dmi',icon_state="46")
				DS1.name="S1"
			else
				DS1.name=null
				DS1.icon = icon('CW.dmi',icon_state="41")
				Txt1.maptext="<font color=yellow><font family=Calibri> <b><font size=3>Empty Slot"

			if(fexists("CharacterSavefiles/[copytext(src.ckey,1,2)]/[src.ckey](S2).sav"))
				Txt2.maptext="<font color=#3366ff><font family=Calibri> <b><font size=3>  Continue"
				CS2.overlays += icon('CW.dmi',icon_state="43")
				DS2.icon = icon('CW.dmi',icon_state="46")
				DS2.name="S2"
			else
				DS2.name=null
				DS2.icon = icon('CW.dmi',icon_state="41")
				Txt2.maptext="<font color=yellow><font family=Calibri> <b><font size=3>Empty Slot"

			if(fexists("CharacterSavefiles/[copytext(src.ckey,1,2)]/[src.ckey](S3).sav"))
				Txt3.maptext="<font color=#3366ff><font family=Calibri> <b><font size=3>  Continue"
				CS3.overlays += icon('CW.dmi',icon_state="44")
				DS3.icon = icon('CW.dmi',icon_state="46")
				DS3.name="S3"
			else
				DS3.name=null
				DS3.icon = icon('CW.dmi',icon_state="41")
				Txt3.maptext="<font color=yellow><font family=Calibri> <b><font size=3>Empty Slot"
			if(fexists("CharacterSavefiles/[copytext(src.ckey,1,2)]/[src.ckey](S4).sav"))
				Txt4.maptext="<font color=#3366ff><font family=Calibri> <b><font size=3>  Continue"
				CS4.overlays += icon('CW.dmi',icon_state="45")
				DS4.icon = icon('CW.dmi',icon_state="46")
				DS4.name="S4"
			else
				DS4.name=null
				DS4.icon = icon('CW.dmi',icon_state="41")
				Txt4.maptext="<font color=yellow><font family=Calibri> <b><font size=3>Empty Slot"

		proc/SkinCreating()


			var/obj/Hud/Txt5 = new/obj/Hud/Interface/Text_
			Txt5.screen_loc="9,9"
			Txt5.maptext_x = 24
			Txt5.maptext_y = 8
			Txt5.maptext="<font color=white><font family=Calibri> <b><font size=3>   Pick your skin"

			var/obj/A = new/obj/Hud/SkinPick/WhitePl

			var/obj/B = new/obj/Hud/SkinPick/BlackPl

			var/obj/G = new/obj/Hud/SkinPick/Black1
			var/obj/H = new/obj/Hud/SkinPick/Black2
			var/obj/I = new/obj/Hud/SkinPick/Black3
			src.client.screen+= G
			src.client.screen+= H
			src.client.screen+= I
			var/obj/J = new/obj/Hud/SkinPick/White1
			var/obj/K = new/obj/Hud/SkinPick/White2
			var/obj/L = new/obj/Hud/SkinPick/White3
			src.client.screen+= J
			src.client.screen+= K
			src.client.screen+= L

			src.client.screen+= A
			src.client.screen+= B
			src.client.screen+= Txt5

		proc/FaceCreating()
			var/obj/Hud/Txt5 = new/obj/Hud/Interface/Text_
			Txt5.screen_loc="9:-8,9"
			Txt5.maptext_x = 24
			Txt5.maptext_y = 8
			Txt5.maptext="<font color=white><font family=Calibri> <b><font size=3>  Character Setup"
			var/obj/C = new/obj/Hud/FacePick
			src.client.screen+= C
			if(usr.PlayerIcon=='BaseWhite.dmi')
				var/obj/A = new/obj/Hud/SkinPick/WhitePl1
				A.screen_loc="10,8:-16"
				src.client.screen+= A

			else if(usr.PlayerIcon=='BaseBlack.dmi')
				var/obj/B = new/obj/Hud/SkinPick/BlackPl1
				B.screen_loc="10,8:-16"
				src.client.screen+= B
			src.client.screen+= Txt5
			winshow(src,"default.NameInput",1)
			winshow(src,"default.submitbutton",1)
		proc/ElementCreating()
			src.element="Fighter"
			var/overlayicon  =icon('CW.dmi',icon_state="40")

			var/obj/Hud/ElementPick/A = new/obj/Hud/ElementPick/Fighter
			var/obj/Hud/ElementPick/B = new/obj/Hud/ElementPick/Wizzard
			var/obj/Hud/ElementPick/C = new/obj/Hud/ElementPick/Tank

			A.overlays += A.elementoverlay
			A.underlays += overlayicon
			A.icon= src.PlayerIcon
			A.overlays += src.overlays
			A.screen_loc="9,6"
			A.maptext_x = 4
			A.maptext_y = -16
			A.maptext="<font color=white><font family=Calibri> <b><font size=2>Fighter"


			B.overlays += B.elementoverlay
			B.screen_loc="10:24,6"
			B.maptext_x = 4
			B.icon= src.PlayerIcon
			B.overlays += src.overlays
			B.maptext_y = -14
			B.maptext="<font color=white><font family=Calibri> <b><font size=2>Wizard"

			C.overlays += C.elementoverlay
			C.screen_loc="12,6"
			C.maptext_x = 4
			C.maptext_y = -14
			C.icon= src.PlayerIcon
			C.overlays += src.overlays
			C.maptext="<font color=white><font family=Calibri> <b><font size=2>Tank"


			src.client.screen+= A
			src.client.screen+= B
			src.client.screen+= C
obj/robot
	var/tmp/counter = 0
	var/tmp/ndir = EAST

	density=0
	layer=OBJ_LAYER
	step_size=5
	icon='StartingBoat.dmi'
	New()
		..()
		spawn do_program()

	proc/do_program()
		while(src)
			if(step(src, ndir))
				counter++
			if(src.loc==locate(55,140,2))
				src.loc=null
				break

			sleep(0.1)






mob
	var/Cname
	creating

		verb
			SubmitName()
				var/mob/creating/m = usr
				set hidden = 1
				Cname=winget(m, "default.nameinput", "text")
				if(!m.Cname)
					winset(m,"default.nameinput","background-color=red")
					return
				if(m.PlayerIcon)
					m.client.screen.Cut()
					winshow(m,"default.NameInput",0)
					winshow(m,"default.submitbutton",0)


					var/obj/g = new/obj/Hud/Youricon
					g.icon = m.PlayerIcon
					g.overlays += m.overlayslist

					g.dir= EAST
					m.client.screen+= g


					client.perspective = 255
					var/obj/l = new/obj/robot
					l.loc=locate(12,140,2)
					client.eye = l

					var/obj/Hud/L = new/obj/Hud/Interface/Text_
					src.client.screen+= L
					L.maptext_width=400
					L.maptext_height=400
					L.screen_loc="2:32,2:16"
					L.maptext="<b><center align=top><font color=red><font family=Calibri> <font size=3>WELCOME TO\n<font size=5>[world.name]<font size=3><font color=yellow>\n\n\n - Walk with arrows\n\n - Q  normal attack (punch)\n\n -Interact with 'X' button\n\n - You can always contact Admins for help!"

					spawn(100)


						if(m)
							m.client.screen.Cut()

							var/mob/player/new_mob

							new_mob  = new /mob/player()


							new_mob.name=m.Cname
							new_mob.PlayerIcon=m.PlayerIcon
							new_mob.overlayslist = m.overlayslist
							new_mob.overlays = new_mob.overlayslist
							new_mob.element = m.element
							new_mob.Slot = m.Slot
							new_mob.StartHud()
							new_mob.StartHotkeys()
							m.client.eye = new_mob
							new_mob.loc=locate(68,131,1)
							m.client.mob = new_mob
							del(m)
							return

