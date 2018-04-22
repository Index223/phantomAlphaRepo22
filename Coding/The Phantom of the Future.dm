#define DEBUG
world
	fps = 40
	icon_size = 48
	name = "The Phantom of the Future"
	hub="PhatT.ThePhantomoftheFuture"
	view = ("19x13") // 816 x 624
	loop_checks=0
	tick_lag = 0.25
	mob = /mob/creating
	hub_password="n7mwbkh7"
	status ="<font color=green>CLOSED TESTING"

	New()
		SpeechBubble.font = new /Font/TrebuchetMS(/*Phat T*/)

		// The library also doesn't define what icon to use, that's
		// left up to the program using the library. You're welcome
		// to use speech-bubble.dmi in your own project.
		SpeechBubble.icon = 'speech-bubble.dmi'
		..()
client
	fps= 100
	show_map = 1
	command_text = "World "
	default_verb_category = "Actions"
	control_freak =  0|CONTROL_FREAK_MACROS
	perspective = EDGE_PERSPECTIVE
	New()
		..()
		winshow(src,"default.afk",0)
		winshow(src,"default.Report",0)
		winshow(src,"default.WHO",0)
		winshow(src,"default.PM",0)
		winshow(src,"default.Chatt",0)
		winshow(src,"default.Input",0)
		winshow(src,"default.stats",0)
		winshow(src,"default.Drop",0)
		winshow(src,"default.NameInput",0)
		winshow(src,"default.submitbutton",0)
		winshow(src,"default.NameInput",0)
		winshow(src,"default.submitbutton",0)
		winshow(src,"default.questbookchild",0)