/obj/hud/button/health/body
	name = "limb health"
	desc = "Health for your limbs."
	id = "body"

	icon = 'icons/hud/new.dmi'
	icon_state = "invisible"

	screen_loc = "RIGHT,BOTTOM+2.2"

	flags = FLAGS_HUD_MOB

	user_colors = FALSE

	var/list/labeled_overlays = list()

/obj/hud/button/health/body/Destroy()
	labeled_overlays.Cut()
	return ..()

/obj/hud/button/health/body/update_owner(var/mob/desired_owner)

	. = ..()

	if(.)

		if(!is_advanced(owner))
			return FALSE

		var/mob/living/advanced/A = owner

		overlays.Cut()
		labeled_overlays.Cut()

		for(var/o_id in A.labeled_organs)

			var/obj/item/organ/O = A.labeled_organs[o_id]

			if(!O)
				LOG_ERROR("Body error! Line 41 of health/body.dm!")
				continue

			if(!O.health)
				continue

			if(!O.hud_id)
				continue

			if(!O.health.health_max)
				continue

			var/image/I = new/image(icon,O.hud_id)
			I.color = "#FF0000"
			labeled_overlays[o_id] = I
			overlays += I

		update_icon()

	return .



/obj/hud/button/health/body/update_icon() //Wait, isn't this a clone of something? TODO HEALTH

	..()

	if(!is_advanced(owner))
		return FALSE

	var/mob/living/advanced/A = owner

	overlays.Cut()

	for(var/o_id in labeled_overlays)

		var/image/I = labeled_overlays[o_id]
		var/obj/item/organ/O = A.labeled_organs[o_id]

		if(!O)
			labeled_overlays -= o_id
			continue

		if(!O.health)
			labeled_overlays -= o_id
			continue

		if(!O.hud_id)
			labeled_overlays -= o_id
			continue

		if(!O.health.health_max)
			labeled_overlays -= o_id
			continue

		var/health_mod = O.health.health_current / O.health.health_max

		var/good_color = "#00FF00"
		var/bad_color = "#FF0000"
		var/color_mod = "#000000" //Final color

		if(owner && owner.client)
			var/color_scheme = owner.client.settings.loaded_data["hud_colors"]
			good_color = color_scheme[3]
			bad_color = color_scheme[6]

		if(health_mod <= 0)
			color_mod = "#303030"
		else if(health_mod >= 1)
			color_mod = good_color
		else
			color_mod = blend_colors(bad_color,good_color,health_mod*0.9)

		I.color = color_mod
		labeled_overlays[o_id] = I
		overlays += I

/obj/hud/button/health/body/get_examine_text(var/mob/examiner)

	. = ..()

	var/returning = ""

	if(is_advanced(examiner))

		var/mob/living/advanced/A = examiner

		for(var/obj/item/organ/O in A.organs)

			if(!O.health)
				continue

			if(!O.hud_id)
				continue

			var/list/damage_desc = list()

			if(O.health.damage[BRUTE])
				damage_desc += "bruised"

			if(O.health.damage[BURN])
				damage_desc += "burned"

			if(O.health.damage[OXY])
				damage_desc += "pale"

			if(O.health.damage[TOX])
				damage_desc += "sickly"

			if(O.health.damage[FATIGUE])
				damage_desc += "limp"

			var/is_injured = length(damage_desc)

			returning += div(is_injured ? "warning" : "notice","Your [O.name] is [english_list(damage_desc,nothing_text="healthy")] ([O.health.health_current]/[O.health.health_max]).")

	return returning