draw_self()
var sprtodraw = room == rm_playtest ? spr : global.treasuresprite
if !taken
    draw_sprite(sprtodraw, 0, x, y)
else if taken & obj_player.sprite_index == spr_gustavo_treasure
    draw_sprite(sprtodraw, 0, obj_player.x + 18, obj_player.y - 25)
