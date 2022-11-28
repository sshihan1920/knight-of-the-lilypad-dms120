event_inherited();

function handle_sprite_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
		case EnemyState.Special:
		case EnemyState.Attack:
			switch enemy_direction {
				case EnemyDirection.Left:
					sprite_index = spr_slimeenemy_shoot_left;
					break;
				case EnemyDirection.Right:
					sprite_index = spr_slimeenemy_shoot_right;
					break;
			}
			break;
		case EnemyState.Move:
			switch enemy_direction {
				case EnemyDirection.Left:
					sprite_index = spr_slimeenemy_walk_left;
					break;
				case EnemyDirection.Right:
					sprite_index = spr_slimeenemy_walk_right;
					break;
			}
			break;
	}
}

function normalize_move_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
		case EnemyState.Move:
		case EnemyState.Attack:
		case EnemyState.Special:
			cur_v = normal_cap_v2(cur_v, sp);
			break;
	}
}

attack_interval_counter = ranged_attack_interval

interp_const = 4