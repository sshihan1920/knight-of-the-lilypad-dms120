event_inherited();

function handle_sprite_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
		case EnemyState.Special:
		case EnemyState.Attack:
		case EnemyState.Move:
			switch enemy_direction {
				case EnemyDirection.Left:
					sprite_index = spr_snakeenemy_walk_left;
					break;
				case EnemyDirection.Right:
					sprite_index = spr_snakeenemy_walk_right;
					break;
			}
			break;
	}
}

hitbox = instance_create_layer(x, y, "Instances", obj_enemy_melee_attack, { 
	origin: id
});

hp = 1;
sp = 2.5;