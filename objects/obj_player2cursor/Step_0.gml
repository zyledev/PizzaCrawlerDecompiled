scr_getinput()
if (keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && !global.pausedisable2 && baddiechangecooldown <= 0
{
    with global.selectedcontrol
    {
        other.controlledid = id
        state = states.hurt
    }
}
if controlledid != noone && (keyboard_check(key_mach) || gamepad_button_check(playernum, gp_shoulderr))
{
    with controlledid
    {
        state = states.normal
        other.controlledid = noone
    }
}
if controlledid != noone && !instance_exists(controlledid)
    controlledid = -4
if instance_exists(obj_enemy)
{
    with obj_enemy
    {
        if state == states.hurt
            other.baddiechangecooldown = 500
    }
}
