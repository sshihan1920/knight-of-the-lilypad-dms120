event_inherited();

if (!variable_instance_exists(id, "origin")) origin = noone;

function on_hit(obj) {
	obj.stun(100);
	obj.knockback(unit_v2(new Vector2(obj.x - origin.x, obj.y - origin.y)), 2);
	obj.hp--;	
}

image_xscale = 4;
image_yscale = 4;