if (!variable_instance_exists(id, "origin")) origin	= noone;
if (!variable_instance_exists(id, "offset")) offset = new Vector2(0, 0);

audio_play_sound(snd_attack, 4, false);