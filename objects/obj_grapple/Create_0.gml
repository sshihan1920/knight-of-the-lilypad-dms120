if (!variable_instance_exists(id, "follow_target")) follow_target = noone;
if (!variable_instance_exists(id, "target")) target	= noone;
if (!variable_instance_exists(id, "origin")) origin	= noone;

retracting = false;
distance_const = sprite_half_size * 2;

move_time = 5;
move_timer = move_time;

grapple_distance_scale = 0;
grapple_sp = 10;
grapple_offset = 6;
grapple_max_distance = 300;

event_inherited();

interp_mod = 0.05;
interp_const = 0.05;
step_val = 0.25;
sp = 15;

audio_play_sound(snd_grapple, 4, false);