max_view_x = (room_width - camera_get_view_width(view_camera[0]))
max_view_y = (room_height - camera_get_view_height(view_camera[0]))
if (follow != noone && instance_exists(follow))
{
    xTo = follow.x
    yTo = follow.y
}
x += ((xTo - x) / 5)
y += ((yTo - y) / 5)
camera_set_view_pos(view_camera[0], (x - (camWidth * 0.5)), (y - (camHeight * 0.5)))
var _gridwidth = to_tile(room_width)
var _gridheight = to_tile(room_height)
global.AIgrid = mp_grid_create(0, 0, _gridwidth, _gridheight, 32, 32)
mp_grid_add_instances(global.AIgrid, obj_solid, 0)
if !createdcameras
{
    CreateCameras()
    createdcameras = 1
}
global.controllerinputcooldown--
if follow == obj_exithole
{
    anchor1timer--
    if anchor1timer <= 0
    {
        follow = obj_player
        obj_player.state = states.normal
        if global.coop
            obj_player2.state = states.normal
    }
}
if global.panic
{
    if fill > 0
        fill -= 0.2
    if fill <= 0 && obj_player.hp > 0
        obj_player.hp -= 0.016666666666666666
}
if follow != obj_player && global.coop
    follow = obj_player
if global.panic
    shakevalue = 0.3
