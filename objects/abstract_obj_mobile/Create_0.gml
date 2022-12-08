nmove_v = new Vector2(0, 0);
move_v	= new Vector2(0, 0);
prev_v	= new Vector2(0, 0);
cur_v	= new Vector2(0, 0);
mod_v	= new Vector2(0, 0);

interp_mod			= 0.1;
interp_degrade_rate = 0.05;
interp_const		= 0.1; // 'slippery' factor

/*	
Standard rotation duration (rotation with a change in magnitude of 1) occurs
	over 10 frames (step_val of 0.1)
Rotation duration increases both as the step_val increases and with greater
	magnitude differences
Change magnitude is calculated by as strict vector difference, not by arclength
	of the rotation (makes opposite directional changes feel better) 
*/

special_speed_cap	= 5; // speed cap for special states
step_val			= 0.1; // time value of a frame
time_scale			= 0; // rotation duration
//max_time_scale	= 10;
time				= 0; // time value of the current frame
sp					= 1; // speed modifier

function calc_new_move_vector() {
	nmove_v = add_v2(nmove_v, mod_v);
	if (!equals_v2(nmove_v, move_v)) {
		move_v = nmove_v;
		//if (time_scale == 0)
		prev_v = cur_v;
		var new_scale = magnitude_v2(subtract_v2(move_v, prev_v)) * interp_mod;
		time = 0;//time_scale == 0 ? 0 : new_scale * (time / time_scale);
		time_scale = new_scale;
		/*if time_scale - time < scale_increase
			time_scale += scale_increase - (time_scale - time);
		//time_scale = min(time_scale, max_time_scale);
		//time_scale = time + scale_increase;*/
	}
	if (time == time_scale) {
		time = 0;
		time_scale = 0;
	}
	time = min(time + step_val, time_scale);
	cur_v = interpolate_rot_v2(prev_v, move_v, time, time_scale);
}

function halt() {
	nmove_v = new Vector2(0, 0);
	move_v	= new Vector2(0, 0);
	prev_v	= new Vector2(0, 0);
	cur_v	= new Vector2(0, 0);
	mod_v	= new Vector2(0, 0);
}

collidable = true;

function handle_collision_push(obj_type) {
	var buffer = 1000;
	var collision_list = ds_list_create();
	if (!place_meeting(x, y, obj_type)) return;
	while(buffer > 0) {
		buffer--;
		var collided_obj = instance_place(x, y, obj_type);
		if (instance_exists(collided_obj) && ds_list_find_index(collision_list, collided_obj) == -1) {
			ds_list_add(collision_list, collided_obj);
		} else {
			break;	
		}
		if (variable_instance_exists(collided_obj, "collidable") && !collided_obj.collidable) {
			continue;
		}
		if (instance_exists(collided_obj)) {
			var push_v = new Vector2(x - collided_obj.x, y - collided_obj.y);
			while(place_meeting(x, y, collided_obj)) {
				if (zero_v2(push_v)) {
					x = x + 1;
					y = y + 1;
					break;
				}
				x = x + sign(push_v.x);
				y = y + sign(push_v.y);
			}
		} else {
			break;
		}
	}
	ds_list_clear(collision_list);
}

function handle_collision_x(obj_type, v) {
	if (place_meeting(x + v.x, y, obj_type)) {
		for (i = 0; i < abs(v.x) && !place_meeting(x + sign(v.x), y, obj_type); i++) {
			x = x + sign(v.x);	
		}
		return true;
	}
	return false;
}
	
function handle_collision_y(obj_type, v) {
	if (place_meeting(x, y + v.y, obj_type)) {
		for (i = 0; i < abs(v.y) && !place_meeting(x, y + sign(v.y), obj_type); i++) {
			y = y + sign(v.y);
		}
		return true;
	}
	return false;
}


function normalize_move_by_state() {}

// knockback handling
function knockback(vector, scale) {
	knockbacked = true;
	kb_vector	= vector;
	kb_scale	= scale;
	kb_timer	= 0;
	
	kb_rscale	= (kb_scale + kb_pscale)/2
}

knockbacked = false;
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

event_inherited();