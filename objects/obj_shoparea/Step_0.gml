if !place_meeting(x, y, obj_player)
{
    global.useshoptheme = false
    image_alpha = clamp(image_alpha + 0.1, 0, 1)
}
if global.leveltosave == "longchallengeleveljustfordemo"
    sprite_index = Sprite306
