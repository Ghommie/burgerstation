/mob/living/advanced/player/Topic(href,href_list[],hsrc)

	if(length(href_list) && href_list["take"])
		var/obj/item/I = locate(href_list["take"])
		I.try_strip(src)

	return ..()

/obj/item/proc/try_strip(var/mob/caller)
	if(!can_strip(caller))
		return FALSE
	PROGRESS_BAR(caller,src,SECONDS_TO_DECISECONDS(3),.proc/strip,caller)
	PROGRESS_BAR_CONDITIONS(caller,src,.proc/can_strip,caller)
	return TRUE

/obj/item/proc/strip(var/mob/caller)

	caller.to_chat("You remove \the [src.name].")

	drop_item(get_turf(src))

	if(is_advanced(caller))
		var/mob/living/advanced/A = caller
		A.put_in_hands(src)

	return TRUE

/obj/item/proc/can_strip(var/mob/caller)

	if(src.qdeleting)
		caller.to_chat("That doesn't exist!")
		return FALSE

	if(get_dist(src,caller) > 1)
		caller.to_chat("You're too far away!")
		return FALSE

	if(!istype(loc,/obj/hud/inventory/organs/))
		caller.to_chat("That's not there anymore!")
		return FALSE

	return TRUE