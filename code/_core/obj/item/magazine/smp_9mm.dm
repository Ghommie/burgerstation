/obj/item/magazine/smp_9mm
	name = "\improper 9mm smp magazine"
	icon = 'icons/obj/items/magazine/9mmsmp.dmi'
	icon_state = "smp"
	bullet_count_max = 27

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/smg/handheld
	)

	ammo = /obj/item/bullet_cartridge/pistol_9mm

/obj/item/magazine/smp_9mm/update_icon()

	if(length(stored_bullets))
		icon_state = "[initial(icon_state)]_[round(length(stored_bullets),3)]"
	else
		icon_state = "[initial(icon_state)]"

	..()

/*
/obj/item/magazine/smp_9mm/surplus
	name = "surplus 9mm smp magazine"

	ammo = /obj/item/bullet_cartridge/pistol_9mm/surplus
*/