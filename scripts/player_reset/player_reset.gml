function player_reset() //player_reset
{
    state = (0 << 0)
    playerhp = 3
    stamina = maxstamina
    global.panic = false
    global.points = 0
    global.killedbaddies = 0
    global.leveltosave = "hub1"
    global.collectable1 = false
    global.collectable2 = false
    global.collectable3 = false
    global.collectable4 = false
    global.collectable5 = false
    ds_list_clear(global.saveroom)
}

