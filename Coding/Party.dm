mob
	var/tmp/partyopen=0
	verb
		Party(/*Phat T*/)
			set hidden = 1
			if(!usr.partydatum)
				if(!usr.partyopen)
					winshow(usr,"Partywindow",1)
					winset(usr,"Partywindow","title=Party")
					winset(usr,"Partywindow.leave","is-visible=false")
					winset(usr,"Partywindow.speak","is-visible=false")
					winset(usr,"Partywindow.break","is-visible=false")
					winset(usr,"Partywindow.eject","is-visible=false")
					winset(usr,"Partywindow.change","is-visible=false")
					winset(usr,"Partywindow.invite","is-visible=false")
					winset(usr,"Partywindow.options","is-visible=false")
					usr.clearpartygrid(/*Phat T*/)
					usr.partyopen = 1
					usr.alertopen=0
					return
				else
					winshow(usr,"Partywindow",0)
					usr.partyopen = 0
					return
			else
				if(usr.partyopen)
					winshow(usr,"Partywindow",0)
					usr.partyopen =0
					return
				else
					winshow(usr,"Partywindow",1)
					usr.partyopen = 1
					return



var
	list
		parties=list(/*Phat T*/)

	GRAPHICAL_DISPLAY=1
mob/var

	tmp/partydatum
	tmp/alertopen=0


mob/proc
	expgain(expz as num,target)
		if(!partycheck(src,expz))
			exp += expz
	goldgain(zenniz as num,target)
		if(!partycheck(src,null,zenniz))
			money += zenniz
party
	New(/*Phat T*/)
		..(/*Phat T*/)
		parties+=src
	Del(/*Phat T*/)
		parties-=src
		..(/*Phat T*/)
	var/tmp
		name
		list
			members=new/list(/*Phat T*/)
		mob/leader
		limit      = 4
		levelres   = 75
		levelreq   = 75
		expshare   = TRUE
		zennishere  = TRUE
		sharerange = 25
	proc
		createparty(codename,mob/creator)
			leader=creator
			for(var/party/p in parties)
				if(ckey(p.name)==ckey(codename))
					leader << "<b><font color = green>Your party, [codename], could not be created. It already exists."
					leader=null
					del src
			name=codename
			members+=leader
			leader.partydatum=src
			if(GRAPHICAL_DISPLAY)winset(leader,"Partywindow","title='The [codename] party'")
			if(GRAPHICAL_DISPLAY)winset(leader,"Partywindow.leave","is-visible=true")
			if(GRAPHICAL_DISPLAY)winset(leader,"Partywindow.speak","is-visible=true")
			leader << "<b><font color = green>You are now the leader of the [codename] party!</font></b>"
			redobuttons(null,leader)
			reorderparty(/*Phat T*/)

		changeleader(newleader)
			partyloop("Party leader has changed from [leader] to [newleader].")
			redobuttons(leader,newleader)
			leader=newleader

			reorderparty(/*Phat T*/)

		ejectmember(mob/byebye)
			if(locate(byebye)in members)
				members-=byebye
				byebye.partydatum=null
				byebye.clearpartygrid(/*Phat T*/)
				byebye << "<b><font color = green>You have been ejected from the party. ([name])"
				if(GRAPHICAL_DISPLAY)winset(byebye,"Partywindow","title=Party")
				if(GRAPHICAL_DISPLAY)winset(byebye,"Partywindow.leave","is-visible=false")
				if(GRAPHICAL_DISPLAY)winset(byebye,"Partywindow.speak","is-visible=false")
				partyloop("[byebye] was ejected from the party.")
				reorderparty(/*Phat T*/)
				byebye.clearpartygrid(/*Phat T*/)
				winshow(byebye,"Partywindow",0)
				byebye.partyopen =0
			else leader << "<b><font color = green>[byebye] is not in the party.</font></b>"

		leaveparty(mob/abandoner)
			//makes abandoner leave the party
			abandoner << "<b><font color = green>You have left the [abandoner.partydatum] party.</font></b>"
			abandoner.partydatum=null
			abandoner.clearpartygrid(/*Phat T*/)
			members-=abandoner
			if(abandoner.client)
				if(GRAPHICAL_DISPLAY)winset(abandoner,"Partywindow","title=Party")
				if(GRAPHICAL_DISPLAY)winset(abandoner,"Partywindow.leave","is-visible=false")
				if(GRAPHICAL_DISPLAY)winset(abandoner,"Partywindow.speak","is-visible=false")
				redobuttons(abandoner,null)
				winshow(abandoner,"Partywindow",0)
				abandoner.partyopen =0
			partyloop("[abandoner] has left the party.")
			if(leader==abandoner)
				if(members.len>0)
					changeleader(pick(members))
				else
					partyloop("The party has been disbanded.")
					del src
			reorderparty(/*Phat T*/)

		breakparty(/*Phat T*/)
			partyloop("Your party has disbanded by [leader].")
			leader << "<b><font color = green>You disbanded the party. ([name])"
			for(var/mob/o in members)
				if(GRAPHICAL_DISPLAY)winset(o,"Partywindow","title=Party")
				if(GRAPHICAL_DISPLAY)winset(o,"Partywindow.leave","is-visible=false")
				if(GRAPHICAL_DISPLAY)winset(o,"Partywindow.speak","is-visible=false")
				redobuttons(o,null)
				o.clearpartygrid(/*Phat T*/)
				members-=o
				winshow(o,"Partywindow",0)
				o.partyopen =0

			del src

		partychat(init,text)
			if(text)

				_message(members,"<font color = #2AA02A>{[init]} <font color = #80B280>([name]): <font color = white>[html_encode(text)]")
		//	partyloop("([name])[init]:<font color = white>[html_encode(text)]")

		joinparty(mob/newmember)
			if(newmember.partydatum!="pending")return
			if(locate(newmember)in members)members-=newmember
			partyloop("[newmember] has joined the party! ([name])")
			members+=newmember
			winshow(newmember,"Partywindow",1)
			newmember.partydatum=src
			if(GRAPHICAL_DISPLAY)winset(newmember,"Partywindow","title='The [name] party'")
			if(GRAPHICAL_DISPLAY)winset(newmember,"Partywindow.leave","is-visible=true")
			if(GRAPHICAL_DISPLAY)winset(newmember,"Partywindow.speak","is-visible=true")
			reorderparty(/*Phat T*/)

		partyloop(text as text)
			members<<"<b><font color = green>[text]</font></b>"

		requestjoin(mob/wantstojoin)
			if(members.len>=limit)               {_message(wantstojoin,"<b><font color = green>That party is currently full.</font></b>");wantstojoin.partydatum=null;return}
			if(wantstojoin.level<usr.level-10)       {_message(wantstojoin,"<b><font color = green>You are under that parties level requirement.</font></b>");wantstojoin.partydatum=null;return}
			if(wantstojoin.level>usr.level+10)       {_message(wantstojoin,"<b><font color = green>You are over that parties level restriction.</font></b>");wantstojoin.partydatum=null;return}
			if(wantstojoin.partydatum!="pending"){_message(wantstojoin,"<b><font color = green>You are already in a party.</font></b>");return}
			wantstojoin << "<b><font color = green>Your request has been sent to the leader of the party."
			switch(alert(leader,"[wantstojoin] wants to join the party, will you let them in?","Member request","Yes","No"))
				if("Yes")
					if(wantstojoin.partydatum!="pending"){_message(leader, "<b><font color = green>[wantstojoin] joined another party before waiting for your response.");return}
					joinparty(wantstojoin)
					_message(wantstojoin,"<b><font color = green>Welcome to the party!</font></b>")
				else
					_message(wantstojoin,"<b><font color = green>[leader] rejected your request.</font></b>")
					wantstojoin.partydatum=null


		reorderparty(/*Phat T*/)
			if(!GRAPHICAL_DISPLAY)return
			var/num=0
			var/col=1
			if(!members)return
			if(!members.len)return
			for(var/mob/o in members)
				if(o)
					o.clearpartygrid(/*Phat T*/)
			for(var/n=0 to members.len-1)
				members << output(members[++n],"Partywindow.peoplegrid:[++num],[col]")
				var/mob/player/m=members[n]
				if(m)
					members << output("LEVEL: [m.level]\n ROLL: [m.element]","Partywindow.peoplegrid:[++num],[col]")
				col++
				if(num>1)num=0

		redobuttons(mob/oldldr,mob/newldr)
			if(!GRAPHICAL_DISPLAY)return
			if(oldldr&&oldldr.client)
				winset(oldldr,"Partywindow.break","is-visible=false")
				winset(oldldr,"Partywindow.eject","is-visible=false")
				winset(oldldr,"Partywindow.change","is-visible=false")
				winset(oldldr,"Partywindow.invite","is-visible=false")
				winset(oldldr,"Partywindow.options","is-visible=false")
			if(newldr&&newldr.client)
				winset(newldr,"Partywindow.break","is-visible=true")
				winset(newldr,"Partywindow.eject","is-visible=true")
				winset(newldr,"Partywindow.change","is-visible=true")
				winset(newldr,"Partywindow.invite","is-visible=true")
				winset(newldr,"Partywindow.options","is-visible=true")

proc/partycheck(mob/ref,exp,aur)
	if(ref.partydatum)
		var/party/p=ref.partydatum
		var/list/list=list(/*Phat T*/)
		if(exp)
			for(var/mob/o in view(p.sharerange,ref))
				var/party/pp=o.partydatum
				if(pp)if(pp.name==p.name)list+=o
			exp=round(exp/list.len)
			if(!exp)exp=1
			for(var/mob/o in list)
				spawn(1)
					if(o)
						o.exp+=exp
					//	spawn(1)if(o)o.Level_Up(/*Phat T*/) //
						spawn(4)if(o)o.show_damage3(o,"Exp + [exp]","aqua")

			return 1
		if(aur)
			for(var/mob/o in view(p.sharerange,ref))
				var/party/pp=o.partydatum
				if(pp)if(pp.name==p.name)list+=o
			aur=round(aur/list.len)
			if(!aur)aur=1
			for(var/mob/o in list)
				o.money+=aur
				o.show_damage3(o,"PARTY SHARING :","yellow")
				spawn(4)if(o)o.show_damage3(o,"Zenni + [aur]","aqua")
			return 1
	return 0

mob
	proc/clearpartygrid(/*Phat T*/)
		//clears the party grid
		if(!GRAPHICAL_DISPLAY)return
		if(client)winset(src,"Partywindow.peoplegrid","cells=0,0")
	verb
		optionsparty(/*Phat T*/)
			set hidden=1
			if(alertopen)return
			if(!partydatum){_message(src, "<b><i>You aren't in a party!");return}
			var/party/p=partydatum
			if(p.leader!=src){_message(src, "<b><i>You aren't the party leader!");return}
			alertopen=1
			switch(input(src,"What options would you like to change?","Party options")in list("Sharing range","Level requirement","Level restriction","Member limit","Cancel"))
				if("Sharing range")
					var/x=round(input(src,"How many tiles away should your exp and zenni share?(Max 70)","Changing options",p.sharerange)as num)
					if(x<=5)x=5
					if(x>=70)x=70
					p.sharerange=x
					p.partyloop("Exp/Zenni share range changed to [x].")
				if("Level requirement")
					var/x=round(input(src,"What would you like the requirement for the party to be?","Changing options",p.levelreq)as num)
					if(x<=0)x=1
					if(x>15)x=15
					p.levelreq=x
					p.partyloop("Level requirement changed to [x].")
				if("Level restriction")
					var/x=round(input(src,"What would you like the restriction for the party to be?","Changing options",p.levelres)as num)
					if(x<=75)x=75
					if(x>=200)x=200
					p.levelres=x
					p.partyloop("Level restriction changed to [x].")
				if("Member limit")
					var/x=round(input(src,"How many members would you like to allow? (Max 4)","Changing options",p.limit)as num)
					if(x<=75)x=75
					if(x>=75)x=75
					if(x<p.members.len)x=p.members.len
					p.limit=x
					p.partyloop("Member limit changed to [x].")
				if("Cancel")
					alertopen=0
			alertopen=0
		inviteparty(/*Phat T*/)
			set hidden=1
			if(alertopen)return
			if(!partydatum){_message(src, "<b><i>You aren't in a party!");return}
			var/party/p=partydatum
			if(p.leader!=src){_message(src, "<b><i>You aren't the party leader!");return}
			var/list/clients=list(/*Phat T*/)
			for(var/mob/player/c)
				clients+=c
			var/mob/x=input("Who would you like to invite?","Invite member")in clients+"Cancel"-src
			if(x=="Cancel"){alertopen=0;return}
			if(x.partydatum){_message(src, "<b><font color = green>[x] is already in a party!");alertopen=0;return}
			if(p.members.len>=p.limit){_message(src,"<b><font color = green>Your party is currently full.</font></b>");alertopen=0;return}


			if(x.level<src.level-10){_message(src,"<b><font color = green>[x] is under your party's level requirement.</font></b>");alertopen=0;return}

			if(x.level>src.level+10){_message(src,"<b><font color = green>[x] is over your party's level restriction.</font></b>");alertopen=0;return}



			if(!partydatum){_message(src, "<b><i>You aren't in a party!");alertopen=0;return}
			switch(alert(x,"[src] wants you to join the party [p], will you join?","Join request","Yes","No"))
				if("Yes")
					if(!p){x<<"<b><font color = green>The party was recently disbanded before you hit join.</font></b>";return}
					if(x.partydatum){src << "<b><font color = green>[x] joined another party before waiting for your response.";alertopen=0;return}
					x.partydatum="pending"
					p.joinparty(x)
					_message(x,"<b><font color = green>Welcome to the party!</font></b>")
				else
					_message(src,"<b><font color = green>[x] rejected your request.</font></b>")
		makeparty(/*Phat T*/)
			set hidden=1
			if(alertopen)return
			var/party/p = new
			if(partydatum)   {_message(src, "<b><i>You are already in a party!");return}
			alertopen=1
			var/x=input(src,"What would you like to call the party?","Party name")as text
			if(lentext(x)<3){_message(src, "<b><i>Party name too short. Please try again with a longer name.");alertopen=0;return}
			p.createparty(x,src)
			alertopen=0
		exitparty(/*Phat T*/)
			set hidden=1
			if(alertopen)return
			if(!partydatum)  {_message(src, "<b><i>You aren't in a party!");return}
			alertopen=1
			var/party/p=partydatum
			p.leaveparty(src)
			alertopen=0

		chatparty(/*Phat T*/)
			set hidden=1
			if(!partydatum)  {_message(src, "<b><i>You aren't in a party!");return}
			var/party/p=partydatum
			var/text=input(src,"Tell your party what?","Party Chat")as text
			p.partychat(src,text)

		breakparty(/*Phat T*/)
			set hidden=1
			if(alertopen)return
			if(!partydatum)  {_message(src, "<b><i>You aren't in a party!");return}
			var/party/p=partydatum
			if(p.leader!=src){_message(src, "<b><i>You aren't the party leader!");return}
			p.breakparty(/*Phat T*/)

		changeleaderparty(/*Phat T*/)
			set hidden=1
			if(alertopen)return
			if(!partydatum)  {_message(src, "<b><i>You aren't in a party!");return}
			var/party/p=partydatum
			if(p.leader!=src){_message(src, "<b><i>You aren't the party leader!");return}
			alertopen=1
			var/mob/choice=input(src,"Who would you like to pass leadership onto?","Pass leader")in p.members-src+"Cancel"
			if(choice=="Cancel"){alertopen=0;return}
			if(!choice.partydatum){_message(src,"<b><font color = green>[choice] isn't currently in a party.");return}
			if(choice.partydatum!=partydatum)_message(src,"<b><font color = green>[choice] isn't currently in your party!")

			p.changeleader(choice)
			alertopen=0

		ejectparty(/*Phat T*/)
			set hidden=1
			if(alertopen)return
			alertopen=1
			if(!partydatum)  {_message(src, "<b><i>You aren't in a party!");return}
			var/party/p=partydatum
			if(p.leader!=src){src << "<b><i>You aren't the party leader!";return}
			var/mob/choice=input(src,"Who would you like to eject from your party?","Eject member")in p.members+"Cancel"-src
			if(choice=="Cancel")return
			if(!choice.partydatum){_message(src,"<b><font color = green>[choice] isn't currently in a party");return}
			if(choice.partydatum!=partydatum)_message(src,"<b><font color = green>[choice] isn't currently in your party!")
			p.ejectmember(choice)
			alertopen=0
