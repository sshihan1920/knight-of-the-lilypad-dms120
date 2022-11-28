if (shake) 
{ 
   shake_time -= 1; 
   var _xval = camera_get_view_x(view_camera[0]) + choose(-shake_magnitude, shake_magnitude); 
   var _yval = camera_get_view_y(view_camera[0]) + choose(-shake_magnitude, shake_magnitude); 
   camera_set_view_pos(view_camera[0], _xval, _yval); 

   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade; 

      if (shake_magnitude <= 0) 
      { 
         camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])); 
         shake = false; 
      } 
   } 
}