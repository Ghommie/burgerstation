/mob/living/advanced/npc/unique/diamond_with_flaw
	name = "Diamond with Flaw"
	desc = "Fucking trees."
	species = "diona"
	sex = NEUTER
	gender = MALE
	dialogue_id = "diamond_dialogue"
	dir = EAST
	ai = /ai/villager

/mob/living/advanced/npc/unique/diamond_with_flaw/Initialize()
	. = ..()
	change_organ_visual("skin", desired_color = "#BC9D58")
	change_organ_visual("skin_detail", desired_color = "#719333")
	change_organ_visual("skin_glow", desired_color = "#B2F861")
	update_all_blends()
	add_outfit("diamond_outfit")
	return .
