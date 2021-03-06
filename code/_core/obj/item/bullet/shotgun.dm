/obj/item/bullet_cartridge/shotgun/
	id = "shotgun"
	icon = 'icons/obj/items/bullet/shotgun.dmi'
	item_count_max = 4
	item_count_max_icon = 4

	id = "bullet"
	bullet_diameter = 18.5
	bullet_length = 18.5

	worn_layer = LAYER_MOB_CLOTHING_BELT
	item_slot = SLOT_GROIN_O

	projectile_speed = BULLET_SPEED_LARGE_PROJECTILE

	size = 0.04
	weight = 0.04

/obj/item/bullet_cartridge/shotgun/can_be_worn(var/mob/living/advanced/owner,var/obj/hud/inventory/I)
	return TRUE

/obj/item/bullet_cartridge/shotgun/on_spawn()
	item_count_current = 4
	return ..()

/obj/item/bullet_cartridge/shotgun/slug
	name = "\improper 12 gauge slug"
	desc = ""
	icon_state = "slug"

	projectile_count = 1
	base_spread = 0
	projectile_speed = 31


	projectile = /obj/projectile/bullet/shotgun_slug

	damage_type = "12_slug"

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.04
	weight = 0.04

	value = 6

/obj/item/bullet_cartridge/shotgun/buckshot
	name = "\improper 12 gauge buckshot shell"
	desc = ""
	icon_state = "buckshot"

	projectile_count = 8
	base_spread = 0.1

	projectile = /obj/projectile/bullet/shotgun_pellet

	damage_type = "12_buckshot"

	projectile_speed = BULLET_SPEED_LARGE_PROJECTILE

	size = 0.04
	weight = 0.04

	value = 6


/obj/item/bullet_cartridge/shotgun/rubber_balls
	name = "\improper 12 gauge rubber balls"
	desc = ""
	icon_state = "rubber"

	projectile_count = 8
	base_spread = 0.15

	projectile = /obj/projectile/bullet/shotgun_pellet

	damage_type = "12_rubber"

	projectile_speed = BULLET_SPEED_LARGE_PROJECTILE

	size = 0.04
	weight = 0.04

	value = 6

