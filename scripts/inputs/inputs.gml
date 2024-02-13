function scr_initinput() //scr_initinput
{
    ini_open("settings.ini")
    global.key_up = ini_read_string("Controls", "up", vk_up)
    global.key_down = ini_read_string("Controls", "down", vk_down)
    global.key_right = ini_read_string("Controls", "right", vk_right)
    global.key_left = ini_read_string("Controls", "left", vk_left)
    global.key_mach = ini_read_string("Controls", "mach", vk_shift)
    global.key_punch = ini_read_string("Controls", "punch", ord("Z"))
    global.key_interact = ini_read_string("Controls", "interact", ord("X"))
    global.key_up2 = ini_read_string("ControlsP2", "up", ord("W"))
    global.key_down2 = ini_read_string("ControlsP2", "down", ord("S"))
    global.key_right2 = ini_read_string("ControlsP2", "right", ord("D"))
    global.key_left2 = ini_read_string("ControlsP2", "left", ord("A"))
    global.key_mach2 = ini_read_string("ControlsP2", "mach", ord("J"))
    global.key_punch2 = ini_read_string("ControlsP2", "punch", ord("K"))
    global.key_interact2 = ini_read_string("ControlsP2", "interact", ord("L"))
    ini_close()
}

function scr_getinput() //scr_getinput
{
    if object_index == obj_player
    {
        key_up = global.key_up
        key_down = global.key_down
        key_right = global.key_right
        key_left = global.key_left
        key_mach = global.key_mach
        key_punch = global.key_punch
        key_interact = global.key_interact
    }
    else if object_index == obj_player2 || object_index == obj_player2cursor || object_index == obj_enemy
    {
        key_up = global.key_up2
        key_down = global.key_down2
        key_right = global.key_right2
        key_left = global.key_left2
        key_mach = global.key_mach2
        key_punch = global.key_punch2
        key_interact = global.key_interact2
    }
    else
    {
        if instance_exists(obj_player)
            playernum = obj_player.playernum
        key_up = global.key_up
        key_down = global.key_down
        key_right = global.key_right
        key_left = global.key_left
        key_mach = global.key_mach
        key_punch = global.key_punch
        key_interact = global.key_interact
    }
}

