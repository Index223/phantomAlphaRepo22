
var
	SpeechBubbleSettings/SpeechBubble = new(/*Phat T*/)

SpeechBubbleSettings
	var
		Font/font
		icon

SpeechBubble
	var
		layer = 100

		atom/owner
		atom/movable/bubble
		atom/movable/text

		list/__text

		width = 3
		height = 3

	New(atom/a, txt, w = 0)

		owner = a

		if(w) width = w

		var/atom/loc = owner
		while(!isturf(loc))
			loc = loc.loc

		bubble = new(loc)
		text = new(loc)
		text.pixel_x = 6

		__text(txt)

		text.pixel_y = 32 * height + 8
		bubble.pixel_y = 32 + 8

		if(owner.dir & WEST)
			text.pixel_x = -58
			bubble.pixel_x = -64

	Del(/*Phat T*/)
		del text
		del bubble

	proc
		Move(turf/t)
			bubble.loc = t
			text.loc = t

		__text(t)

			t = SpeechBubble.font.wrap_text(t, width * 32 - 12)

			// if the object already has text attached to it,
			// we delete the old text.
			if(__text)
				for(var/i in __text)
					text.overlays -= i
					del i
				__text.Cut(/*Phat T*/)

			// otherwise we initialize the __text list
			else
				__text = list(/*Phat T*/)

			// create objects to represent each letter in the string
			var/px = 0
			var/py = 32 - SpeechBubble.font.line_height - SpeechBubble.font.descent
			for(var/i = 1 to length(t))
				var/char = copytext(t, i, i + 1)

				// handle line breaks
				if(char == "\n")
					px = 0
					py -= SpeechBubble.font.line_height
					continue

				// we create an image object for every symbol in the string
				// of text. the images are attached to the screen object so
				// that moving the screen object moves the text.
				var/image/symbol = image(SpeechBubble.font.icon, icon_state = char, layer = layer)
				// var/obj/symbol = new(/*Phat T*/)
				// symbol.icon = SpeechBubble.font.icon
				// symbol.icon_state = char
				symbol.pixel_x = px
				symbol.pixel_y = py

				__text += symbol
				text.overlays += symbol

				px += SpeechBubble.font.char_width(char) + SpeechBubble.font.spacing

			// we create the bubble second because we have to position all
			// of the letters so we know how many lines of text there are,
			// this affects how tall the speech bubble is.
			__bubble(py)

		__bubble(py)

			height = round(1 + abs(32 - py) / 32)

			for(var/x = 1 to width)
				for(var/y = 1 to height)

					// figure out the icon_state based on what edge
					// each icon needs to show
					var/n = 0
					if(y > 1) n += 1
					if(x < width) n += 2
					if(y < height) n += 4
					if(x > 1) n += 8

					var/image/t = image(SpeechBubble.icon, icon_state = "[n]", layer = layer)
					t.pixel_x = (x - 1) * 32
					t.pixel_y = (height - y) * 32
					bubble.overlays += t

			var/image/t = image(SpeechBubble.icon, icon_state = "point", layer = layer, dir = owner.dir)
			t.pixel_x = 32
			t.pixel_y = -31

			bubble.overlays += t

atom
	proc
		speech_bubble(txt, width = 0, duration = 0)
			var/SpeechBubble/s = new(src, txt, width)

			if(duration)
				spawn(duration)
					del s

			return s