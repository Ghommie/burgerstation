/obj/structure/interactive/ore_storage
	name = "ore storage"
	icon = 'icons/obj/structure/ore_storage.dmi'
	icon_state = "ore_storage_map"

/obj/structure/interactive/ore_storage/update_icon()

	if(thinks)
		icon_state = "ore_storage_1"
	else
		icon_state = "ore_storage"

	return ..()

/obj/structure/interactive/ore_storage/Initialize()
	. = ..()
	icon_state = "ore_storage"
	start_thinking(src)
	update_icon()
	return .

/obj/structure/interactive/ore_storage/Cross(atom/movable/O,var/atom/NewLoc,var/atom/OldLoc)
	store_ore(O)
	return FALSE

/obj/structure/interactive/ore_storage/proc/store_ore(var/atom/movable/M)

	if(istype(M,/obj/item/material/ore/))
		var/obj/item/material/ore/O = M
		O.force_move(src)
		return TRUE

	if(istype(M,/obj/structure/interactive/ore_box))
		var/obj/structure/interactive/ore_box/OB = M
		var/did_store = FALSE
		for(var/obj/item/material/ore/O in OB.contents)
			if(store_ore(O))
				did_store = TRUE

		if(did_store)
			OB.visible_message("\The [OB.name] dumps all the ore inside \the [src.name].")

		return TRUE

	return FALSE

/obj/structure/interactive/ore_storage/think()
	if(length(src.contents))
		var/atom/movable/A = src.contents[1]
		A.force_move(get_step(src,dir))
	return TRUE