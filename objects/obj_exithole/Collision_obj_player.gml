if global.panic
{
    playernum = other.playernum
    if (keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && !global.pausedisable2 && room != rm_playtest
    {
        global.panic = false
        instance_create(x, y, obj_rank)
    }
    else if (keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && !global.pausedisable2
    {
        global.panic = false
        instance_create(x, y, obj_rank)
    }
}
