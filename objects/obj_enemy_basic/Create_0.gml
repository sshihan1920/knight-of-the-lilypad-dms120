event_inherited();

function handle_sprite_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
		case EnemyState.Special:
		case EnemyState.Attack:
		case EnemyState.Move:
			switch enemy_direction {
				case EnemyDirection.Left:
					sprite_index = spr_basicenemy_walk_left;
					break;
				case EnemyDirection.Right:
					sprite_index = spr_basicenemy_walk_right;
					break;
			}
			break;
	}
}

// attack handling
attack_frame	= 8;
attack_time		= 20;
attack_timer	= attack_time;
attack_hitbox	= noone;