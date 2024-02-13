if visible
{
    audio_play_sound(sfx_break, 2, false)
    with other
    {
        if object_index == obj_punchhitbox
        {
            if obj_player.state == states.mach
                movespeed = 8
        }
        else if object_index == obj_punchhitboxp2
        {
            if obj_player2.state == states.mach
                movespeed = 8
        }
    }
    instance_destroy(self)
}
