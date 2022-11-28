if (dormant) exit;

event_inherited();

if (enemy_state == EnemyState.Attack) {
	//if (!zero_v2(nmove_v)) nmove_v = new Vector2(0, 0);
	if (floor(image_index) == 19) {
		instance_create_layer(x, y, "Instances", obj_enemy_projectile, {
			move_v: unit_v2(new Vector2(target.x - x, target.y - y)),
			origin: id
		});
		attack_interval_counter = ranged_attack_interval;
		enemy_state = EnemyState.Move;
	}
} else {
	attack_interval_counter = max(0, attack_interval_counter - 1);	
}

if (attack_interval_counter == 0 && !instance_exists(collision_line(x, y, target.x, target.x, abstract_obj_obstacle, true, true))) {
	enemy_state = EnemyState.Attack;	
}