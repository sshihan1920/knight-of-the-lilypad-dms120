enum EnemyState {
	Idle,
	Move,
	Attack,
	Special,
	Knockback,
}

enum EnemyDirection {
	Left,
	Right,
}

enemy_state = EnemyState.Idle;
enemy_direction = EnemyDirection.Left;

hp = 2;

event_inherited();

id.grapple_weight = GrappleWeight.Neutral;

function normalize_move_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
		case EnemyState.Move:
		case EnemyState.Knockback:
			cur_v = normal_cap_v2(cur_v, sp);
			break;
		case EnemyState.Attack:
		case EnemyState.Special:
			cur_v = normal_cap_v2(cur_v, special_speed_cap);
			break;
	}
}

// knockback handling
function knockback(vector, scale) {
	enemy_state = EnemyState.Knockback;
	kb_vector	= vector;
	kb_scale	= scale;
	kb_timer	= 0;
	
	kb_rscale	= (kb_scale + kb_pscale)/2
}

kb_exp		= 2;
kb_max_sp	= 5;
kb_time		= 20;
kb_timer	= 0;
kb_vector	= new Vector2(0, 0);
// scale for different knockback intensity
kb_scale	= 1;
// pscale for scaling by enemy types 
kb_pscale	= 1;
kb_rscale	= 0;