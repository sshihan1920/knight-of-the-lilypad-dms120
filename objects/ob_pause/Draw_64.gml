/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 0697488D
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)if (pause == true) {$(13_10)	draw_set_color(c_black);$(13_10)	draw_set_alpha(0.6);$(13_10)	draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0], 0);$(13_10)$(13_10)	draw_set_font(fn_story);$(13_10)	draw_set_color(c_white);$(13_10)	draw_set_alpha(1);$(13_10)	draw_set_halign(fa_center);$(13_10)	draw_text(view_wport[0]/2, view_hport[0]/2, "Paused");$(13_10)}"
/// @description Execute Code
if (pause == true) {
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0], 0);

	draw_set_font(fn_story);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_text(view_wport[0]/2, view_hport[0]/2, "Paused");
}