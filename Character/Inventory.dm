mob/proc/AddItems(obj/I)
	for(var/Grid/G in src.client.screen)
		if(G.used) continue
		if(!I.screen_loc) //only set if it doesn't have a screen location.
        //if picking up a new object, you'll want to set it to null
			I.screen_loc = G.screen_loc
		src.client.screen+=I
		G.used =1
		return
Grid
	parent_type = /obj
	icon = 'Inventory.dmi'
	icon_state = "Grid"
	var/used = 0


mob
	var
		tmp

			inventory_open //helps with last position if you just re-open inventory when it's already open.
		last_position
		inventory_list = new/list() //list to add grid and inventory items to wipe from the screen

mob/verb/CloseInventory()
	last_position = winget(src, "Inventory", "pos")
	inventory_open = 0
	winshow(src,"Inventory",0) //Hide the inventory window!

mob/verb/Inventory()
	if(inventory_open)
		last_position = winget(src, "Inventory", "pos")

	src.client.screen -= inventory_list
	inventory_list = new/list()

	inventory_open = 1
	winshow(src,"Inventory",1) //Show the inventory window!

	var/Position
	if(last_position)
		Position = last_position
	else
		Position = winget(src, "default", "pos") // Get the position of the "default" window and assign it to a var called "Position"
	winset(src,"Inventory","pos='[Position]'") // Set the position of the "Inventory" window to the same position as our main window.

	for(var/Column = 1 to 5) for(var/Row = 1 to 5) //Create a grid composed of 5 columns and 5 rows.
		var/Grid/G = new
		G.screen_loc = "Inv:[Row],[Column]"
		src.client.screen += G
		inventory_list += G

	for(var/obj/I in src.contents)
		inventory_list += I
		src.AddItems(I) //Generate the items on slots.






obj/items
	icon = 'Items.dmi' // The icon


	DblClick() //When you double click
		if(src in usr.contents) //If the item is inside my inventory
			return
		else   // If not...
			usr.contents.Add(src) //Add the item to my inventory
			usr.CloseInventory()
			usr.Inventory()
			return
	MouseDrag(src_object,over_object,src_location,over_location,src_control,over_control,params)// When we drag it...

		if(!(src in usr.contents)) return // If its not in our inventory...just cancel ...
		var/icon/I = new(src.icon,src.icon_state)//this is so the cursor icon transforms into the item itself...cool little effect.
		mouse_drag_pointer = I // now lets set the mouse cursor to that.

	MouseDrop(over_object=src,src_location,over_location, src_control,over_control,params) //When we drop it...

		if(over_control =="inventory.Inv") //If its inside the inventory window.
			var/obj/O = over_object
			src.screen_loc = O.screen_loc //Move the object on the new slot.

		if(over_control == "default.map1")
			src.screen_loc = null
			src.loc = usr.loc //over_location if you want it to be where the mouse is