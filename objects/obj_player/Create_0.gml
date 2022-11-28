enum PlayerState {
	Idle,
	Move,
	Attack,
	Grapple,
	Jump,
	Prejump,
	Postjump,
}

enum PlayerDirection {
	Up,
	Down,
	Left,
	Right,
}

player_state = PlayerState.Idle;
player_direction = PlayerDirection.Down;

// Create player cursor
cursor	= noone;
gui		= noone;

// Instantiate empty grapple
grapple			= noone;
grapple_weight	= GrappleWeight.Neutral;

// Instantiate empty sword
sword = noone;

attack_time		= 20;
attack_timer	= attack_time;

projectile_offset = 6;

projectile_max		= 3;
projectile_count	= projectile_max;
projectile_time		= 100;
projectile_timer	= projectile_time;

function handle_sprite_by_state() {
	switch player_state {
		case PlayerState.Idle:
			switch player_direction {
				case PlayerDirection.Down:
					sprite_index = spr_player_idle_down;
					break;
				case PlayerDirection.Up:
					sprite_index = spr_player_idle_up;
					break;
				case PlayerDirection.Left:
					sprite_index = spr_player_idle_left;
					break;
				case PlayerDirection.Right:
					sprite_index = spr_player_idle_right;
					break;
			}
			break;
		case PlayerState.Move:
			switch player_direction {
				case PlayerDirection.Down:
					sprite_index = spr_player_walk_down;
					break;
				case PlayerDirection.Up:
					sprite_index = spr_player_walk_up;
					break;
				case PlayerDirection.Left:
					sprite_index = spr_player_walk_left;
					break;
				case PlayerDirection.Right:
					sprite_index = spr_player_walk_right;
					break;
			}
			break;
		case PlayerState.Jump:
		case PlayerState.Prejump:
		case PlayerState.Postjump:
			sprite_index = spr_player_jumpattack;
			break;
		case PlayerState.Attack:
			switch player_direction {
				case PlayerDirection.Down:
					sprite_index = spr_player_attack_down;
					break;
				case PlayerDirection.Up:
					sprite_index = spr_player_attack_up;
					break;
				case PlayerDirection.Left:
					sprite_index = spr_player_attack_left;
					break;
				case PlayerDirection.Right:
					sprite_index = spr_player_attack_right;
					break;
			}
			break;
		case PlayerState.Grapple:
			//sprite_index = spr_player_grappling;
			break;
	}
}

// Inherit the parent event
event_inherited();

function normalize_move_by_state() {
	switch player_state {
		case PlayerState.Idle:
		case PlayerState.Move:
			cur_v = normal_cap_v2(cur_v, sp);
			break;
		case PlayerState.Grapple:
		case PlayerState.Attack:
			cur_v = normal_cap_v2(cur_v, special_speed_cap);
			break;
		case PlayerState.Jump:
			cur_v = normal_cap_v2(cur_v, jump_speed_cap);
			break;
	}
}

max_hp	= 6;
hp		= max_hp;
id.sp	= 3; // speed modifier

// jump attack values
jump_attack		= noone;
held_v			= new Vector2(0, 0);
jump_exp		= 1.5;
jump_max_height	= 200;
jump_time		= 40;
jump_timer		= 0;
jump_max_speed	= ((2 * jump_exp + 2) * jump_max_height) / jump_time;
jump_speed_cap	= 5;
jump_cd_time	= 200;
jump_cd_timer	= 0;