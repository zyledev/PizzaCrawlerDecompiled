function enemynormal() //enemynormal
{
    if alarm_get(0) <= 0
        alarm_set(0, 60)
    if !place_meeting((x + hsp), y, obj_solid)
        x += hsp
    else
        hsp = irandom_range((-movespeed), movespeed)
    if !place_meeting(x, (y + vsp), obj_solid)
        y += vsp
    else
        vsp = irandom_range(-movespeed, movespeed)
    if hsp < 0 && vsp == 0
        sprite_index = spr_moveleft
    else if hsp > 0 && vsp == 0
        sprite_index = spr_moveright
    else if vsp < 0
        sprite_index = spr_moveup
    else if vsp > 0
        sprite_index = spr_movedown
    if object_index != obj_cheeseslime
    {
        if distance_to_object(instance_nearest(x, y, obj_player)) < 20 && attackcooldown < 0 && instance_nearest(x, y, obj_player).state != states.actor && instance_nearest(x, y, obj_player).state != states.cutscene && instance_nearest(x, y, obj_player).state != states.hurt
        {
            image_index = 1
            if currentdirection == curdir.up
                sprite_index = spr_attackup
            else if currentdirection == curdir.upright
                sprite_index = spr_attackupright
            else if currentdirection == curdir.right
                sprite_index = spr_attackright
            else if currentdirection == curdir.downright
                sprite_index = spr_attackdownright
            else if currentdirection == curdir.down
                sprite_index = spr_attackdown
            else if currentdirection == curdir.downleft
                sprite_index = spr_attackdownleft
            else if currentdirection == curdir.left
                sprite_index = spr_attackleft
            else if currentdirection == curdir.upleft
                sprite_index = spr_attackupleft
            state = enemystates.attack
            attackbuffer = 30
        }
    }
}

function enemyplayerchase() //enemyplayerchase
{
    if instance_nearest(x, y, obj_player).state == states.actor || instance_nearest(x, y, obj_player).state == states.hurt || instance_nearest(x, y, obj_player).state != states.cutscene
    {
        sprite_index = spr_idle
        hsp = 0
        vsp = 0
        currentdirection = curdir.down
        state = states.normal
    }
    if instance_nearest(x, y, obj_player).x > x && instance_nearest(x, y, obj_player).y == y
    {
        sprite_index = spr_chaseright
        hsp = 2
        vsp = 0
        currentdirection = curdir.right
    }
    else if instance_nearest(x, y, obj_player).x > x && instance_nearest(x, y, obj_player).y > y
    {
        sprite_index = spr_chasedownright
        hsp = 2
        vsp = 2
        currentdirection = curdir.downright
    }
    else if instance_nearest(x, y, obj_player).x > x && instance_nearest(x, y, obj_player).y < y
    {
        sprite_index = spr_chaseupright
        hsp = 2
        vsp = -2
        currentdirection = curdir.upright
    }
    else if instance_nearest(x, y, obj_player).x < x && instance_nearest(x, y, obj_player).y == y
    {
        sprite_index = spr_chaseleft
        hsp = -2
        vsp = 0
        currentdirection = curdir.left
    }
    else if instance_nearest(x, y, obj_player).x < x && instance_nearest(x, y, obj_player).y > y
    {
        sprite_index = spr_chasedownleft
        hsp = -2
        vsp = 2
        currentdirection = curdir.downleft
    }
    else if instance_nearest(x, y, obj_player).x < x && instance_nearest(x, y, obj_player).y < y
    {
        sprite_index = spr_chaseupleft
        hsp = -2
        vsp = -2
        currentdirection = curdir.upleft
    }
    else if instance_nearest(x, y, obj_player).x == x && instance_nearest(x, y, obj_player).y > y
    {
        sprite_index = spr_chasedown
        hsp = 0
        vsp = 2
        currentdirection = curdir.down
    }
    else if instance_nearest(x, y, obj_player).x == x && instance_nearest(x, y, obj_player).y < y
    {
        sprite_index = spr_chaseup
        hsp = 0
        vsp = -2
        currentdirection = curdir.up
    }
    else if instance_nearest(x, y, obj_player).x == x && instance_nearest(x, y, obj_player).y == y
    {
        sprite_index = spr_idle
        hsp = 0
        vsp = 0
        currentdirection = curdir.down
    }
    else
    {
        sprite_index = spr_idle
        hsp = 0
        vsp = 0
        currentdirection = curdir.down
        state = enemystates.normal
    }
    if distance_to_object(instance_nearest(x, y, obj_player)) < 20 && attackcooldown < 0 && instance_nearest(x, y, obj_player).state != states.actor && instance_nearest(x, y, obj_player).state != states.cutscene
    {
        image_index = 1
        if currentdirection == curdir.up
            sprite_index = spr_attackup
        else if currentdirection == curdir.upright
            sprite_index = spr_attackupright
        else if currentdirection == curdir.right
            sprite_index = spr_attackright
        else if currentdirection == curdir.downright
            sprite_index = spr_attackdownright
        else if currentdirection == curdir.down
            sprite_index = spr_attackdown
        else if currentdirection == curdir.downleft
            sprite_index = spr_attackdownleft
        else if currentdirection == curdir.left
            sprite_index = spr_attackleft
        else if currentdirection == curdir.upleft
            sprite_index = spr_attackupleft
        state = enemystates.attack
        attackbuffer = 30
    }
    else if distance_to_object(instance_nearest(x, y, obj_player)) > 180
    {
        sprite_index = spr_idle
        hsp = 0
        vsp = 0
        currentdirection = curdir.down
        state = enemystates.normal
    }
}

function enemyattack() //enemyattack
{
    hsp = 0
    vsp = 0
    if attackbuffer <= 0
    {
        attacking = true
        image_index = 2
    }
    else
        image_index = 1
    attackbuffer--
    if attackbuffer <= -3
    {
        attackbuffer = 30
        attacking = false
        attackcooldown = 60
        sprite_index = spr_idle
        state = enemystates.normal
    }
}

function enemycontrolled() //enemycontrolled
{
    scr_getinput()
    if (keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0) && (!keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && (!keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0) && (!keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0)
    {
        sprite_index = spr_moveright
        currentdirection = curdir.right
        hsp = 2
    }
    else if (keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && (!keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0) && (!keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0) && (!keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0)
    {
        sprite_index = spr_moveleft
        currentdirection = curdir.left
        hsp = -2
    }
    else if (keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0) && (!keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && (!keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0) && (!keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0)
    {
        sprite_index = spr_moveup
        currentdirection = curdir.up
        vsp = -2
    }
    else if (keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0) && (!keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && (!keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0) && (!keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0)
    {
        sprite_index = spr_movedown
        currentdirection = curdir.down
        vsp = 2
    }
    else
    {
        vsp = 0
        hsp = 0
    }
    switch object_index
    {
        case obj_mrsock:
            if (keyboard_check(key_punch) || gamepad_button_check(playernum, gp_face1)) && !global.pausedisable && attackcooldown <= 0
            {
                hsp = 0
                vsp = 0
                if currentdirection == curdir.up
                    sprite_index = spr_attackup
                else if currentdirection == curdir.upright
                    sprite_index = spr_attackupright
                else if currentdirection == curdir.right
                    sprite_index = spr_attackright
                else if currentdirection == curdir.downright
                    sprite_index = spr_attackdownright
                else if currentdirection == curdir.down
                    sprite_index = spr_attackdown
                else if currentdirection == curdir.downleft
                    sprite_index = spr_attackdownleft
                else if currentdirection == curdir.left
                    sprite_index = spr_attackleft
                else if currentdirection == curdir.upleft
                    sprite_index = spr_attackupleft
            }
            if sprite_index == spr_attackup || sprite_index == spr_attackdown || sprite_index == spr_attackleft || sprite_index == spr_attackright
            {
                attacking = true
                if floor(image_index) == (image_number - 1)
                {
                    attacking = false
                    attackcooldown = 180
                }
            }
            break
    }

}

