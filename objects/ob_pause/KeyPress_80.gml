/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7C2770A6
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)if (pause == false) {$(13_10)pause = true;$(13_10)instance_deactivate_all(true)$(13_10)}$(13_10)else {$(13_10)pause = false;$(13_10)instance_activate_all()$(13_10)}"
/// @description Execute Code
if (pause == false) {
pause = true;
instance_deactivate_all(true)
}
else {
pause = false;
instance_activate_all()
}