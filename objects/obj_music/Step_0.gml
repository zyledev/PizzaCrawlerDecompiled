if global.mute
    return;
if !instance_exists(obj_pause) && !instance_exists(obj_rank) && room != rm_ost && room != rm_rankroom
{
    if !global.panic
    {
        if !global.useshoptheme || global.shopoverride
        {
            switch room
            {
                case Room1:
                case lcljfd_1:
                    play_music(mus_coldspaghetti)
                    music = mus_coldspaghetti
                    break
                case Titlescreen:
                    if (global.prevroom != rm_ost)
                    {
                        play_music(mus_title)
                        music = mus_title
                    }
                    break
                case rm_editor:
                    if !audio_is_playing(mus_editor) && !obj_editor.player
                    {
                        audio_stop_all()
                        audio_play_sound(mus_editor, 5, true, 0.5)
                    }
                    break
                case Tutorial_1:
                    play_music(mus_tutorial)
                    music = mus_tutorial
                    break
                case rm_hub1:
                    play_music(mus_hub1)
                    music = mus_hub1
                    break
                case lv1_1:
                    play_music(mus_level1)
                    music = mus_level1
                    break
                case rm_levelselect:
                    play_music(mus_pizzadungeon)
                    music = mus_pizzadungeon
                    break
            }

            if !global.useshoptheme && audio_is_playing(mus_shop)
            {
                audio_stop_sound(mus_shop)
                if music
                    audio_resume_sound(music)
                else
                    audio_resume_all()
            }
        }
        else if global.useshoptheme && !global.shopoverride
            play_music(mus_shop)
        else
            audio_resume_sound(music)
    }
    else if global.panic
        play_music(mus_escape)
}
else if instance_exists(obj_pause)
{
    if !audio_is_playing(mus_pause)
        audio_play_sound(mus_pause, 5, true)
}
if instance_exists(obj_rank)
{
    if !audio_is_playing(mus_rankidle) && obj_rank.ranksound == mus_hub1
    {
        audio_stop_all()
        play_music(mus_rankidle)
    }
    else if audio_is_playing(mus_rankidle) && obj_rank.ranksound != 0
        audio_stop_sound(mus_rankidle)
    switch obj_rank.rank
    {
        case "B":
        case "C":
            play_sound_unique(rank_c_b)
            break
        case "D":
            play_sound_unique(rank_c_b)
            break
        case "S":
            play_sound_unique(rank_s)
            break
        case "A":
            play_sound_unique(rank_a)
            break
    }

}
