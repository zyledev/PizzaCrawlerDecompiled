if (keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && (!global.pausedisable2) && (!menu) && cooldown <= 0
{
    set_state(states.actor)
    inputcooldown = 60
    cooldown = 60
    menu = 1
}
