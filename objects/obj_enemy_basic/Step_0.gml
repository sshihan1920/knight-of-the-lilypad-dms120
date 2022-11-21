event_inherited();

if (enemy_state == EnemyState.Attack) {
	if (image_index == 12) {
		enemy_state = EnemyState.Move;
	} else if (image_index == 8) {
			
	}
}

if (point_distance(x, y, target.x, target.y) <= sp * attack_frame && attack_timer == 0) {
	
}