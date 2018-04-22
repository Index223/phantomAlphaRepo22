var/const
	ARMOR_LAYER = FLOAT_LAYER-1
	CLOTHES_LAYER = FLOAT_LAYER-2
	HAIR_LAYER= FLOAT_LAYER
obj
	var
		cost
	overlay
		Aura
			pixel_x = -40
			icon='Aura.dmi'
			icon_state="heal"
			layer=FLOAT_LAYER+1
			alpha =150
		deflectaura
			pixel_x = -40
			icon='Aura.dmi'
			icon_state="deflect"
			layer=FLOAT_LAYER+1
		Daze
			icon='Daze.dmi'
			layer= HAIR_LAYER+1
			pixel_y=16