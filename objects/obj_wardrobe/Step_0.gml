palselect = obj_player.palselect
palselect = scr_overflow(palselect, 1, (sprite_get_width(spr_gustavo_pal) - 1))
if ((!palgenerated) || palselect != prevpalselect)
{
    palarray = scr_paltoarr(spr_gustavo_pal, palselect)
    palgenerated = 1
    prevpalselect = palselect
}
if (distance_to_object(obj_player) < 30)
    drawpalsprite = spr_solid
else
    drawpalsprite = spr_metalblock
if (!(place_meeting(x, y, obj_player)))
    drawtext = 0
