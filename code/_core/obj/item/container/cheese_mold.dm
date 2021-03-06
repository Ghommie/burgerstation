#define CHEESE_PROCESS_TIME 100

/obj/item/container/cheese_mold
	name = "cheese mold"
	desc = "Make cheese with this."
	desc_extended = "Cheesemaking is a delicate process. In order to make the best cheese, it needs to be mixed in open air and left undisturbed until it is fully formed. This can take up to a minute."

	icon = 'icons/obj/items/container/cheese_mold.dmi'
	icon_state = "wheel"

	reagents = /reagent_container/cheese_mold

	allow_beaker_transfer = TRUE

	var/list/cheese_mix = list()
	var/process_count = 0

	value = 10


/obj/item/container/cheese_mold/block
	icon_state = "block"

/obj/item/container/cheese_mold/proc/make_cheese()

	var/turf/T = get_turf(src)

	var/original_temperature = reagents.average_temperature

	var/total_non_enzyme_volume = 0

	for(var/reagent_id in reagents.stored_reagents)
		if(has_prefix(reagent_id,"enzymes"))
			continue
		var/reagent_volume = reagents.stored_reagents[reagent_id]
		total_non_enzyme_volume += reagent_volume

	var/obj/item/container/food/dynamic/cheese/C = new(T)
	C.icon_state = icon_state
	for(var/reagent_id in cheese_mix)
		var/reagent_volume = (cheese_mix[reagent_id]/CHEESE_PROCESS_TIME)*total_non_enzyme_volume
		C.reagents.add_reagent(reagent_id,reagent_volume,original_temperature,FALSE,FALSE)

	T.visible_message("The cheese finishes molding!")

	C.reagents.update_container()

	reagents.remove_all_reagents()

	process_count = 0
	allow_beaker_transfer = TRUE
	cheese_mix.Cut()
	stop_thinking()

	return TRUE

/obj/item/container/cheese_mold/think()

	if(is_turf(loc))
		process_count++
		var/area/A = get_area(src)
		if(cheese_mix[A.cheese_type])
			cheese_mix[A.cheese_type] += 1
		else
			cheese_mix[A.cheese_type] = 1

	if(process_count >= CHEESE_PROCESS_TIME)
		make_cheese()

	return TRUE

/obj/item/container/cheese_mold/click_self(var/mob/caller)

	spawn()
		var/answer = input("Are you sure you want to empty the contents of \the [src.name]?","Empty Contents","Cancel") in list("Yes","No","Cancel")
		if(answer == "Yes" && get_dist(caller,src) <= 1)
			reagents.remove_all_reagents(reagents.volume_current)
			caller.to_chat("You empty \the [src.name] of its contents.")

	return TRUE


/obj/item/container/cheese_mold/update_icon()

	if(allow_beaker_transfer)

		var/milk_count = 0
		var/enzyme_count = 0

		for(var/reagent_id in reagents.stored_reagents)
			var/reagent_volume = reagents.stored_reagents[reagent_id]
			if(has_prefix(reagent_id,"milk"))
				milk_count += reagent_volume
			else if(has_prefix(reagent_id,"enzyme"))
				enzyme_count += reagent_volume

		if(milk_count >= 40 && enzyme_count >= 10)
			allow_beaker_transfer = FALSE
			var/turf/T = get_turf(src)
			T.visible_message("The milk starts to curdle!")
			start_thinking(src)

	overlays.Cut()

	if(reagents.volume_current)
		var/image/I = new/image(icon,"[icon_state]_fill")
		I.color = reagents.color
		overlays += I

	return ..()