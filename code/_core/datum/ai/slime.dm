/ai/slime/
	radius_find_enemy = 12

	target_distribution_y = list(0,0,0,0,4,8)

	objective_delay = 10
	attack_delay = 1
	movement_delay = 1

	simple = TRUE
	sync_movement_delay = TRUE
	sync_attack_delay = TRUE

	stationary = FALSE

	roaming_distance = 32

/ai/slime/proc/can_absorb_slime(var/mob/living/simple/npc/slime/S)

	var/mob/living/simple/npc/slime/self = owner

	if(S == self)
		return FALSE

	if(S.slime_color == self.slime_color)
		return FALSE

	if(S.stored_slimes > self.stored_slimes)
		return FALSE

	if(self.stored_slimes >= self.stored_slimes_max)
		return FALSE

	if(self.stored_slimes + S.stored_slimes > self.stored_slimes_max)
		return FALSE

	if(!S.can_attack(self,S))
		return FALSE

	return TRUE

/ai/slime/get_possible_targets()

	var/list/possible_targets = list()

	var/mob/living/simple/npc/slime/self = owner

	for(var/mob/living/advanced/player/P in view(radius_find_enemy,owner))
		if(should_attack_mob(P))
			possible_targets += P

	if(!length(possible_targets) && self.stored_slimes < self.stored_slimes_max)
		for(var/mob/living/simple/npc/slime/S in view(radius_find_enemy,owner))
			if(can_absorb_slime(S))
				possible_targets += S

	return possible_targets

/ai/slime/do_attack(var/atom/atom_to_attack)

	if(!is_slime(atom_to_attack) || !can_absorb_slime(atom_to_attack))
		return ..()

	var/mob/living/simple/npc/slime/self = owner
	self.absorb_slime(atom_to_attack)

	return TRUE
