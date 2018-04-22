mob
	var/list/screenlist=list()
	var/list
		HotKeys=list("F1","F2","F3","F4","F5","F6","F7","F8","F9")

	verb/UseKey(key as text)
		set hidden=1
		if(HotKeys[key])
			var/obj/Skill/O=HotKeys[key]
			O.Initiate(src)


	proc/SetKey(key,object) HotKeys[key]=object
obj
	Hud
		HotKeys

			mouse_drop_zone=1
			icon='Hotkeys.dmi'
			New()
				icon_state=name

			Click()
				overlays=null
				usr.HotKeys[name]=null
			layer=10
			F1/screen_loc="13:16,2:16"
			F2/screen_loc="14:16,2:16"
			F3/screen_loc="15:16,2:16"
			F4/screen_loc="16:16,2:16"
			F5/screen_loc="17:16,2:16"
		/*	F1/screen_loc="13:-16,2:16"
			F2/screen_loc="13:18,2:16"
			F3/screen_loc="14:4,2:16"
			F4/screen_loc="15:-10,2:16"
			F5/screen_loc="15:24,2:16"
			F6/screen_loc="16:10,2:16"
			F7/screen_loc="17:-4,2:16"
			F8/screen_loc="17:30,2:16"*/

	Skill
		icon='TechTree.dmi'
		layer=OBJ_LAYER+1
		var/text_=""
		var/passive=0
		var/tmp/cooldown = 0
		var/initial_cooldown=0


		proc
			Initiate(mob/player/Owner)
			Upgrade()
			Display()
		MouseDrag()

			mouse_drag_pointer=icon(icon,icon_state)
		//	var/icon/I = new(src.icon,src.icon_state)
		//	mouse_drag_pointer = I

		MouseDrop(over_location)
			mouse_drag_pointer=null
			if(istype(over_location,/obj/Hud/HotKeys))
				if(icon_state=="locked" || passive)
					return
				var/obj/O=over_location
				O.overlays=list(icon(icon,icon_state))
				usr.SetKey(O.name,src)





		Click()
			if(src.icon_state=="locked")
				return


mob
	player
		proc
			StartHotkeys()
				src.screenobjects += new/obj/Hud/HotKeys/F1
				src.screenobjects += new/obj/Hud/HotKeys/F2
				src.screenobjects += new/obj/Hud/HotKeys/F3
				src.screenobjects += new/obj/Hud/HotKeys/F4
				src.screenobjects += new/obj/Hud/HotKeys/F5
			/*	src.screenobjects += new/obj/Hud/HotKeys/F6
				src.screenobjects += new/obj/Hud/HotKeys/F7
				src.screenobjects += new/obj/Hud/HotKeys/F8*/