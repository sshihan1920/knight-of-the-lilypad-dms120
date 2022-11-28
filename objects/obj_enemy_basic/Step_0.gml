if (dormant) exit;

event_inherited();

if (enemy_state == EnemyState.Attack) {
	if (floor(image_index) == 11) {
		enemy_state = EnemyState.Move;
		attack_timer = attack_time;
		if (instance_exists(attack_hitbox)) {
			instance_destroy(attack_hitbox);
			attack_hitbox = noone;
		}
	} else if (floor(image_index) == 7 && first_hitbox) {
		var t_offset = scale_v2(unit_v2(new Vector2(target.x - x, target.y - y)), attack_reach);
		attack_hitbox = instance_create_layer(x + t_offset.x, y + t_offset.y, "Instances", obj_enemy_melee_attack, {
			origin: id,
			offset: t_offset,
		});
		first_hitbox = false;
	}
} else {
	attack_timer = max(0, attack_timer - 1);
}

if (point_distance(x, y, target.x, target.y) <= anticipation_range && attack_timer == 0 && enemy_state != EnemyState.Attack) {
	first_hitbox = true;
	enemy_state = EnemyState.Attack;
}