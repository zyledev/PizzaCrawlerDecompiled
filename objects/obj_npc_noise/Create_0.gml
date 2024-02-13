event_inherited()
statess = 
{
    idle: 
    {
        left: spr_noise_idleleft,
        right: spr_noise_idleright,
        down: spr_noise_idle,
        up: spr_noise_idleup
    },
    walk: 
    {
        left: spr_noise_left,
        right: spr_noise_right,
        down: spr_noise_down,
        up: spr_noise_up
    },
    dead: spr_noise_dead
}

state = statess.walk
hsp = 0
vsp = 0
prevhsp = hsp
prevvsp = vsp
deadtimer = 60
noise = true
