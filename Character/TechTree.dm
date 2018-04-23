

mob
	player
		var/tmp/ttopen=0

	proc
		StartTech()
			src.client.screen += new/obj/TechTree/tc1
			src.client.screen += new/obj/TechTree/tc2
			src.client.screen += new/obj/TechTree/tc3
			src.client.screen += new/obj/TechTree/tc4
			src.client.screen += new/obj/TechTree/tc5
			src.client.screen += new/obj/TechTree/tc6
			src.client.screen += new/obj/TechTree/tc7
			src.client.screen += new/obj/TechTree/tc8
			src.client.screen += new/obj/TechTree/tc9
			src.client.screen += new/obj/TechTree/tc10
			src.client.screen += new/obj/TechTree/tc11
			src.client.screen += new/obj/TechTree/tc12
			src.client.screen += new/obj/TechTree/tc13
			src.client.screen += new/obj/TechTree/tc14
			src.client.screen += new/obj/TechTree/tc15
			src.client.screen += new/obj/TechTree/tc16
			src.client.screen += new/obj/TechTree/tc17
			src.client.screen += new/obj/TechTree/tc18
			src.client.screen += new/obj/TechTree/tc19
			src.client.screen += new/obj/TechTree/tc20
			src.client.screen += new/obj/TechTree/tc21
			src.client.screen += new/obj/TechTree/tc22
			src.client.screen += new/obj/TechTree/tc23
			src.client.screen += new/obj/TechTree/tc24
			src.client.screen += new/obj/TechTree/tc25
			src.client.screen += new/obj/TechTree/tc26
			src.client.screen += new/obj/TechTree/tc27
			src.client.screen += new/obj/TechTree/tc28
			src.client.screen += new/obj/TechTree/tc29
			src.client.screen += new/obj/TechTree/tc30
			src.client.screen += new/obj/TechTree/tc31
			src.client.screen += new/obj/TechTree/tc32
			src.client.screen += new/obj/TechTree/tc33
			src.client.screen += new/obj/TechTree/tc34
			src.client.screen += new/obj/TechTree/tc35
			src.client.screen += new/obj/TechTree/tc36
			src.client.screen += new/obj/TechTree/tc37
			src.client.screen += new/obj/TechTree/tc38
			src.client.screen += new/obj/TechTree/tc39
			src.client.screen += new/obj/TechTree/tc40
			src.client.screen += new/obj/TechTree/tc41
			src.client.screen += new/obj/TechTree/tc42
			src.client.screen += new/obj/TechTree/tc43
			src.client.screen += new/obj/TechTree/tc44
			src.client.screen += new/obj/TechTree/tc45
			src.client.screen += new/obj/TechTree/tc46
			src.client.screen += new/obj/TechTree/tc47
			src.client.screen += new/obj/TechTree/tc48
			src.client.screen += new/obj/TechTree/tc49
			src.client.screen += new/obj/TechTree/tc50
			src.client.screen += new/obj/TechTree/tc51
			src.client.screen += new/obj/TechTree/tc52
			src.client.screen += new/obj/TechTree/tc53
			src.client.screen += new/obj/TechTree/tc54
			src.client.screen += new/obj/TechTree/tc55
			src.client.screen += new/obj/TechTree/tc56
			src.client.screen += new/obj/TechTree/tc57
			src.client.screen += new/obj/TechTree/tc58
			src.client.screen += new/obj/TechTree/tc59
			src.client.screen += new/obj/TechTree/tc60
			src.client.screen += new/obj/TechTree/tc61
			src.client.screen += new/obj/TechTree/tc62
			src.client.screen += new/obj/TechTree/tc63
			src.client.screen += new/obj/TechTree/tc64
			src.client.screen += new/obj/TechTree/tc65
			src.client.screen += new/obj/TechTree/tc66
			src.client.screen += new/obj/TechTree/tc67
			src.client.screen += new/obj/TechTree/tc68
			src.client.screen += new/obj/TechTree/tc69
			src.client.screen += new/obj/TechTree/tc70
			src.client.screen += new/obj/TechTree/tc71
			src.client.screen += new/obj/TechTree/tc72
			src.client.screen += new/obj/TechTree/tc73
			src.client.screen += new/obj/TechTree/tc74
			src.client.screen += new/obj/TechTree/tc75
			src.client.screen += new/obj/TechTree/tc76
			src.client.screen += new/obj/TechTree/tc77
			src.client.screen += new/obj/TechTree/tc78
			src.client.screen += new/obj/TechTree/tc79
			src.client.screen += new/obj/TechTree/tc80
			src.client.screen += new/obj/TechTree/tc81
			src.client.screen += new/obj/TechTree/tc82
			src.client.screen += new/obj/TechTree/tc83
			src.client.screen += new/obj/TechTree/tc84
			src.client.screen += new/obj/TechTree/tc85
			src.client.screen += new/obj/TechTree/tc86
			src.client.screen += new/obj/TechTree/tc87
			src.client.screen += new/obj/TechTree/tc88
			src.client.screen += new/obj/TechTree/tc89
			src.client.screen += new/obj/TechTree/tc90
			src.client.screen += new/obj/TechTree/tc91
			src.client.screen += new/obj/TechTree/tc92
			src.client.screen += new/obj/TechTree/text0(src)
			src.client.screen += new/obj/TechTree/text1
			src.client.screen += new/obj/TechTree/text2
			src.client.screen += new/obj/TechTree/text1str(src)
			src.client.screen += new/obj/TechTree/addstr
			src.client.screen += new/obj/TechTree/text1mag(src)
			src.client.screen += new/obj/TechTree/addmag
			src.client.screen += new/obj/TechTree/text1def(src)
			src.client.screen += new/obj/TechTree/adddef
			src.client.screen += new/obj/TechTree/text1critical
			src.client.screen += new/obj/TechTree/addcritical
			src.client.screen += new/obj/TechTree/text1dodge
			src.client.screen += new/obj/TechTree/adddodge
			src.client.screen += new/obj/TechTree/CharacterSheet
			src.client.screen += new/obj/TechTree/CS/HelmetSlot
			src.client.screen += new/obj/TechTree/CS/GlovesSlot
			src.client.screen += new/obj/TechTree/CS/RingSlot
			src.client.screen += new/obj/TechTree/CS/ArmorSlot
			src.client.screen += new/obj/TechTree/CS/LegsSlot
			src.client.screen += new/obj/TechTree/CS/NecklaceSlot
			src.client.screen += new/obj/TechTree/CS/WeponSlot
			var/obj/TechTree/text1str/a = locate() in src.client.screen
			if(a)
				a.maptext="<b><font family=Calibri>Str: [src.stats["strength"].value()]<font color=#c266ff> (+[src.stats["bonusstr"].value()])"
			var/obj/TechTree/text1mag/b = locate() in src.client.screen
			if(b)
				b.maptext="<b><font family=Calibri>Mag: [src.stats["magic"].value()]<font color=#c266ff> (+[src.stats["bonusmag"].value()])"
			var/obj/TechTree/text1def/c = locate() in src.client.screen
			if(c)
				c.maptext="<b><font family=Calibri>Def: [src.stats["defence"].value()]<font color=#c266ff> (+[src.stats["defence"].value()])"
			var/obj/TechTree/text0/d = locate() in src.client.screen
			if(d)
				d.maptext="<font family=Comic Sans MS><font color=white><b>Name:</b> [src.name] <b>LvL:</b> [src.stats["level"].value()]"
		CloseTech()
			for(var/obj/TechTree/a in src.client.screen)
				src.client.screen-=a
				a.loc=null
			for(var/obj/Skill/b in src.client.screen)
				src.client.screen-=b
				b.loc=null
obj
	TechTree
		var/mob/owner

		New(mob/m)
			..()
			owner = m
		icon='NewTechTree.dmi'
		tc1
			icon_state ="1"
			screen_loc="8,5"
		tc2
			icon_state ="2"
			screen_loc="9,5"
		tc3
			icon_state ="3"
			screen_loc="10,5 to 14,5"
		tc4
			icon_state ="8"
			screen_loc="15,5"
		tc5
			icon_state ="9"
			screen_loc="3,6"
		tc6
			icon_state ="10"
			screen_loc="4,6 to 7,6"
		tc7
			icon_state ="14"
			screen_loc="8,6"
		tc8
			icon_state ="15"
			screen_loc="9,6"
		tc9
			icon_state ="16"
			screen_loc="10,6"
		tc10
			icon_state ="17"
			screen_loc="11,6"
		tc11
			icon_state ="18"
			screen_loc="12,6"
		tc12
			icon_state ="19"
			screen_loc="13,6"
		tc13
			icon_state ="20"
			screen_loc="14,6"
		tc14
			icon_state ="21"
			screen_loc="15,6"
		tc15
			icon_state ="22"
			screen_loc="3,7"
		tc16
			icon_state ="23"
			screen_loc="4,7"
		tc17
			icon_state ="24"
			screen_loc="5,7"
		tc18
			icon_state ="25"
			screen_loc="6,7"
		tc19
			icon_state ="26"
			screen_loc="7,7"
		tc20
			icon_state ="27"
			screen_loc="8,7"
		tc21
			icon_state ="28"
			screen_loc="9,7"
		tc22
			icon_state ="29"
			screen_loc="10,7"
		tc23
			icon_state ="30"
			screen_loc="11,7"
		tc24
			icon_state ="31"
			screen_loc="12,7"
		tc25
			icon_state ="32"
			screen_loc="13,7"
		tc26
			icon_state ="33"
			screen_loc="14,7"
		tc27
			icon_state ="34"
			screen_loc="15,7"
		tc28
			icon_state ="35"
			screen_loc="3,8"
		tc29
			icon_state ="36"
			screen_loc="4,8"
		tc30
			icon_state ="37"
			screen_loc="5,8"
		tc31
			icon_state ="38"
			screen_loc="6,8"
		tc32
			icon_state ="39"
			screen_loc="7,8"
		tc33
			icon_state ="40"
			screen_loc="8,8"
		tc34
			icon_state ="41"
			screen_loc="9,8"
		tc35
			icon_state ="42"
			screen_loc="10,8"
		tc36
			icon_state ="43"
			screen_loc="11,8"
		tc37
			icon_state ="44"
			screen_loc="12,8"
		tc38
			icon_state ="45"
			screen_loc="13,8"
		tc39
			icon_state ="46"
			screen_loc="14,8"
		tc40
			icon_state ="47"
			screen_loc="15,8"
		tc41
			icon_state ="48"
			screen_loc="3,9"
		tc42
			icon_state ="49"
			screen_loc="4,9"
		tc43
			icon_state ="50"
			screen_loc="5,9"
		tc44
			icon_state ="51"
			screen_loc="6,9"
		tc45
			icon_state ="52"
			screen_loc="7,9"
		tc46
			icon_state ="53"
			screen_loc="8,9"
		tc47
			icon_state ="54"
			screen_loc="9,9"
		tc48
			icon_state ="55"
			screen_loc="10,9"
		tc49
			icon_state ="56"
			screen_loc="11,9"
		tc50
			icon_state ="57"
			screen_loc="12,9"
		tc51
			icon_state ="58"
			screen_loc="13,9"
		tc52
			icon_state ="59"
			screen_loc="14,9"
		tc53
			icon_state ="60"
			screen_loc="15,9"
		tc54
			icon_state ="61"
			screen_loc="3,10"
		tc55
			icon_state ="62"
			screen_loc="4,10"
		tc56
			icon_state ="63"
			screen_loc="5,10"
		tc57
			icon_state ="64"
			screen_loc="6,10"
		tc58
			icon_state ="65"
			screen_loc="7,10"
		tc59
			icon_state ="66"
			screen_loc="8,10"
		tc60
			icon_state ="67"
			screen_loc="9,10"
		tc61
			icon_state ="68"
			screen_loc="10,10"
		tc62
			icon_state ="69"
			screen_loc="11,10"
		tc63
			icon_state ="70"
			screen_loc="12,10"
		tc64
			icon_state ="71"
			screen_loc="13,10"
		tc65
			icon_state ="72"
			screen_loc="14,10"
		tc66
			icon_state ="73"
			screen_loc="15,10"
		tc67
			icon_state ="74"
			screen_loc="3,11"
		tc68
			icon_state ="75"
			screen_loc="4,11"
		tc69
			icon_state ="76"
			screen_loc="5,11"
		tc70
			icon_state ="77"
			screen_loc="6,11"
		tc71
			icon_state ="78"
			screen_loc="7,11"
		tc72
			icon_state ="79"
			screen_loc="8,11"
		tc73
			icon_state ="80"
			screen_loc="9,11"
		tc74
			icon_state ="81"
			screen_loc="10,11"
		tc75
			icon_state ="82"
			screen_loc="11,11"
		tc76
			icon_state ="83"
			screen_loc="12,11"
		tc77
			icon_state ="84"
			screen_loc="13,11"
		tc78
			icon_state ="85"
			screen_loc="14,11"
		tc79
			icon_state ="86"
			screen_loc="15,11"

		tc80
			icon_state ="87"
			screen_loc="3,12"
		tc81
			icon_state ="88"
			screen_loc="4,12"
		tc82
			icon_state ="89"
			screen_loc="5,12"
		tc83
			icon_state ="90"
			screen_loc="6,12"
		tc84
			icon_state ="91"
			screen_loc="7,12"
		tc85
			icon_state ="92"
			screen_loc="8,12"
		tc86
			icon_state ="93"
			screen_loc="9,12"
		tc87
			icon_state ="94"
			screen_loc="10,12"
		tc88
			icon_state ="95"
			screen_loc="11,12"
		tc89
			icon_state ="96"
			screen_loc="12,12"
		tc90
			icon_state ="97"
			screen_loc="13,12"
		tc91
			icon_state ="98"
			screen_loc="14,12"
		tc92
			icon_state ="99"
			screen_loc="15,12"

		text0
			icon=null
			screen_loc="11,12"
			layer=OBJ_LAYER+1
			maptext_width=256
			maptext_height=256
			maptext_y = 16
			maptext_x = 8



		text1
			icon=null
			icon_state ="text1"
			screen_loc="6:-16,10:16"
			maptext_width=256
			maptext_height=256
			maptext_y = 16
			maptext_x = -64
			New()


				maptext="<b><font family=Calibri>Points left:"
		text2
			icon=null
			icon_state ="text2"
			screen_loc="7,10:16"
			layer=OBJ_LAYER+1
			maptext_width=256
			maptext_height=256
			maptext_y = 16
			maptext_x = -20
			New()

				maptext="<b><font family=Calibri>[usr.battlepoints]"

		text1str
			screen_loc="5,10:3"
			icon=null
			layer=OBJ_LAYER+1
			maptext_width=256
			maptext_height=256
			maptext_y = -6
			maptext_x = -16





		addstr
			icon_state ="add"
			screen_loc="7:13,10:-5"
			MouseEntered()
				animate(src, transform = matrix()*1.05, time = 1)
			MouseExited()
				animate(src, transform = matrix()*1.0, time = 1)
			New()
				if(usr.battlepoints < 1)
					src.icon_state="Add-Locked"
				else
					src.icon_state ="add"

			Click()
				set src in usr
				if(usr.battlepoints > 0)
					usr.battlepoints --

					usr.stats["strength"].gain_xp((usr.stats["strength"].xp_next -usr.stats["strength"].xp)) // What did this originally dop ?


					var/obj/TechTree/text1str/m = locate() in usr.client.screen
					if(m)
						m.maptext="<b><font family=Calibri>Str: [usr.stats["strength"].value()]<font color=#c266ff> (+[usr.stats["bonusstr"].value()])"

					var/obj/TechTree/text2/A = locate() in usr.client.screen
					if(A)
						A.maptext="<b><font family=Calibri>[usr.battlepoints]"

					var/obj/CharacterHud/h14/h= locate() in usr.client.screen
					if(h)
						h.maptext="<b>[usr.stats["strength"].value()]"
					if(usr.battlepoints ==0)
						src.icon_state="Add-Locked"

						var/obj/TechTree/addmag/a = locate() in usr.client.screen
						if(a)
							a.icon_state="Add-Locked"

						var/obj/TechTree/adddef/b = locate() in usr.client.screen
						if(b)
							b.icon_state="Add-Locked"
				else

					src.icon_state="Add-Locked"

					var/obj/TechTree/addmag/a = locate() in usr.client.screen
					if(a)
						a.icon_state="Add-Locked"

					var/obj/TechTree/adddef/b = locate() in usr.client.screen
					if(b)
						b.icon_state="Add-Locked"





		text1mag
			screen_loc="5,9:3"
			icon=null
			layer=OBJ_LAYER+1
			maptext_width=256
			maptext_height=256
			maptext_y = 12
			maptext_x = -16
			New()
				if(owner)

					maptext="<b><font family=Calibri>Magic: [owner.stats["magic"].value()]<font color=#c266ff> (+[owner.stats["bonusmag"].value()])"
		addmag
			icon_state ="add"
			screen_loc="7:13,9:16"
			MouseEntered()
				animate(src, transform = matrix()*1.05, time = 1)
			MouseExited()
				animate(src, transform = matrix()*1.0, time = 1)
			New()
				if(usr.battlepoints < 1)
					src.icon_state="Add-Locked"
				else
					src.icon_state ="add"

			Click()
				set src in usr
				if(usr.battlepoints > 0)
					usr.battlepoints --
					usr.stats["magic"].gain_xp(usr.stats["magic"].xp_next - usr.stats["magic"].xp) // What did this originally dop ?
					// you lose battle point and gain str point ooh
					// In this instance, do you want it to directly affect it's value, or just give strength experience? ye directly

					var/obj/TechTree/text1mag/m = locate() in usr.client.screen
					if(m)
						m.maptext="<b><font family=Calibri>Mag: [usr.stats["magic"].value()]<font color=#c266ff> (+[usr.stats["bonusmag"].value()])"

					var/obj/TechTree/text2/A = locate() in usr.client.screen
					if(A)
						A.maptext="<b><font family=Calibri>[usr.battlepoints]"

					var/obj/CharacterHud/h15/h= locate() in usr.client.screen
					if(h)
						h.maptext="<b>[usr.stats["magic"].value()]"
					if(usr.battlepoints ==0)
						src.icon_state="Add-Locked"

						var/obj/TechTree/addmag/a = locate() in usr.client.screen
						if(a)
							a.icon_state="Add-Locked"

						var/obj/TechTree/adddef/b = locate() in usr.client.screen
						if(b)
							b.icon_state="Add-Locked"
				else

					src.icon_state="Add-Locked"

					var/obj/TechTree/addmag/a = locate() in usr.client.screen
					if(a)
						a.icon_state="Add-Locked"

					var/obj/TechTree/adddef/b = locate() in usr.client.screen
					if(b)
						b.icon_state="Add-Locked"
					src.icon_state="Add-Locked"


		text1def
			screen_loc="5,8:24"
			icon=null
			layer=OBJ_LAYER+1
			maptext_width=256
			maptext_height=256
			maptext_y = 16
			maptext_x = -16
			New()
				if(owner)

					maptext="<b><font family=Calibri>Def: [owner.stats["defence"].value()]<font color=#c266ff> (+[owner.stats["bonusdef"].value()])"
		adddef
			icon_state ="add"
			screen_loc="7:13,9:-10"
			MouseEntered()
				animate(src, transform = matrix()*1.05, time = 1)
			MouseExited()
				animate(src, transform = matrix()*1.0, time = 1)
			New()
				if(usr.battlepoints < 1)
					src.icon_state="Add-Locked"
				else
					src.icon_state ="add"

			Click()
				set src in usr
				if(usr.battlepoints > 0)
					usr.battlepoints --
					usr.stats["defence"].gain_xp(usr.stats["defence"].xp_next - usr.stats["defence"].xp)

					var/obj/TechTree/text1def/m = locate() in usr.client.screen
					if(m)
						m.maptext="<b><font family=Calibri>Def: [usr.stats["defence"].value()]<font color=#c266ff> (+[usr.stats["bonusdef"].value()])"
					var/obj/TechTree/text2/A = locate() in usr.client.screen
					if(A)
						A.maptext="<b><font family=Calibri>[usr.battlepoints]"
					var/obj/CharacterHud/h16/h= locate() in usr.client.screen
					if(h)
						h.maptext="<b>[usr.stats["defence"].value()]"
					if(usr.battlepoints ==0)
						src.icon_state="Add-Locked"

						var/obj/TechTree/addmag/a = locate() in usr.client.screen
						if(a)
							a.icon_state="Add-Locked"

						var/obj/TechTree/adddef/b = locate() in usr.client.screen
						if(b)
							b.icon_state="Add-Locked"
				else
					src.icon_state="Add-Locked"
					var/obj/TechTree/addmag/a = locate() in usr.client.screen
					if(a)
						a.icon_state="Add-Locked"
					var/obj/TechTree/addstr/b = locate() in usr.client.screen
					if(b)
						b.icon_state="Add-Locked"
		text1critical
			screen_loc="5,8:-3"
			icon=null
			layer=OBJ_LAYER+1
			maptext_width=256
			maptext_height=256
			maptext_y = 16
			maptext_x = -16
			New()

				maptext="<b><font family=Calibri>Critical: [usr.critical] %"


		addcritical
			icon_state ="add"
			screen_loc="7:13,8:11"
			MouseEntered()
				animate(src, transform = matrix()*1.05, time = 1)
			MouseExited()
				animate(src, transform = matrix()*1.0, time = 1)
			New()
				if(usr.battlepoints < 9)
					src.icon_state="Add-Locked"
				else
					src.icon_state ="add"

			Click()
				set src in usr
				if(usr.battlepoints > 0)
					usr.battlepoints --
					usr.critical ++

					var/obj/TechTree/text1def/m = locate() in usr.client.screen
					if(m)
						m.maptext="<b><font family=Calibri>[usr.critical] %"
					var/obj/TechTree/text2/A = locate() in usr.client.screen
					if(A)
						A.maptext="<b><font family=Calibri>[usr.battlepoints]"
				else
					src.icon_state="Add-Locked"
					var/obj/TechTree/addmag/a = locate() in usr.client.screen
					if(a)
						a.icon_state="Add-Locked"
					var/obj/TechTree/addstr/b = locate() in usr.client.screen
					if(b)
						b.icon_state="Add-Locked"

		text1dodge
			screen_loc="5,7:16"
			icon=null
			layer=OBJ_LAYER+1
			maptext_width=256
			maptext_height=256
			maptext_y = 16
			maptext_x = -16
			New()

				maptext="<b><font family=Calibri>Dodge: [usr.dodge] %"


		adddodge
			layer=OBJ_LAYER+1
			icon_state ="add"
			screen_loc="7:13,7:32"
			MouseEntered()
				animate(src, transform = matrix()*1.05, time = 1)
			MouseExited()
				animate(src, transform = matrix()*1.0, time = 1)
			New()
				if(usr.battlepoints < 9)
					src.icon_state="Add-Locked"
				else
					src.icon_state ="add"

			Click()
				set src in usr
				if(usr.battlepoints > 0)
					usr.battlepoints --
					usr.dodge ++

					var/obj/TechTree/text1def/m = locate() in usr.client.screen
					if(m)
						m.maptext="<b><font family=Calibri>[usr.dodge] %"
					var/obj/TechTree/text2/A = locate() in usr.client.screen
					if(A)
						A.maptext="<b><font family=Calibri>[usr.battlepoints]"
				else
					src.icon_state="Add-Locked"
					var/obj/TechTree/addmag/a = locate() in usr.client.screen
					if(a)
						a.icon_state="Add-Locked"
					var/obj/TechTree/addstr/b = locate() in usr.client.screen
					if(b)
						b.icon_state="Add-Locked"
		CharacterSheet
			icon=null
			screen_loc="5:-6,11"
			layer=OBJ_LAYER+1
			New()
				if(usr)
					maptext_width=256
					maptext_height=256
					maptext_y = 16
					maptext_x = 8
					maptext="<font family=Comic Sans MS><font color=white><b> Character stats"
		CharacterSheet
			icon=null
			screen_loc="5:-6,11"
			layer=OBJ_LAYER+1
			New()
				if(usr)
					maptext_width=256
					maptext_height=256
					maptext_y = 16
					maptext_x = 8
					maptext="<font family=Comic Sans MS><font color=white><b> Character stats"
		CS
			HelmetSlot
				layer=OBJ_LAYER+1
				icon='Items.dmi'
				icon_state="Helmet"
				screen_loc="10,10:24"
			GlovesSlot
				layer=OBJ_LAYER+1
				icon='Items.dmi'
				icon_state="Gloves"
				screen_loc="10,8:24"
			RingSlot
				layer=OBJ_LAYER+1
				icon='Items.dmi'
				icon_state="Ring"
				screen_loc="10,6:24"
			ArmorSlot
				layer=OBJ_LAYER+1
				icon='Items.dmi'
				icon_state="Armor"
				screen_loc="14,10:24"
			LegsSlot
				layer=OBJ_LAYER+1
				icon='Items.dmi'
				icon_state="Boots"
				screen_loc="14,8:24"
			NecklaceSlot
				layer=OBJ_LAYER+1
				icon='Items.dmi'
				icon_state="Necklace"
				screen_loc="14,6:24"
			WeponSlot
				layer=OBJ_LAYER+1
				icon='Items.dmi'
				icon_state="Level00"
				screen_loc="12,6:-16"
			MouseEntered()
				animate(src, transform = matrix()*1.1, time = 1)
			MouseExited()
				animate(src, transform = matrix()*1.0, time = 1)



