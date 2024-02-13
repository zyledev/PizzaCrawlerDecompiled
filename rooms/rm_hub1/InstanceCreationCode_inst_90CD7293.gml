if !global.challengemodeunlock
    instance_destroy()
sprite_index = spr_mrsock_idle
depth = -5
statess = 
{
    idle: 
    {
        left: spr_mrsock_left_idle,
        right: spr_mrsock_right_idle,
        down: spr_mrsock_idle,
        up: spr_mrsock_up_idle
    },
    walk: 
    {
        left: spr_mrsock_left,
        right: spr_mrsock_right,
        down: spr_mrsock_down,
        up: spr_mrsock_up
    },
    dead: 
    {
        left: spr_noise_dead,
        right: spr_noise_dead,
        down: spr_noise_dead,
        up: spr_noise_dead
    }
}

noise = false
