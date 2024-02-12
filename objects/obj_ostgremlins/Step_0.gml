y -= (0.5 * verticlespeed)
if (image_alpha <= 0)
    instance_destroy(id, false)
switch sprite_index
{
    case spr_collectable1:
    case spr_collectable2:
    case spr_collectable3:
    case spr_collectable4:
    case spr_collectable5:
        image_index = 0
        break
    case spr_pepperman:
        image_xscale = 1
        break
    case spr_cursedandy:
        var _textforuser = "IF YOUR READING THIS YOU ARE NOW CURSED BY ANDY"
        break
}

