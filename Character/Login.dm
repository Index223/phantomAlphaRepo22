mob
	creating

		Move()
		Login()
			spawn()


				loc=locate(1,30,2)
				LoadLogin()

				spawn(10)
					if(src)
						src.client.screen.Cut()
						loc=locate(1,1,2)
						Create()

			return 1
		Logout()
			del(src)
			..()

	player
		bounds  = "16,1 to 32,46"

		Login()
			src.client.screen = null
			src.client.screen = src.screenobjects

			src.overlays.Cut()
			src.overlays += src.overlayslist

			src.client.screen += new/obj/cpu_display()

			src.density=1
			src.layer = MOB_LAYER
			src.icon_state=""
			src.icon=PlayerIcon
			winshow(src,"default.afk",1)
			winshow(src,"default.stats",1)
			winshow(src,"default.Chatt",1)
			winshow(src,"default.Input",1)
			winshow(src,"default.WHO",1)
			winshow(src,"default.PM",1)
			winshow(src,"default.Report",1)
			winshow(src,"Drop",1)
			src.WidthTotal()
			src.GetWidth()
			src.Check()
			src.UpdateHud()
			client.chatbox_build(/*Phat T*/) // build the chatbox
			client.chatlog = "outputwindow.output" // set chatlog
			client.chatlog_record("\b\[ This is your chatlog ]") // enter a text into your chatlog
			_message(src,"<center><font color=red><font size =4><b><l>           The Phantom of \n                 the future")
			_message(src,"<center><font color=yellow><font size =3>If you encounter any bugs,\n use the report button!\n")
			_message(world, "<font color=#33ccff><b>World Info: </b> <font color=#00cccc>[admin ? "[src.admin_tag]" : ""] <font color=green>[src]<font color=#00cccc> {[src.key]} <font color=white> <font color=white> has <font color=green>joined<font color=white> the game<font color=red>", "yellow") // notify world


			return ..()

		Logout()
			..()
			src.icon = null
			src.icon_state=null
			_message(world,"<font color=#33ccff><b>World Info: </b><font color=#00cccc>[admin ? "[src.admin_tag]" : ""]<font color=green>[src] <font color=white> has <font color=red>left<font color=white> the game <font color=red>")
			del(src)
		Del()
			src.save()
			return ..()
		proc
			save()
				var/savefile/F = new/savefile("CharacterSavefiles/[copytext(src.ckey,1,2)]/[src.ckey]([src.Slot]).sav")
				F << src
