if opened
    sprite_index = spr_dungeon_door
else if !locked && !opened
    sprite_index = spr_dungeon_doorclose
if opened
    mask_index = spr_null
if !opened
    depth = -4
else
    depth = -6
if locked && !opened
{
    sprite_index = spr_dungeon_doorlock
    mask_index = spr_door_closed
}
interactcooldown--
