function collision(argument0, argument1) //collision
{
    var _roomx = to_room(argument0 + 0.5)
    var _roomy = to_room(argument1 + 0.5)
    if position_meeting(_roomx, _roomy, obj_solid)
        return true;
    if position_meeting(_roomx, _roomy, obj_character)
        return true;
    return false;
}

