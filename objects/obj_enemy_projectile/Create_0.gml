if (!variable_instance_exists(id, "move_v")) move_v = new Vector2(0, 0);
if (!variable_instance_exists(id, "origin")) origin = noone;

sp = 10
move_v = scale_v2(move_v, sp)

audio_play_sound(snd_slime, 4, false);