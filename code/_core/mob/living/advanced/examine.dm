mob/living/advanced/get_examine_text(var/mob/examiner)

	var/survival_skill = 1

	if(examiner == src || is_observer(examiner))
		survival_skill = 999

	else if(is_advanced(examiner))
		var/mob/living/advanced/A = examiner
		survival_skill = A.get_skill_level(SKILL_SURVIVAL)

	. += div("examine_title",src.name)
	. += div("examine_description","\"[src.desc]\"")
	. += div("examine_description_long",get_flavortext())

	var/pronoun = capitalize(get_pronoun(src))

	for(var/obj/item/I in worn_objects)
		. += div("notice"," \icon[I] [pronoun] is wearing \the [I.name] on their [I.loc.loc.name]. (<a href='?src=\ref[examiner];take=\ref[I]'>Strip</a>)")

	for(var/obj/item/I in held_objects)
		. += div("notice"," \icon[I] [pronoun] is holding \the [I.name] in their [I.loc.loc.name]. (<a href='?src=\ref[examiner];take=\ref[I]'>Take</a>)")

	if(survival_skill > 50)
		. += div("carryweight","Carry Weight: [capacity]/[max_capacity].")

	var/final_pronoun = "They"
	if(examiner == src)
		final_pronoun = "You"

	if(health)
		if(health.damage[TOX] > 10)
			. += div("warning","[final_pronoun] look a bit sickly.")

		if(health.damage[OXY] > 10)
			. += div("warning","[final_pronoun] look a bit pale.")

	for(var/obj/item/organ/O in src.organs)
		if(!O.health)
			continue

		if(!O.hud_id)
			continue

		var/list/damage_desc = O.get_damage_description()

		var/is_injured = length(damage_desc)

		var/noun = "Their"
		var/number_text = ""
		if(examiner == src)
			noun = "Your"
			number_text = " ([O.health.health_current]/[O.health.health_max])"
		else if(!is_injured)
			continue
		else
			number_text = ""

		. += div(is_injured ? "warning" : "notice","[noun] [O.name] is [english_list(damage_desc,nothing_text="healthy")][number_text].")


	return .