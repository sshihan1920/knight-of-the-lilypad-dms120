/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 11CB9187
/// @DnDArgument : "font" "fn_story"
/// @DnDSaveInfo : "font" "fn_story"
draw_set_font(fn_story);

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 683D11D2
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)draw_set_halign(fa_center);$(13_10)draw_set_color(c_white);$(13_10)draw_text_transformed(room_width/2, room_height/2, $(13_10)"The Lilypad Kingdom was once a tranquil home to many,\r however all of that changed when a new evil fell, \r it spread and infected the minds of Lilypadders, \r now it is up to Sir Leapslaot of the Webbed Table to save the kingdom and princess \r\r press enter to continue", 2, 2, 0);$(13_10)"
/// @description Execute Code
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(room_width/2, room_height/2, 
"The Lilypad Kingdom was once a tranquil home to many,\r however all of that changed when a new evil fell, \r it spread and infected the minds of Lilypadders, \r now it is up to Sir Leapslaot of the Webbed Table to save the kingdom and princess \r\r press enter to continue", 2, 2, 0);