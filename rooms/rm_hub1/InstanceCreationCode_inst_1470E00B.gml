if !global.challengemodeunlock
    instance_destroy()
depth = -5
sprite_index = spr_cheeseslime_idle
statess = 
{
    idle: 
    {
        left: spr_cheeseslime_left_idle,
        right: spr_cheeseslime_right_idle,
        down: spr_cheeseslime_idle,
        up: spr_cheeseslime_up_idle
    },
    walk: 
    {
        left: spr_cheeseslime_left,
        right: spr_cheeseslime_right,
        down: spr_cheeseslime_move,
        up: spr_cheeseslime_up
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
