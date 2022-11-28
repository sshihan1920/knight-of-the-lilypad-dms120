enum EnemyState {
	Idle,
	Move,
	Attack,
	Special,
}

enum EnemyDirection {
	Left,
	Right,
}

dormant = true;

enemy_state = EnemyState.Idle;
enemy_direction = EnemyDirection.Left;

hp = 2;

event_inherited();

grapple_weight = GrappleWeight.Neutral;

function normalize_move_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
		case EnemyState.Move:
			cur_v = normal_cap_v2(cur_v, sp);
			break;
		case EnemyState.Attack:
		case EnemyState.Special:
			cur_v = normal_cap_v2(cur_v, special_speed_cap);
			break;
	}
}

// stun handling
function stun(frame_duration) {
	st_timer = frame_duration;
	stunned = true;
}

stunned	= false;
st_timer = 0;

track_target = noone;
target = noone;