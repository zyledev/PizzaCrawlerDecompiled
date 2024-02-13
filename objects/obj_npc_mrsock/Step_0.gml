if !active
    currentChar = 1
if distance_to_object(obj_player) > 30 && active
    active = false
if active
    sprite_index = activespr
else
    sprite_index = idlespr
