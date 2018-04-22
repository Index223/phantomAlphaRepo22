obj
	QuestBorder
		icon='QuestBorder.dmi'

		layer=5


turf

	MapTurfs
		icon='MapTurfs.dmi'


	MapTurfs2
		icon='MapTurfs2.dmi'



	densfix
		density=1
	blastable
		Enter(mob/M)
			if(istype(M) && !M.flying)
				return FALSE
			return ..(/**/)

	MapTurfs3
		icon='MapTurfs3.dmi'
	MapTurfs4
		icon='MapTurfs4.dmi'
	MapTurfs5
		icon='MapTurfs5.dmi'
	MapTurfs6
		icon='MapTurfs6.dmi'
	MapTurfs7
		icon='MapTurfs7.dmi'
	MapTurfs8
		icon='MapTurfs8.dmi'
	MapTurfs9
		icon='MapTurfs9.dmi'
	MapTurfs10
		icon='MapTurfs10.dmi'
	MapTurfs11
		icon='MapTurfs11.dmi'
	MapTurfs12
		icon='MapTurfs12.dmi'
	Porter
		icon='Porter.dmi'
	Temple
		icon='Temple.dmi'
	House1
		icon='House.dmi'
		density=1

	Floor
		icon='Floor.dmi'

	fog
		layer=-1

	Void
		icon = 'Void.dmi'
		opacity = 1
		Enter(atom/O)
			if(isobj(O)) del(O)
			else if(ismob(O)) return FALSE


	Water
		icon='MapTurfs.dmi'
		icon_state="49"
		Enter(mob/M)
			if(istype(M)&&!M.flying)
				return FALSE
			return ..(/*Phat T*/)
	Water2
		icon='MapTurfs.dmi'
		icon_state="58"
		Enter(mob/player/M)
			if(istype(M)&&!M.flying)
				return FALSE
			return ..(/*Phat T*/)

	Water3
		icon='MapTurfs.dmi'
		icon_state="59"
		Enter(mob/M)
			if(istype(M)&&!M.flying)
				return FALSE
			return ..(/*Phat T*/)
	Water4
		icon='MapTurfs.dmi'
		icon_state="60"
		Enter(mob/M)
			if(istype(M)&&!M.flying)
				return FALSE
			return ..(/*Phat T*/)
obj
	MountainCliffs
		bottomclift
			bounds="1,1 to 48,42"
			density=1
		inbottomrightclif
			bounds="28,1 to 48,42"
			density=1
		inbottomleftclif
			bounds="1,1 to 28,42"
			density=1
		outbottomleftclif
			bounds="16,1 to 48,42"
			density =1
		outbottomrightclif
			bounds="1,1 to 32,42"
			density =1
		outtopleftclif
			bounds="16,48 to 48,48"
			density=1
		outtoprightclif
			bounds="1,32 to 32,42"
			density=1
		topcliff
			bounds="1,48 to 48,48"
			density=1
		leftcliff
			bounds="16,1 to 28,48"
			density=1
		rightcliff
			bounds="23,1 to 32,48"
			density=1
	GrassCliffs
		bottomcliff
			density=1
			bounds="1,1 to 48,17"
		topcliff
			density=1
			bounds="1,41 to 48,48"
		rightcliff
			density=1
			bounds="26,1 to 39,48"
		leftcliff
			density=1
			bounds="12,1 to 24,48"
		intopleft
			density=1
			bounds="32,41 to 48,41"
		intopleft2
			density=1
			bounds="32,41 to 39,48"
		intopright
			density=1
			bounds="1,41 to 8,41"
		intopright2
			density=1
			bounds="12,41 to 24,41"
		inbottomright
			density=1
			bounds="26,1 to 39,17"
		inbottomleft
			density=1
			bounds="1,1 to 24,17"
		outbottomright
			density=1
			bounds="1,12 to 39,17"
		outbottomleft
			density=1
			bounds="12,26 to 48,17"
		outtopleft
			density=1
			bounds="12,41 to 48,48"
		outtopright
			density=1
			bounds="1,41 to 39,48"
	Trees
		density=0
		icon='MapTurfs.dmi'
		tr1
			density=1
			icon_state="23"
			bounds="16,31 to 31,32"
		tr1fix
			layer=5
			icon_state="fix23"

		tr2
			icon_state="25"
			layer=5
		tr3
			icon_state="26"
			layer=5

		tr4
			icon_state="27"
			layer=5
		tr5
			icon_state="28"
			layer=5
		tr6
			icon_state="29"
			layer=5
		tr7
			icon_state="30"
			layer=5

		tr8
			density=1
			icon_state="32"
			bounds="16,31 to 31,31"
		tr8fix
			layer=5
			icon_state="32fix"
		tr9
			icon_state="34"
			layer=5
		tr10
			icon_state="35"
			layer=5

		tr11
			icon_state="36"
			layer=5
		tr12
			icon_state="37"
			layer=5
		tr13
			icon_state="38"
			layer=5
		tr14
			icon_state="39"
			layer=5
		tr15
			icon_state="31"
			layer=5
		tr16
			icon_state="33"
			layer=5
		tr17
			icon_state="31fix"
		tr18
			icon_state="33fix"
		tr19
			density=1
			icon_state="41"
			bounds="16,31 to 31,31"
		tr20
			icon_state="43"
			layer=5
		tr21
			icon_state="44"
			layer=5
		tr22
			icon_state="45"
			layer=5
		tr23
			icon_state="47"
			layer=5
		tr19fix
			icon_state="41fix"
			layer=5