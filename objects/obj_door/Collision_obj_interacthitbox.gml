if interactcooldown <= 0
{
    if !locked
    {
        opened = true
        ds_list_add(global.saveroom, -real(id))
        audio_play_sound(sfx_door, 2, false)
    }
    if locked
    {
        if obj_player.haskey && other.object_index != obj_interacthitboxp2
        {
            locked = false
            ds_list_add(global.saveroom, id)
            instance_create_layer(x, y, "Instances", obj_lock_dead)
            interactcooldown = 6
            obj_player.haskey = false
        }
    }
}
