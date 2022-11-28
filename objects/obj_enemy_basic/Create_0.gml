event_inherited();

function handle_sprite_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
		case EnemyState.Special:
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
		case EnemyState.Attack:
		switch enemy_direction {
			case EnemyDirection.Left:
				sprite_index = spr_basicenemy_attack_left;
				break;
			case EnemyDirection.Right:
				sprite_index = spr_basicenemy_attack_right;
				break;
		}
		break;
	}
}

// attack handling
//attack_frame	= 8;
attack_time		= 100;
attack_timer	= attack_time;
attack_reach	= 10;
attack_hitbox	= noone;

anticipation_range = 60;
first_hitbox = true;