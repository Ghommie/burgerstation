var/global/list/experience/skill/all_skills = list()

/subsystem/skills/
	name = "Skill Subsystem"
	desc = "Stores all the known skills in a list."
	priority = SS_ORDER_PRELOAD

/subsystem/skills/Initialize()
	for(var/A in subtypesof(/experience/skill/))
		all_skills += A

	LOG_SERVER("Initialized [length(all_skills)] skills.")