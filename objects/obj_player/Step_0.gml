scr_getinput()
if global.pausedisable && gamepad_button_check_released(playernum, gp_face1)
    global.pausedisable = false
if global.pausedisable2 && gamepad_button_check_released(playernum, gp_face2)
    global.pausedisable2 = false
palselect = scr_overflow(palselect, 1, sprite_get_width(spr_pal) - 1)
if !palgenerated || palselect != prevpalselect
{
    palarray = scr_paltoarr(spr_pal, palselect)
    show_debug_message(palarray)
    palgenerated = true
    prevpalselect = palselect
}
switch state
{
    case states.normal: // 0
        scr_player_normal()
        break
    case states.mach: // 1
        scr_player_mach()
        break
    case states.actor: // 2
        scr_player_actor()
        break
    case states.punch: // 3
        scr_player_punch()
        break
    case states.hurt: // 4
        scr_player_hurt()
        break
    case states.cutscene: // 5
        scr_player_cutscene()
        break
    case states.empty: // 7
        break
    case states.noclip: // 8
        if keyboard_check(vk_up)
            y -= 5
        if keyboard_check(vk_down)
            y += 5
        if keyboard_check(vk_right)
            x += 5
        if keyboard_check(vk_left)
            x -= 5
        sprite_index = spr_idle
        break
}

var _right = keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0
var _left = keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0
var _up = keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0
var _down = keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0
if !inputlocked
{
    var _xinput = (_right - _left)
    var _yinput = (_down - _up)
}
if global.classicmode
{
    if !inputlocked
    {
        if _xinput != 0
        {
            if !place_meeting(x + (32 * _xinput), y, obj_solid)
            {
                inputlocked = true
                x += (32 * _xinput)
                alarm_set(0, 20)
            }
        }
        if _yinput != 0
        {
            if !place_meeting(x, y + (32 * _yinput), obj_solid)
            {
                inputlocked = true
                y += (32 * _yinput)
                alarm_set(0, 20)
            }
        }
    }
}
else
    move_and_collide(_xinput * movespeed, _yinput * movespeed, obj_solid)
if keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2) && !global.pausedisable2 && state != states.actor
{
    if object_index == obj_player
    {
        if !instance_exists(obj_interacthitbox)
            instance_create_layer(x, y, "Instances", obj_interacthitbox)
    }
    else if !instance_exists(obj_interacthitboxp2)
        instance_create_layer(x, y, "Instances", obj_interacthitboxp2)
}
if keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(playernum, gp_start) && !instance_exists(obj_pause)
{
    if room == rm_playtest && obj_editor.playtest < 2
        scr_exitplaytest()
    else
        instance_create_layer(x, y, "Instances", obj_pause)
}
if stamina > maxstamina
    stamina = maxstamina
if stamina < 0
    stamina = 0
if playerhp > 3
    playerhp = 3
if state == states.mach || state == states.punch
{
    if stamina <= 0
        state = states.normal
    stamina -= 0.1
}
else
    stamina += 0.4
if hp > maxhp
    hp = maxhp
if hp < 0
    hp = 0
if object_index == obj_player2
    playernum = (obj_player.playernum + 1)
if keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0
    leftpress = true
else
    leftpress = false
if keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0
    rightpress = true
else
    rightpress = false
if keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0
    downpress = true
else
    downpress = false
if keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0
    uppress = true
else
    uppress = false
if hp <= 0 && !global.coop && state != states.actor
{
    movespeed = 0
    visible = false
    with instance_create_layer(x, y, "Instances", obj_lock_dead)
    {
        sprite_index = obj_player.spr_dead
        image_index = 0
    }
    state = states.actor
}
else if global.coop && hp <= 0 && state != states.actor
{
    movespeed = 0
    sprite_index = spr_sleep
    state = states.actor
}
palswapcooldown--
if palselect == 0
    palselect = 1
if instance_exists(obj_camera)
{
    if obj_camera.follow != obj_player
        state = states.actor
}
if global.cheeseslimemode
    maxhp = 1
if !place_meeting(x, y, obj_shoparea)
    global.useshoptheme = false
if state == states.cutscene && !audio_is_playing(sfx_keygot) && sprite_index == spr_gustavo_treasure
{
    movespeed = 2
    state = states.normal
}
if object_index == obj_player2
    palselect = 1
if ishubroom()
    stamina = 20
if room == rm_levelselect
    state = states.actor
if invincibility
    image_alpha = 0.5
iframes--
if iframes <= 0
    invincibility = 0
if global.coop
{
    if instance_exists(obj_player2)
    {
        if obj_player2.sprite_index == obj_player2.spr_sleep && obj_player.sprite_index == obj_player.spr_sleep
        {
            if !dead
            {
                obj_player.visible = false
                obj_player2.visible = false
                with instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_lock_dead)
                {
                    sprite_index = obj_player.spr_dead
                    image_index = 0
                }
                with instance_create_layer(obj_player2.x, obj_player2.y, "Instances", obj_lock_dead)
                {
                    sprite_index = obj_player2.spr_dead
                    image_index = 0
                }
                dead = true
            }
        }
    }
}
alldepthset()
if firetran
    palselect = 9
if global.debug
{
    if keyboard_check_released(vk_f5) && state != states.noclip
        state = states.noclip
    else if keyboard_check_released(vk_f5) && state == states.noclip
        state = states.normal
}
if keyboard_check(vk_f10)
    global.debug = true
