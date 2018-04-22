obj
	Battle
		Explosions
			Meteors
				icon='Meteors.dmi'
				density=FALSE
				layer=11
				pixel_x =-16
				pixel_z = 128
				New()
					animate(src,pixel_z = 0,time=6)
					spawn(35*0.25)
						if(src) src.loc=null
			Fire
				icon = 'explosion04.dmi'
				pixel_x= -48
				pixel_y= -48
				density = FALSE
				layer = 11
				New()
					flick("explosion04c",src)
					spawn(25*25)
						if(src)	src.loc=null