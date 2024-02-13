if global.panic
{
    visible = true
    image_speed = 0.5
    if floor(image_index) == (image_number - 1) && !cooldown
    {
        cooldown = true
        with (instance_create_layer(x, (y - 600), "Instances", obj_fallingbrick))
            brickID = other.id
    }
}
else
{
    visible = false
    image_speed = 0
}
