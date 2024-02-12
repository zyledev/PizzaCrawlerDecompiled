x = 0
y = 1080
verticlespeed = random_range(0.8, 5)
image_index = 0
image_speed = 1
image_xscale = choose(-1, 1)
image_alpha = 1
sprite_index = choose(spr_hesbrickyouknow, spr_gustavo_boogie, spr_peppino, spr_brick_roll_unused, spr_pepperman, spr_unusedbrick, spr_collectable1, spr_collectable2, spr_collectable3, spr_collectable4, spr_collectable5, spr_noise_dead)
var andy = irandom(1000)
if (andy == 950)
    sprite_index = spr_cursedandy
depth = -10
x = irandom_range(0, 1920)
