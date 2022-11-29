if (timer == 0) {
	timer = time;
	instance_create_layer(x, y, "Instances", instance_type);
}

timer--;