if player
    audio_stop_sound(player)
if global.mute
{
    global.mute = false
    global.shopoverride = false
    if global.useshoptheme
    {
        audio_stop_sound(mus_shop)
        global.useshoptheme = false
    }
    with obj_editor
    {
        if player
            audio_resume_sound(player)
        else
            audio_resume_all()
    }
}
