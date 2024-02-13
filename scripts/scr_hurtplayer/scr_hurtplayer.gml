function hurtplayer() //hurtplayer
{
    if object_index != obj_player && object_index != obj_player2
    {
        if other.state != states.hurt && !other.invincibility && other.state != states.actor
        {
            other.iframes = 180
            other.invincibility = true
            other.state = states.hurt
        }
    }
    else if state != states.hurt && !invincibility && state != states.actor
    {
        iframes = 180
        invincibility = true
        state = states.hurt
    }
}

