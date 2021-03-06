/obj/item/magazine/pistol_50
	name = "\improper .50 pistol magazine"
	icon = 'icons/obj/items/magazine/50aepistol.dmi'
	icon_state = "50aepistol"
	bullet_count_max = 7

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/pistol/deagle,
		/obj/item/weapon/ranged/bullet/magazine/pistol/deagle/gold
	)

	ammo = /obj/item/bullet_cartridge/pistol_50

	bullet_length_min = 30
	bullet_length_best = 33
	bullet_length_max = 36

	bullet_diameter_min = 12
	bullet_diameter_best = 12.7
	bullet_diameter_max = 13

/obj/item/magazine/pistol_50/update_icon()
	if(length(stored_bullets))
		icon_state = "[initial(icon_state)]_1"
	else
		icon_state = "[initial(icon_state)]"

	..()