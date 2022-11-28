var a = sqr(target.x - x) + sqr(target.y - y);
var b = 2 * (target.x - x) * (x - target.x) + 2 * (target.y - y) * (y - target.y);
var c = sqr(x - target.x) + sqr(y - target.y) - sqr(ranged_pathing_radius);
var	t = (-b - sqrt(sqr(b) - 4 * a * c)) / (2 * a);
	
var intersect_x = (target.x - x) * t + x;
var intersect_y = (target.y - y) * t + y;
var in_radius	= point_distance(x, y, target.x, target.y) < ranged_pathing_radius;
	
if (point_distance(x, y, intersect_x, intersect_y) > ranged_pathing_radius/4 || place_meeting(x + move_v.x, y + move_v.y, abstract_obj_grappleable)) {
	if (!in_radius) {
		mp_potential_path_object(path, target.x, target.y, 1, 4, abstract_obj_grappleable);
		var path_point = path_get_number(path) - 1;
		nmove_v = scale_v2(unit_v2(new Vector2(path_get_point_x(path, path_point) - x, path_get_point_y(path, path_point) - y)), sp);
		while(place_meeting(x + nmove_v.x, y + nmove_v.y, abstract_obj_grappleable) && path_point >= 1) {
			nmove_v = scale_v2(unit_v2(new Vector2(path_get_point_x(path, path_point) - x, path_get_point_y(path, path_point) - y)), sp);
			path_point--;
		}
	} else {
		mp_potential_path_object(path, x + (x - target.x), y + (y - target.y), 1, 4, abstract_obj_grappleable);
		var path_point = path_get_number(path) - 1;
		nmove_v = scale_v2(unit_v2(new Vector2(path_get_point_x(path, path_point) - x, path_get_point_y(path, path_point) - y)), sp);
		while(place_meeting(x + nmove_v.x, y + nmove_v.y, abstract_obj_grappleable) && path_point >= 1) {
			nmove_v = scale_v2(unit_v2(new Vector2(path_get_point_x(path, path_point) - x, path_get_point_y(path, path_point) - y)), sp);
			path_point--;
		}
	}
} else if (zero_v2(move_v)){
	var path_point = path_get_number(path) - 1;
	nmove_v = scale_v2(unit_v2(new Vector2(path_get_point_x(path, path_point) - x, path_get_point_y(path, path_point) - y)), sp);
	while(place_meeting(x + nmove_v.x, y + nmove_v.y, abstract_obj_grappleable)) {
		nmove_v = scale_v2(unit_v2(new Vector2(path_get_point_x(path, path_point) - x, path_get_point_y(path, path_point) - y)), sp);
		path_point--;
	}
} else {
	nmove_v = move_v;	
}