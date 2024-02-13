scr_initinput()
scr_getinput()
ini_open("savedata.ini")
isup = false
isright = false
isleft = false
isdown = true
isupleft = false
isupright = false
isdownright = false
isdownleft = false
palarray = []
spr_pal = spr_gustavo_pal
palgenerated = false
palselect = ini_read_real("palette", "currentpalette", 1)
prevpalselect = 0
palswapcooldown = 10
savedpal = ini_read_real("palette", "currentpalette", 1)
state = (0 << 0)
lv = ini_read_string("levelup", "lv", 1)
stamina = 20
maxstamina = 20
playerhp = 3
hp = 3
maxhp = 3
inputlocked = 0
spr_idle = spr_gustavo_idle
movey = 1
movex = 1
movexright = 1
moveydown = 1
movespeed = 2
depth = -5
haskey = false
keytimer = 0
global.level1unlock = ini_read_real("levelunlocks", "levelone", false)
global.challengemodeunlock = ini_read_string("pizzadungeon", "beaten", "false")
ini_close()
playernum = 0
gamepad_set_axis_deadzone(0, 0.5)
vsp = 0
hsp = 0
movex = 0
movey = 0
global.cheeseslimemode = false
character = "G"
characterspr()
target_door = ""
fill = 0
if room == rm_hub1 && global.coop && !instance_exists(obj_player2)
    instance_create_layer(x, y, "Instances", obj_player2)
global.killedbaddies = 0
global.points = 0
global.currentlevel = 0
global.leveltosave = "hub1"
invincibility = 0
iframes = 60
dead = 0
global.debug = false
global.treasuresprite = spr_lv1item
firetran = 0
