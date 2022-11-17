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
cursor = instance_create_layer(x, y, "cursor", obj_cursor,
{
	follow_target : instance_create_layer(x, y, "cursor", obj_mouse)
});
// Instantiate empty grapple
grapple			= noone;
grapple_weight	= GrappleWeight.Neutral;

// Instantiate empty sword
sword = noone;

function handle_sprite_by_state() {
	switch player_state {
		case PlayerState.Idle:
			switch player_direction {
				case PlayerDirection.Down:
					sprite_index = spr_player_idol_down;
					break;
				case PlayerDirection.Up:
					sprite_index = spr_player_idol_up;
					break;
				case PlayerDirection.Left:
					sprite_index = spr_player_idol_left;
					break;
				case PlayerDirection.Right:
					sprite_index = spr_player_idol_right;
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
			//sprite_index = spr_player_attacking;
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

hp		= 6;
id.sp	= 5; // speed modifier

// jump attack values
held_v			= new Vector2(0, 0);
jump_exp		= 1.5;
jump_max_height	= 200;
jump_time		= 40;
jump_timer		= 0;
jump_max_speed	= ((2 * jump_exp + 2) * jump_max_height) / jump_time;
jump_speed_cap	= 5;