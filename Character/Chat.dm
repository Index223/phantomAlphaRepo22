
proc
	_ftext(text="",color,face)
		if(color||face)
			text="<font[color ? " color='[color]'" : ][face ? " face='[face]'" : ]>[text]</font>"
		return text

	_message(recipient,msg,color,face)
		if(!recipient)
			return // early escape
		if(istype(recipient,/mob))
			if(!recipient:client) // no client
				return // early escape
			_message(recipient:client,msg,color,face)
			return
		if(istype(recipient,/client))
			var/client/client = recipient
			if(!client._chatbox) // no chatbox
				return // early escape
			var/chatbox_msg/chatbox_msg = msg
			if(!istype(msg,/chatbox_msg))
				chatbox_msg = new/chatbox_msg(msg,color,face)
			client._chatbox._enter(chatbox_msg)
			client.chatlog_record(chatbox_msg.text)
			return
		if(istype(recipient,/list))
			if(!length(recipient)) // empty list
				return // early escape
			if(!istype(msg,/chatbox_msg))
				msg = new/chatbox_msg(msg,color,face)
			for(var/mob/mob in recipient)
				if(mob.client)
					_message(mob.client,msg)
			for(var/client/client in recipient)
				_message(client,msg)
			return
		if(istype(recipient,world))
			if(!istype(msg,/chatbox_msg))
				msg = new/chatbox_msg(msg,color,face)
			for(var/client/client)
				_message(client,msg)
			return

_defaults/chatbox
	parent_type = /atom/movable
	icon = null
	screen_loc = "1:16,1:16"
	maptext_height = 128
	maptext_width = 256
	layer = FLY_LAYER+10
	mouse_opacity = 0

	var
		maxlines = 10
		chatlines = 12

		font_family
		font_color
		font_size

		text_shadow

chatbox
	parent_type = /_defaults/chatbox

	var
	// dont touch
		chatbox_msgs/_msgs
		_pageup = 0
		_updates = 0
		_active = 0

	proc
		_clear(/*Phat T*/)
			_msgs.Clear(/*Phat T*/)
			_pageup = 0
			_update(/*Phat T*/)

		_pagestart(/*Phat T*/)
			_pageup = _msgs&&(_msgs.len-1)
			_update(/*Phat T*/)

		_pageup(/*Phat T*/)
			_pageup = min(_pageup+1,_msgs&&(_msgs.len-1))
			_update(/*Phat T*/)

		_pagedown(/*Phat T*/)
			_pageup = max(_pageup-1,0)
			_update(/*Phat T*/)

		_pageend(/*Phat T*/)
			_pageup = 0
			_update(/*Phat T*/)

		_update(/*Phat T*/)
			if(_active)
				_updates++
				return
			_active = 1
			spawn(-1)
				_updates=0
				do
					var/tag = "chatmsg[rand(1000)]"
					var/text = _getlog(tag)
					var/default = "<style>body {font-family: '[font_family]'; font-size: [font_size||"2"]; color: [font_color||"black"];}</style>"
					maptext = default + "<style>[tag] {color: inherit;}</style>" + text
					_shadow.maptext = text_shadow ? default + "<style>[tag] {color: [text_shadow] ! important;}</style>" + text : null
					sleep(world.tick_lag)
				while(_got_updates(/*Phat T*/))
				_active = 0

		_enter(chatbox_msg/msg)
			if(!msg)
				return
			if(!_msgs)
				_msgs = new(maxlines)
			_msgs.Add(msg)
			_update(/*Phat T*/)

		_getlog(tag)
			if(!_msgs || !_msgs.len)
				return null
			var/fulltext
			var/lines = 0
			for(var/i = _msgs.len - _pageup , i>0 && lines<chatlines , i--)
				var/chatbox_msg/msg = _msgs.Get(i)
				fulltext = "\n<[tag]>[msg.text]</[tag]>[fulltext]"
				lines++
			return fulltext

		_got_updates(/*Phat T*/)
			.=_updates
			_updates=0

	var/chatbox/shadow/_shadow

	New(/*Phat T*/)
		_shadow = new

	shadow
		mouse_opacity = 0

		New(/*Phat T*/)
			var/global
				original_screen_loc
				new_screen_loc

			if(original_screen_loc!=screen_loc)
				var
					separator = findtext(screen_loc,",")
					screen_x = copytext(screen_loc,1,separator)
					screen_y = copytext(screen_loc,separator+1)
					map
					screen_px
					screen_py
					i

				i = findtext(screen_x,":")
				if(i)
					map = copytext(screen_x,1,i)
					if(findtext(screen_x,":",i+1))
						screen_x = copytext(screen_x,i+1)
					else
						switch(uppertext(map))
							if("NORTH","SOUTH","EAST","WEST","CENTER")
								map = null
							else
								if( !_number(map) )
									screen_x = copytext(screen_x,i+1)
								else
									map = null

				i = findtext(screen_x,":")
				screen_px = ( i && text2num(copytext(screen_x,i+1,0)) ) + 1
				screen_x = copytext(screen_x,1,i)

				i = findtext(screen_y,":")
				screen_py = ( i && text2num(copytext(screen_y,i+1,0)) ) - 1
				screen_y = copytext(screen_y,1,i)

				original_screen_loc = screen_loc
				new_screen_loc = "[map?"[map]:" :][screen_x]:[screen_px],[screen_y]:[screen_py]"

			screen_loc = new_screen_loc


		proc
			_number(text)
				for(var/i in 1 to lentext(text))
					switch(text2ascii(text,i))
						if(48 to 57)
						else
							return FALSE
				return TRUE

_defaults/chatbox_gui
	parent_type = /atom/movable
	icon = null
	layer = FLY_LAYER +9


chatbox_gui
	parent_type = /_defaults/chatbox_gui

	Click(/*Phat T*/)
		..(/*Phat T*/)
		if(istype(usr,/mob))
			_onclick(usr:client)

	proc
		_onclick(client/client)

	background

	start
		_onclick(client/client)
			if(client&&client._chatbox)
				client._chatbox._pagestart(/*Phat T*/)

	up
		_onclick(client/client)
			if(client&&client._chatbox)
				client._chatbox._pageup(/*Phat T*/)

	down
		_onclick(client/client)
			if(client&&client._chatbox)
				client._chatbox._pagedown(/*Phat T*/)

	end
		_onclick(client/client)
			if(client&&client._chatbox)
				client._chatbox._pageend(/*Phat T*/)


chatbox_msg
	var
		text

	New(text="",color,face)
		src.text = _format(text,color,face)

	proc
		_format(text="",color,face)
			return "<font[color ? " color='[color]'" : ][face ? " face='[face]'" : ]>[_parse(text)]</font>"

		_parse(text)
			text = "[text]"||" "
			if(lentext(text)>1 && copytext(text,-2)=="\c")
				text = copytext(text,1,-2)
			return text

chatbox_msgs
	var
		len = 0
		start = 0
		list/list

	New(x)
		list = new( isnum(x) && x )

	proc
		Add(chatbox_msg/msg)
			if(list.len)
				var/pos = pos(start+len+1)
				list[pos] = msg
				if(len < list.len)
					len++
				else
					start = pos(start+1)

		Get(pos)
			return list[ pos(start+pos) ]

		Clear(/*Phat T*/)
			for(var/i in 1 to list.len)
				list[i] = null
			len = 0

		pos(pos)
			return pos%list.len || list.len

client
	var/tmp/chatlog

	// don't touch
	var/tmp/chatbox/_chatbox

	proc
		chatbox_build(/*Phat T*/)
			chatbox_remove(/*Phat T*/)
			_chatbox = new
			screen += _chatbox._shadow
			screen += _chatbox
			for(var/gui in typesof(/chatbox_gui))
				switch(gui)
					if(/chatbox_gui)
					else
						screen += new gui

		chatbox_remove(/*Phat T*/)
			if(_chatbox)
				if(_chatbox._shadow)
					del _chatbox._shadow
				del _chatbox
			for(var/chatbox_gui/extra in screen)
				del extra

		chatbox_clear(/*Phat T*/)
			if(_chatbox)
				_chatbox._clear(/*Phat T*/)

		chatbox_show(setting=TRUE)
			if(_chatbox)
				_chatbox.invisibility = setting ? 0 : 101
				if(_chatbox._shadow)
					_chatbox._shadow.invisibility = setting ? 0 : 101
			for(var/chatbox_gui/extra in screen)
				extra.invisibility = setting ? 0 : 101

		chatlog_record(str)
			if(chatlog)
				src << output("[str]",chatlog)

		chatlog_clear(/*Phat T*/)
			if(chatlog)
				src << output(null,chatlog)



// chatbox settings

chatbox
	screen_loc = "1:19,1:25"

	maptext_height = 195
	maptext_width = 320

	maxlines = 250
	chatlines = 11

	//font_family = "Times New Roman"
	font_family = "Calibri"
	font_color = "#FFFFFF"

	text_shadow = "#222d"

chatbox_gui
	icon = 'chatbox_gui.dmi'

	background
		icon = 'chatbox_bg.dmi'
		screen_loc = "1:16,1:20 to 7,4:32"
		mouse_opacity = 0

	start
		icon_state = "start"
		screen_loc = "1,3"

	up
		icon_state = "up"
		screen_loc = "1,2:16"

	down
		icon_state = "down"
		screen_loc = "1,2"

	end
		icon_state = "end"
		screen_loc = "1,1:16"





mob/player

	var/tmp/_chatboxopen=1
	verb



	// chatbox

		clear_chatbox(/*Phat T*/)
			set category = "chatbox"
			set hidden = 1
			if(client)
				client.chatbox_clear(/*Phat T*/)




mob/player
	verb
		World(msg as text)
			set hidden = 1
			src.Filter_Text(msg,"World-Say")
		Local(msg as text)
			set hidden = 1
			src.Filter_Text(msg,"Local-Say")
		Chat(/*Phat T*/)
			set hidden = 1
			if(client.command_text == "World ")
				client.command_text = "Local "
				winset(src,"default.Chatt","text=Local")
			else
				client.command_text = "World "
				winset(src,"default.Chatt","text=World")
proc
	/****************/
	/**ASCII FILTER**/
	/****************/
	ASCII_Filter(var/text,var/options)
		var/options2 = Split(options,"&")
		var/list/allowedlist = list("")
		for(var/x in options2)
			if(findtext(x,"-"))
				var/startnum = text2num(copytext(x,1,4))
				var/endnum = text2num(copytext(x,5,8))
				for(var/i = startnum, i <= endnum)
					allowedlist += i
					i ++
			else
				allowedlist += text2num(x)
		for(var/ii = 1, ii <= length(text), ii++)
			var/a = text2ascii(copytext(text, ii, ii+1))
			if(a in allowedlist)
				continue
			else
				return 0
		return 1




mob
	player
		Topic(href,href_list[/**/])
			switch(href_list["action"])
				if("PM")
					var/msg = input("What would you like to privately say to [src] ([src.key])?","Private Message") as text|null
					usr.Filter_Text(msg,"Private-Message",src)
			. = ..(/*Phat T*/)
	var
		worldmute = 0
		tmp
			spamcheck = 0
			lastmsgcount = 0
			lastmsg = null
			spamming =0
mob
	proc
		Filter_Text(msg, chat, mob/target)
			var/mob/player/m = src
			switch(chat)
				if("World-Say")
					_message(world, "<font color=silver>([Clock(/*Phat T*/)]) <font color=#00cccc>[admin ? "[src.admin_tag]" : ""] [guild ? "[guildtag]" : ""] <font color=#ffa000> {[m]}: <font color=white>[msg]")
				if("Private-Message")
					_message(m, "<font color=blue><--(<a href=?m=\ref[target];action=PM>PM</a>) To [target]:</font color> [msg]", "#ffa000")
					_message(target, "<font color=red>-->(<a href=?m=\ref[m];action=PM>PM</a>) From [m]:</font color> [msg]", "#ffa000")
				if("Local-Say")
					_message(view(m), "<font color=silver>([Clock(/*Phat T*/)])<font color = #0066FF> [guild ? "[guildtag]" : ""] {[m]}: <font color = white>[msg]")

