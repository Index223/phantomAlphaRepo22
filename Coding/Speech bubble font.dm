Font
	TrebuchetMS
		icon = 'Text.dmi'

		// see fonts.dm for descriptions of these vars
		char_width = list(" " = 4, "a" = 5, "b" = 5, "c" = 5, "d" = 5, "e" = 5, "f" = 4, "g" = 6, "h" = 5, "i" = 2, "j" = 3, "k" = 5, "l" = 1, "m" = 7, "n" = 5, "o" = 5, "p" = 5, "q" = 5, "r" = 3, "s" = 4, "t" = 4, "u" = 5, "v" = 5, "w" = 7, "x" = 5, "y" = 5, "z" = 5, "A" = 5, "B" = 5, "C" = 6, "D" = 6, "E" = 5, "F" = 5, "G" = 6, "H" = 6, "I" = 1, "J" = 4, "K" = 5, "L" = 4, "M" = 7, "N" = 6, "O" = 7, "P" = 5, "Q" = 8, "R" = 6, "S" = 4, "T" = 5, "U" = 6, "V" = 7, "W" = 9, "X" = 6, "Y" = 7, "Z" = 5, "0" = 5, "1" = 3, "2" = 5, "3" = 5, "4" = 5, "5" = 4, "6" = 5, "7" = 5, "8" = 5, "9" = 5, "," = 2, "." = 1, "'" = 1, "\"" = 3, "?" = 4, "(" = 2, ")" = 2, "<" = 4, ">" = 4, "/" = 4, ";" = 2, ":" = 1, "-" = 3, "+" = 5, "=" = 4, "_" = 6, "!" = 1, "@" = 8, "#" = 6, "$" = 4, "%" = 7, "^" = 5, "&" = 7, "*" = 5)
		descent = 2
		spacing = 1
		line_height = 13
Font
	var
		icon

		// this is a list that associates every symbol with
		// its width (in pixels). this can be generated for
		// you by passing an icon file to the /Font object's
		// constructor. doing that will cause the code to
		// define this list to be printed to the console, so
		// you can run that once then paste that code into
		// your font's definition (like in text-demo\demo.dm)
		list/char_width = list(/*Phat T*/)

		// this is the maximum distance a symbol can descend
		// below the baseline. this is needed to properly
		// position symbols. for example:
		//
		//   +--------+  +--------+
		//   |  #     |  |        |
		//   | # #    |  |        |
		//   | # #    |  |        |
		//   |#   #   |  |        |
		//   |#####   |  |        |
		//   |#   #   |  |##      |
		//   |        |  | #      |
		//   |        |  |#       |
		//   +--------+  +--------+
		//
		// the icon for "A" doesn't put the symbol in the bottom
		// left corner because some letters descend below the
		// baseline. this icon has a descent of 2 which the comma
		// icon uses.
		descent = 0

		// this is the number of pixels placed between each pair
		// of symbols.
		spacing = 1

		// this is the number of pixels that will be shifted down
		// when a new line is made.
		line_height = 16

	New(icon/i)

		if(i)
			// find the width of each character
			for(var/state in icon_states(i))
				var/icon/I = icon(i, state)

				I.Scale(I.Width(/*Phat T*/), 1)

				var/width = 0
				for(var/x = 1 to I.Width(/*Phat T*/))
					var/rgba = I.GetPixel(x, 1)
					if(rgba)
						width = x

				char_width[state] = width

			// output the list of character widths
			var/comma = ""
			world << "char_width = list(\c"
			for(var/char in char_width)

				var/c = char

				// there are some characters we need to escape
				if(c == "\"") c = "\\\""
				else if(c == "\\") c = "\\\\"

				world << "[comma]\"[c]\" = [char_width[char]]\c"
				comma = ", "
			world << ")"

	proc
		char_width(c)
			if(c in char_width)
				return char_width[c]
			else
				return 0

		wrap_text(txt, line_width)

			// split txt into a list of words separated by spaces
			var/list/words = list(/*Phat T*/)
			var/word = ""
			for(var/i = 1 to length(txt))
				var/c = copytext(txt, i, i + 1)

				if(c == " ")
					words += word
					word = ""
				else
					word += c
			if(word)
				words += word

			// figure out where to add line breaks so that lines
			// never exceed the specified width
			var/px = 0
			var/output = ""
			var/space = ""

			for(var/i = 1 to words.len)
				word = "[space][words[i]]"

				// this will be the width of the word plus the space that comes
				// before it, only if there is a space that comes before it.
				var/word_width = word_width(word)

				// if this word fits on the line
				if(px + word_width < line_width)
					output += "[word]"
					space = " "
					px += word_width

				// if it doesn't fit, we have to figure out if
				// we need to split the word or if we just bump
				// it down to the next line
				else
					// we don't care about the width of the space anymore,
					// so just find the width of the word
					word = words[i]
					word_width = word_width(word)

					// if the word is longer than a whole line we need to
					// chop it into parts
					if(word_width > line_width)
						var/list/parts = chop_word(word, px, line_width)

						// add each part to the output string
						for(var/p in parts)
							output += p

						// our place in the current line will be the width of the last
						// word in the list
						px = word_width(parts[parts.len])
						space = " "

					// otherwise we just bump it down to the next line
					else
						output += "\n[word]"
						space = " "
						px = word_width

			return output

		// compute the width, in pixels, of some text
		text_width(txt)
			return word_width(txt)

		// compute the width, in pixels, of a word
		word_width(word)
			var/width = 0
			for(var/i = 1 to length(word))
				var/char = copytext(word, i, i + 1)
				width += char_width(char)

				// for all letters but the last
				if(i < length(word))
					width += spacing

			return width

		// returns the substring of the text that fits inside
		// the specified width.
		cut_text(txt, width_limit)
			return cut_word(txt, width_limit)

		// returns the substring of the word that fits inside
		// the specified width
		cut_word(word, width_limit)
			var/width = 0
			var/word_part = ""

			for(var/i = 1 to length(word))
				var/char = copytext(word, i, i + 1)
				width += char_width(char)

				if(width > width_limit)
					return word_part

				word_part += char

				// for all letters but the last
				if(i < length(word))
					width += spacing

			return word_part

		// chop a word into multiple parts to make it fit
		// within a specified width. this is used when there's
		// a single word that's too long to fit on one line so
		// we just have to chop it into parts.
		chop_word(word, px, line_width)

			var/line_width_left = line_width - px
			var/word_width = word_width(word)

			// because of recursive calls, eventually we'll chop the
			// word into a small enough part that it fits on the line.
			if(word_width <= line_width_left)
				return list(word)

			var/word_part = ""
			word_width = 0
			for(var/i = 1 to length(word))
				var/char = copytext(word, i, i + 1)

				// if adding this character bumps us over the edge of this
				// line, split the word before this letter and chop up the
				// remaining part of the word recursively
				if(word_width(word_part + char) > line_width_left)
					var/remainder = copytext(word, length(word_part) + 1)
					return list(word_part, "\n") + chop_word(remainder, 0, line_width)

				word_part += char

			// I don't think this will ever happen because if the for
			// loop is reached, it should also reach the recursive call
			// inside the loop and will return before the loop completes.
			return list(word_part)
