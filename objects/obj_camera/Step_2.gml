halfviewwidth = (camera_get_view_width(view_camera[0]) / 2)
halfviewheight = (camera_get_view_height(view_camera[0]) / 2)
cx = (x - halfviewwidth)
cy = (y - halfviewheight)
cx = clamp(cx, min_view_x, max_view_x)
cy = clamp(cy, min_view_y, max_view_y)
camera_set_view_pos(view_camera[0], cx, cy)
var camx = camera_get_view_x(view_camera[0])
var camy = camera_get_view_y(view_camera[0])
var camw = camera_get_view_width(view_camera[0])
var camh = camera_get_view_height(view_camera[0])
var camx2 = camera_get_view_x(view_camera[1])
var camy2 = camera_get_view_y(view_camera[1])
var camw2 = camera_get_view_width(view_camera[1])
var camh2 = camera_get_view_height(view_camera[1])
var shake = (power(shakevalue, 2) * shakepower)
camx += random_range((-shake), shake)
camy += random_range((-shake), shake)
camx2 += random_range((-shake), shake)
camy2 += random_range((-shake), shake)
camera_set_view_pos(view_camera[0], camx, camy)
camera_set_view_size(view_camera[0], camw, camh)
camera_set_view_angle(view_camera[0], random_range(-shake, shake) * 0.5)
camera_set_view_pos(view_camera[1], camx2, camy2)
camera_set_view_size(view_camera[1], camw2, camh2)
camera_set_view_angle(view_camera[1], random_range(-shake, shake) * 0.5)
if shakevalue > 0
    shakevalue -= 0.1
