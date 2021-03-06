/mob/living/advanced/proc/add_species_health_elements()

	var/species/S = all_species[species]

	for(var/v in S.spawning_health)
		var/obj/hud/button/B = v
		B = new B
		B.update_owner(src)

/mob/living/advanced/update_health_element_icons(var/health=FALSE,var/stamina=FALSE,var/mana=FALSE,var/update_body=FALSE)

	. = ..()

	if(update_body && health && health_elements && health_elements["body"])
		var/obj/hud/button/health/body/B = health_elements["body"]
		B.update_stats()

	return .