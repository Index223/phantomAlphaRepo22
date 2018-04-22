


turf
	background
		icon='Background.dmi'
	background2
		alpha=100
		icon='Background.dmi'
	CW
		layer=TURF_LAYER+1
		icon='CW.dmi'
		alpha = 230



obj

	Hud
		Youricon
			screen_loc="11:-8,8"
		ElementPick
			elementSword
				icon='Sword1.dmi'
				pixel_x = -24
				pixel_y = -24
			elementTank
				icon='Shield1.dmi'
				pixel_x = -24
				pixel_y = -24
			elementWizard
				icon='Staff1.dmi'
				pixel_x = -24
				pixel_y = -24
			var/elementoverlay
			icon='CW.dmi'
			icon_state="33"
			screen_loc="11:16,8"
			Fighter
				elementoverlay  = /obj/Hud/ElementPick/elementSword

			Tank
				elementoverlay  = /obj/Hud/ElementPick/elementTank

			Wizzard
				elementoverlay  = /obj/Hud/ElementPick/elementWizard

			MouseEntered()

				animate(src, transform = matrix()*1.2, time = 5)
			MouseExited()

				animate(src, transform = matrix()*1.0, time = 5)
			Click()
				for(var/obj/Hud/ElementPick/m in usr.client.screen)
					m.underlays.Cut()
				var/overlayicon  =icon('CW.dmi',icon_state="40")
				src.underlays+= 	overlayicon
				usr.element=src.name
			New()
				spawn()
					src.dir=NORTH


		FacePick
			icon='CW.dmi'
			icon_state="33"
			screen_loc="11:16,8:-16"
			MouseEntered()
				animate(src, transform = matrix()*1.2, time = 5)
			MouseExited()
				animate(src, transform = matrix()*1.0, time = 5)
			Click()
				if(usr.PlayerIcon=='BaseWhite.dmi')
					var/obj/Hud/SkinPick/WhitePl1/A = locate() in usr.client.screen

					if(A)

						if(A.icon_state=="34")
							A.icon_state="27"
							usr.overlayslist ='WhiteFace.dmi'
						else if(A.icon_state=="27")
							A.icon_state="28"
							usr.overlayslist = 'WhiteFace2.dmi'
						else if(A.icon_state=="28")
							A.icon_state="29"
							usr.overlayslist = 'WhiteFace3.dmi'
						else if(A.icon_state=="29")
							A.icon_state="34"
							usr.overlayslist  = null
				else if(usr.PlayerIcon=='BaseBlack.dmi')
					var/obj/Hud/SkinPick/BlackPl1/A = locate() in usr.client.screen
					if(A)

						if(A.icon_state=="35")
							usr.overlayslist  = 'BlackFace.dmi'
							A.icon_state="30"
						else if(A.icon_state=="30")
							usr.overlayslist  = 'BlackFace2.dmi'
							A.icon_state="31"
						else if(A.icon_state=="31")
							usr.overlayslist  = 'BlackFace3.dmi'
							A.icon_state="32"
						else if(A.icon_state=="32")
							A.icon_state="35"
							usr.overlayslist  = null
				for(var/obj/Hud/ElementPick/a in usr.client.screen)
					a.overlays.Cut()
					a.overlays += a.elementoverlay
					a.overlays  += usr.overlayslist

		SkinPick
			icon='CW.dmi'
			WhitePl1
				icon_state="34"
			WhitePl
				icon_state="19"
				screen_loc="9,8:-16"
				Click()
					var/mob/creating/m = usr
					m.PlayerIcon='BaseWhite.dmi'
					m.client.screen.Cut()
					m.FaceCreating()
					m.ElementCreating()


				MouseEntered()

					src.color+="#ff8080"
					animate(src, transform = matrix()*1.2, time = 2)



				MouseExited()

					src.color=null
					animate(src, transform = matrix()*1, time = 2)
			White1
				icon_state="21"
				screen_loc="10,8:-16"
			White2
				icon_state="22"
				screen_loc="11,8:-16"
			White3
				icon_state="23"
				screen_loc="12,8:-16"
			BlackPl1
				icon_state="35"
			BlackPl
				icon_state="20"
				screen_loc="9,6"
				Click()
					var/mob/creating/m = usr
					m.PlayerIcon='BaseBlack.dmi'
					m.client.screen.Cut()
					m.FaceCreating()
					m.ElementCreating()


				MouseEntered()

					src.color+="#ff8080"
					animate(src, transform = matrix()*1.2, time = 2)



				MouseExited()

					src.color=null
					animate(src, transform = matrix()*1, time = 2)
			Black1
				icon_state="24"
				screen_loc="10,6"
			Black2
				icon_state="25"
				screen_loc="11,6"
			Black3
				icon_state="26"
				screen_loc="12,6"


		Interface
			Text_
				maptext_y = 16
				pixel_x = 32
				maptext_width=400
				maptext_height=400
				screen_loc="5:32,1:16"
		Back
			icon='CW.dmi'
			icon_state="16"
			MouseEntered()
				animate(src, transform = matrix()*1.2, time = 2)
			MouseExited()
				animate(src, transform = matrix()*1.0, time = 2)
			Click()
				var/mob/creating/m = usr
				m.Slot=null
				m.client.screen.Cut()
				m.Create()
				m.PlayerIcon=null
				winshow(m,"default.NameInput",0)
				winshow(m,"default.submitbutton",0)
				m.loc=locate(1,1,2)
		CharacterInSlot
			icon='CW.dmi'
			icon_state="41"
		DelSlot
			icon='CW.dmi'
			icon_state="46"
			name=null
			Click()
				var/mob/creating/m = usr
				if(src.name)
					m.Slot=src.name
					m.client.screen.Cut()
					m.loc=locate(1,43,2)
					m.SkinCreating()


		Slots
			icon='CW.dmi'
			Click()
				var/mob/creating/m = usr

				m.Slot=src.name

				if(fexists("CharacterSavefiles/[copytext(m.ckey,1,2)]/[m.ckey]([m.Slot]).sav")) // if we have savefile
					var/savefile/F = new/savefile("CharacterSavefiles/[copytext(m.ckey,1,2)]/[m.ckey]([m.Slot]).sav")
					var/mob/player/p = null
					F >> p
					del m
				else
					m.client.screen.Cut()
					m.loc=locate(1,43,2)
					m.SkinCreating()
			s1l
				layer=OBJ_LAYER+1
				icon_state="14"
				screen_loc="9,8"
			s1r
				layer=OBJ_LAYER+1
				icon_state="15"
				screen_loc="12,8"
			S1
				icon_state="10"
				alpha = 230
				MouseEntered()
					var/obj/L = new/obj/Hud/Slots/s1l
					var/obj/R = new/obj/Hud/Slots/s1r
					usr.client.screen+= L
					usr.client.screen+= R
				MouseExited()

					var/obj/Hud/Slots/s1l/L = locate() in usr.client.screen
					if(L)
						usr.client.screen-= L
					var/obj/Hud/Slots/s1r/R = locate() in usr.client.screen
					if(R)
						usr.client.screen-= R

			s2l
				layer=OBJ_LAYER+1
				icon_state="14"
				screen_loc="9,7"
			s2r
				layer=OBJ_LAYER+1
				icon_state="15"
				screen_loc="12,7"
			S2
				icon_state="10"
				alpha = 230
				MouseEntered()


					var/obj/L = new/obj/Hud/Slots/s2l
					var/obj/R = new/obj/Hud/Slots/s2r
					usr.client.screen+= L
					usr.client.screen+= R
				MouseExited()
					var/obj/Hud/Slots/s2l/L = locate() in usr.client.screen
					if(L)
						usr.client.screen-= L
					var/obj/Hud/Slots/s2r/R = locate() in usr.client.screen
					if(R)
						usr.client.screen-= R
			s3l
				layer=OBJ_LAYER+1
				icon_state="14"
				screen_loc="9,6"
			s3r
				layer=OBJ_LAYER+1
				icon_state="15"
				screen_loc="12,6"
			S3
				icon_state="10"
				alpha = 230
				MouseEntered()


					var/obj/L = new/obj/Hud/Slots/s3l
					var/obj/R = new/obj/Hud/Slots/s3r
					usr.client.screen+= L
					usr.client.screen+= R
				MouseExited()
					var/obj/Hud/Slots/s3l/L = locate() in usr.client.screen
					if(L)
						usr.client.screen-= L
					var/obj/Hud/Slots/s3r/R = locate() in usr.client.screen
					if(R)
						usr.client.screen-= R
			s4l
				layer=OBJ_LAYER+1
				icon_state="14"
				screen_loc="9,5"
			s4r
				layer=OBJ_LAYER+1
				icon_state="15"
				screen_loc="12,5"
			S4
				icon_state="10"
				alpha = 230
				MouseEntered()


					var/obj/L = new/obj/Hud/Slots/s4l
					var/obj/R = new/obj/Hud/Slots/s4r
					usr.client.screen+= L
					usr.client.screen+= R
				MouseExited()
					var/obj/Hud/Slots/s4l/L = locate() in usr.client.screen
					if(L)
						usr.client.screen-= L
					var/obj/Hud/Slots/s4r/R = locate() in usr.client.screen
					if(R)
						usr.client.screen-= R
mob
	proc
		LoadLogin()
			var/obj/Hud/L = new/obj/Hud/Interface/Text_
			src.client.screen+= L
			L.maptext_width=400
			L.maptext_height=400
			L.maptext="<center align=top><font color=yellow><font family=Calibri> <font size=16>WELCOME TO\n<font size=3>[world.name]\n\n\n\n\n\n\n<font color=white>                                        Created by: Phat"
			animate(L, transform = matrix()*1, alpha = 0, time = 20)
