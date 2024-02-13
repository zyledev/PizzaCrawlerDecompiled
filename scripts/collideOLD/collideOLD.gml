function scr_collide() //scr_collide
{
    if place_meeting(x + 1, y, obj_solid)
    {
        movex = false
        movexright = true
    }
    else if place_meeting(x - 1, y, obj_solid)
    {
        movex = true
        movexright = false
    }
    else
    {
        movex = true
        movexright = true
    }
    if place_meeting(x, y + 1, obj_solid)
    {
        movey = false
        moveydown = true
    }
    if place_meeting(x, y - 1, obj_solid)
    {
        movey = true
        moveydown = false
    }
    else
    {
        movey = true
        moveydown = true
    }
}

