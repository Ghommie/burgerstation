/subsystem/map_node/
	name = "Map Node Subsystem"
	desc = "Generates Map Nodes."
	priority = SS_ORDER_OBJS

/subsystem/map_node/Initialize()

	if(ENABLE_AI)

		LOG_SERVER("Node graph out of date. Rebuilding...")

		new /mob/abstract/node_checker(locate(1,1,1))

		var/map_nodes = 0
		var/adjacent_map_nodes = 0

		for(var/obj/map_node/M in all_map_nodes)
			if(M.initialize_node())
				map_nodes += 1
				adjacent_map_nodes += length(M.adjacent_map_nodes)

		LOG_SERVER("Initialized [map_nodes] valid map nodes with [adjacent_map_nodes] links.")

	return TRUE
