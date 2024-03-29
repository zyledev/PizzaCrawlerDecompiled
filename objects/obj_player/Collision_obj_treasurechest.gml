if keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2) && !global.pausedisable2 && state == states.normal
{
    if !other.gavepoints
    {
        state = states.actor
        sprite_index = spr_peace
        if !audio_is_playing(sfx_keygot)
            audio_play_sound(sfx_keygot, 3, false)
        switch other.collectablenum
        {
            case 1:
                global.collectable1 = true
                if sprite_index == spr_peace
                    draw_sprite(spr_collectable1, -1, x, (y - 10))
                break
            case 2:
                global.collectable2 = true
                if sprite_index == spr_peace
                    draw_sprite(spr_collectable2, -1, x, y)
                break
            case 3:
                global.collectable3 = true
                if sprite_index == spr_peace
                    draw_sprite(spr_collectable3, -1, x, y)
                break
            case 4:
                global.collectable4 = true
                if sprite_index == spr_peace
                    draw_sprite(spr_collectable4, -1, x, y)
                break
            case 5:
                global.collectable5 = true
                if sprite_index == spr_peace
                    draw_sprite(spr_collectable5, -1, x, y)
                break
        }

        with other
        {
            if sprite_index != spr_open
                sprite_index = spr_open
        }
    }
}
