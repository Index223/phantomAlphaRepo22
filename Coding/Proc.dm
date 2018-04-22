proc
	Split(var/text2split,var/SplitBy=",")
		var/CurPos=1
		var/list/SplitList=list()
		while(findtext(text2split,SplitBy,CurPos,0))
			var/NextPos=findtext(text2split,SplitBy,CurPos,0)
			SplitList+=copytext(text2split,CurPos,NextPos)
			CurPos=NextPos+1
		if(CurPos<=length(text2split))	SplitList+=copytext(text2split,CurPos,0)
		return SplitList
	Clock(format="g:i A",offset=0,timestamp=world.realtime)
		if(isnum(offset)) offset = round(offset) * 36000
		else
			var/p = findtext(offset,":")
			if(p) offset = (round(text2num(copytext(offset,1,p))) * 36000) + (round(text2num(copytext(offset,p+1))) * 600)
			else offset = round(text2num(offset)) * 36000
		timestamp += offset
		for(var/i=1;i<=length(format);i++)
			switch(text2ascii(format,i))
				if(111)
					if(i > 1 && ((text2ascii(format,i-1) == 68 || text2ascii(format,i-1) == 100))) . += ((time2text(timestamp,"DD") == "1" || time2text(timestamp,"DD") == "21" || time2text(timestamp,"DD") == "31") ? "st" : ((time2text(timestamp,"DD") == "2" || time2text(timestamp,"DD") == "22") ? "nd" : ((time2text(timestamp,"DD") == "3" || time2text(timestamp,"DD") == "23") ? "rd" : "th")))
					else . += copytext(format,i,i+1)
				if(65,97) . += (text2num(time2text(timestamp,"hh")) >= 0 && text2num(time2text(timestamp,"hh")) < 12 ? (text2ascii(format,i) == 65 ? "AM" : "am") : (text2ascii(format,i) == 65 ? "PM" : "pm"))
				if(115) . += time2text(world.timeofday,"ss")
				if(105) . += time2text(timestamp,"mm")
				if(103) . += num2text(round((text2num(time2text(timestamp,"hh"))+11)%12+1))
				if(71) . += time2text(timestamp,"hh")
				if(104) . += (round((text2num(time2text(timestamp,"hh"))+11)%12+1) < 10 ? ("0"+num2text(round((text2num(time2text(timestamp,"hh"))+11)%12+1))) : num2text(round((text2num(time2text(timestamp,"hh"))+11)%12+1)))
				if(72) . += "[text2num(time2text(timestamp,"hh")) < 10 ? "0[time2text(timestamp,"hh")]" : time2text(timestamp,"hh")]"
				if(100) . += (text2num(time2text(timestamp,"DD")) < 10 ? copytext(time2text(timestamp,"DD"),2) : time2text(timestamp,"DD"))
				if(68) . += time2text(timestamp,"DD")
				if(116) . += time2text(timestamp,"DDD")
				if(109) . += time2text(timestamp,"MM")
				if(77) . += (text2num(time2text(timestamp,"MM")) < 10 ? "0[time2text(timestamp,"MM")]" : "[time2text(timestamp,"MM")]")
				if(117) . += time2text(timestamp,"MMM")
				if(89) . += time2text(timestamp,"YYYY")
				if(121) . += time2text(timestamp,"YY")
				else . += copytext(format,i,i+1)
	cn(n)
		var/neg
		if(n < 0)
			neg = 1
			n = -n
		. = ""
		if(n > round(n))
			. = copytext("[n-round(n)+1]",2)
			n = round(n)
		while(n >= 1000)
			var/m = n % 1000
			. = ",[copytext("[m+1000]",2)][.]"
			n = round((n-m)/1000, 1)
		. = "[n][.]"
		if(neg) . = "-[.]"
