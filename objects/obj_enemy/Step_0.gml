if escape
{
    if !global.panic
        state = enemystates.panic
}
switch state
{
    case enemystates.normal: // 0
        enemynormal()
        break
    case enemystates.chase: // 2
        enemyplayerchase()
        break
    case enemystates.attack: // 1
        enemyattack()
        break
    case enemystates.controlled: // 4
        enemycontrolled()
        break
    case enemystates.panic: // 3
        if !global.panic
        {
            hsp = 0
            vsp = 0
            visible = false
        }
        else if global.panic
        {
            visible = true
            state = enemystates.normal
        }
        break
}

if !place_meeting((x + hsp), y, obj_solid)
    x += hsp
if !place_meeting(x, (y + vsp), obj_solid)
    y += vsp
attackcooldown--
if hitboxid != noone && !instance_exists(hitboxid)
    hitboxid = -4
