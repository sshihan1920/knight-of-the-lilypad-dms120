/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 7792ABBD
/// @DnDArgument : "font" "fn_start_menu"
/// @DnDSaveInfo : "font" "fn_start_menu"
draw_set_font(fn_start_menu);

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4BEE98DB
/// @DnDArgument : "code" "/// @description Insert description here$(13_10)draw_set_halign(fa_center);$(13_10)draw_set_color(c_white);$(13_10)draw_text_transformed(room_width/2, room_height/2, $(13_10)"Knight of the LilyPad \r\r Press enter to begin", 2, 2, 0);$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)"
/// @description Insert description here
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(room_width/2, room_height/2, 
"Knight of the LilyPad \r\r Press enter to begin", 2, 2, 0);