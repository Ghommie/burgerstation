/obj/item/weapon/ranged/bullet/revolver/traitor_357
	name = "\improper .357 Traditore Revolver"
	desc = "For all your traitor needs!"
	icon = 'icons/obj/items/weapons/ranged/revolver/357.dmi'
	icon_state = "inventory"

	shoot_delay = 7

	automatic = FALSE

	bullet_count_max = 6



	shoot_sounds = list('sounds/weapons/traitor/fire.ogg')

	view_punch = 12

	size = SIZE_2
	weight = WEIGHT_2

	slowdown_mul_held = HELD_SLOWDOWN_REVOLVER

/obj/item/weapon/ranged/bullet/revolver/traitor_357/get_static_spread() //Base spread
	return 0.01

/obj/item/weapon/ranged/bullet/revolver/traitor_357/get_skill_spread(var/mob/living/L) //Base spread
	return 0.04 - (0.04 * L.get_skill_power(SKILL_RANGED))