global.classicmode = false
global.font = font_add_sprite_ext(spr_fnt_crawlerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?()#1234567890:@-_.abcdefghijklmnopqrstuvwxyz", 0, -18)
global.timerfont = font_add_sprite_ext(spr_fnt_timer_font, "1234567890:", 0, -21)
function play_music(mus) //play_music
{
    if !audio_is_playing(mus)
    {
        if mus == mus_shop && room == rm_playtest
        {
            if obj_editor.player
                audio_pause_sound(obj_editor.player)
            else
                audio_pause_all()
        }
        else if mus == mus_shop && object_index == obj_music
        {
            if music
                audio_pause_sound(music)
            else
            {
                audio_pause_all()
                audio_resume_sound(sfx_walk)
                audio_resume_sound(sfx_run)
            }
        }
        else
            audio_stop_all()
        if argument0 == mus_editor
            audio_play_sound(argument0, 5, true, 0.5)
        else
            audio_play_sound(argument0, 5, true)
    }
}

function play_sound(argument0) //play_sound
{
    audio_play_sound(argument0, 3, false)
}

function play_sound_unique(argument0) //play_sound_unique
{
    if !audio_is_playing(argument0)
        play_sound(argument0)
}

function instance_create(argument0, argument1, argument2) //instance_create
{
    instance_create_layer(argument0, argument1, "Instances", argument2)
}

function instance_create_unique(argument0, argument1, argument2) //instance_create_unique
{
    if !instance_exists(argument2)
        instance_create_layer(argument0, argument1, "Instances", argument2)
}

function ishubroom() //ishubroom
{
    if room == rm_hub1 || room == rm_hub_1 || room == Tutorial_1 || room == rm_levelselect || room == rm_credits || room == rm_hub_lounge
        return true;
    else
        return false;
}

function globalplayerreset() //globalplayerreset
{
    if instance_exists(obj_player)
    {
        with obj_player
            player_reset()
        if global.coop && instance_exists(obj_player2)
        {
            with obj_player2
                player_reset()
        }
    }
}

function depthset(ind) //depthset
{
    if ind != 4
    {
        if instance_exists(ind)
        {
            with (ind)
            {
                if y >= other.y
                    depth = other.depth - 1
                else
                    depth = other.depth + 1
            }
        }
    }
    else if instance_exists(ind)
    {
        with ind
        {
            if realy >= other.y
                depth = other.depth - 1
            else
                depth = other.depth + 2
        }
    }
}

function alldepthset() //alldepthset
{
    depthset(obj_npcparent)
    if instance_exists(obj_player2)
        depthset(obj_player2)
    depthset(obj_enemy)
    depthset(obj_door)
    depthset(obj_cardboard_enemy)
    depthset(obj_torch)
}

function set_state(state) //set_state
{
    obj_player.state = state
    if global.coop
        obj_player2.state = state
}

function draw_textbox() //draw_textbox
{
    if !instance_exists(obj_textbox)
    {
        with instance_create_layer(0, 0, "Instances", obj_textbox)
        {
            intID = other.id
            depth = other.depth + 1
        }
    }
}

function set_text(argument0, argument1, argument2, argument3) //set_text
{
    if argument0 != undefined
        draw_set_font(argument0)
    if argument1 != undefined
        draw_set_color(argument1)
    if argument2 != undefined
        draw_set_halign(argument2)
    if argument3 != undefined
        draw_set_valign(argument3)
}

function haskey() //haskey
{
    if !global.coop
    {
        if obj_player.haskey
            return true;
        else
            return false;
    }
    else if obj_player.haskey || obj_player2.haskey
        return true;
    else
        return false;
}

function darkdraw() //darkdraw
{
    gpu_set_blendmode(bm_subtract)
    var scale = 1
    var sprite = spr_torchlight
    with obj_torch
        draw_sprite_ext(sprite, -1, x, y, scale, scale, 0, c_white, 1)
    with obj_player
    {
        if !firetran
            draw_sprite_ext(sprite, 0, x, y, scale, scale, 0, c_white, 1)
        else
            draw_sprite_ext(sprite, -1, x, y, 2, 1.5, 0, c_white, 1)
    }
    with obj_shoparea
        draw_sprite_ext(Sprite306, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)
    gpu_set_blendmode(bm_normal)
}

function isholiday(argument0) //isholiday
{
    return true;
}

