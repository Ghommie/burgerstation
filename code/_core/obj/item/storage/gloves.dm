/obj/item/storage/glovebox/
	name = "white glovebox"
	desc = "Contains a matching pair of gloves."
	icon_state = "glovebox"

	size = 2

	is_container = TRUE
	container_max_size = 1

	dynamic_inventory_count = 2

/obj/item/storage/glovebox/white/fill_inventory()
	new /obj/item/clothing/hands/gloves/colored(src.loc)
	new /obj/item/clothing/hands/gloves/colored/left(src.loc)
	return ..()

/obj/item/storage/glovebox/yellow/
	name = "insulated glovebox"
	desc = "Contains 2 insulated yellow gloves."

/obj/item/storage/glovebox/yellow/fill_inventory()
	new /obj/item/clothing/hands/gloves/colored/yellow(src)
	new /obj/item/clothing/hands/gloves/colored/yellow/left(src)
	return ..()

/obj/item/storage/glovebox/padded/
	name = "padded glovebox"
	desc = "Contains 2 padded black gloves. Perfect for winter conditions."

/obj/item/storage/glovebox/padded/fill_inventory()
	new /obj/item/clothing/hands/gloves/colored/padded/black(src)
	new /obj/item/clothing/hands/gloves/colored/padded/black/left(src)
	return ..()