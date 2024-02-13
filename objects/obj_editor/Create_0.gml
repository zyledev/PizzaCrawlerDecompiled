if (instance_number(object_index) > 1)
    instance_destroy()
draw_set_font(global.font)
draw_set_color(c_white)
draw_set_halign(fa_left)
if (!variable_global_exists("key_punch"))
    scr_initinput()
roomobjects = [[]]
roomtiles = [[[], [], [], [], []]]
layerprop = [[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]]
curlayer = 0
levelname = ""
oldlevelname = ""
nameempty = 0
#region objects
objects = [
[obj_playerspawnpoint, Sprite78, "SPAWN"],
[obj_playerspawnpoint, spr_player2spawn, "SPAWN2"],
[obj_solid, spr_solid, "SOLID"],
[obj_panicsolid, spr_escape_debrisreverse, "PANIC\nSOLID"],
[obj_reversepanicsolid, Sprite251, "UNPANIC\nSOLID"],
[obj_brickspawner, spr_fallingbrick, "BRICK\nSPAWNER"],
[obj_paniccutscenestart, Sprite249, "PANIC\nSTART"],
[obj_pedestal, spr_podium, "PEDESTAL", "fill", "spr"], 
[obj_unvisiteddarkness, Sprite79, "DARKNESS"],
[obj_metalblock, spr_metalblock, "METAL\nBLOCK", "hp", "destroytiles"],
[obj_bigmetalblock, spr_metalblock_big, "BIG METAL\nBLOCK", "hp", "destroytiles"],
[obj_crate, spr_crate, "CRATE", "destroytiles"],
[obj_hallway, Sprite80, "HALLWAY", "target_room", "target_door"],
[obj_doorA, spr_doorA, "DOORA"],
[obj_door, spr_dungeon_doorclose, "DOOR", "locked"],
[obj_key, spr_key, "KEY"],
[obj_sign, spr_sign, "SIGN", "text"],
[obj_cheeseslime, spr_cheeseslime_idle, "CHEESE\nSLIME", "escape"],
[obj_mrsock, spr_mrsock_idle, "MRSOCK", "escape"],
[obj_cardboard_enemy, spr_cardboard_cheese, "CUTOUT"],
[obj_treasurechest, spr_chest_idle, "CHEST", "collectablenum"],
[obj_mrstick, spr_mrstick_idle, "MRSTICK\nSHOP", "idlespr", "talkspr", "text", "panictext"],
[obj_shoparea, Sprite202, "SHOP\nAREA"],
[obj_npc_noise, spr_noise_idle, "NPC", "idleleft", "idleright", "idledown", "idleup", "walkleft", "walkright", "walkdown", "walkup", "dead", "canpunch"],
[obj_doorB, spr_doorB, "DOORB"],
[obj_doorC, spr_doorC, "DOORC"],
[obj_doorD, spr_doorD, "DOORD"],
[obj_doorE, spr_doorE, "DOORE"],
[obj_doorF, spr_doorF, "DOORF"],
[obj_doorG, spr_doorG, "DOORG"],
[obj_npcsolid, spr_solid, "NPC\nSOLID"],
[obj_actor, spr_actor, "IMAGE", "normalspr", "panicspr", "imgspeed", "depth"],
[obj_playmusic, spr_music, "MUSIC", "music", "mutebg", "loop", "volume", "offset", "pitch"],
[obj_levelstart, Sprite80, "LEVEL\nSTART", "target_room", "target_door", "levelname", "point", "baddie"],
[obj_exithole, spr_exithole, "EXITHOLE"],
[obj_staminaboost, spr_energy, "ENERGY\nBOOSTER"]
]
#endregion

#region Folders
folders = [
["BACK", 0, 1, -3, -4, 11, 12, -2, 14, 15, 16, 17, 18, 19, 20, 33, 22, 35, -5, -6],
["DOORS", -1, 13, 24, 25, 26, 27, 28, 29], ["COLLISION", -1, 2, 3, 4, 8, 9, 10],
["PANIC", -1, 3, 4, 5, 6, 7, 34],
["NPC", -1, 21, 23, 30],
["ASSETS", -1, 31, 32]
]
#endregion

#region Backgrounds
bgs = [
[spr_bg_dungeon, "DUNGEON"],
[spr_bg_hubtiles, "HUB"],
[spr_bg_tutorialtiles, "TUTORIAL"],
[spr_bg_shoptiles, "SHOP"],
[spr_bg_beta, "BETA FLOOR"]
]
#endregion

#region Tilesets
tilesets = [
[ts_shop, spr_ts_dungeon, "DUNGEON"],
[ts_strongcold, spr_ts_hubtiles, "HUB"],
[ts_counter, spr_ts_tutorialtiles, "TUTORIAL"],
[ts_tutorial, spr_ts_shoptileseditor, "SHOP"],
[ts_beta, spr_ts_countereditor, "SHOP COUNTER"],
[ts_hubtiles, spr_ts_beta, "BETA TILES"]
]
tilesetwidth = [[13, 13, 13, 13, 13]]
tilesetheight = [[11, 11, 11, 11, 11]]
#endregion

#region Music
mus = [
[mus_level1, "DUNGEON\nCRAWLING"],
[mus_tutorial, "THE OLD\nPIZZAMART"],
[mus_shop, "PRICES TO\nDIE FOR"],
[mus_hub1, "TREASURE\nTROVE"],
[mus_title, "PRESS START\nTO PLAY"],
[mus_cavething, "CAVETHING"]
]
#endregion
curfolder = 0
spawn = [0, 0, 0, 0, 0]
selected = 0

tiledx1 = -1
tiledy1 = -1
tiledx2 = -1
tiledy2 = -1
oldx = 0
oldy = 0
tiling = 0
tiledrag = 0

highlight = -1
lightscroll = 0
image_speed = 0
playtest = 0
grabx = 0
graby = 0
edge = 0
property = -1
open = -1
guiwidth = 256
dialog = 3
save = 1
levels = []
for (var _file = file_find_first("levels/*.json", 0); _file != ""; _file = file_find_next())
{
    _file = string_replace(_file, ".json", "")
    array_push(levels, _file)
}
show_debug_message((("Found " + string(array_length(levels))) + " files."))
file_find_close()
mouse_xadjust = mouse_x
mouse_yadjust = mouse_y
backto = 0
levelx = 0
levely = 0
levelwidth = [1376]
levelheight = [768]
objscroll = 0
bg = [-1]

extrabg = []
bgname = []
mu = [-1]

extramu = []
muname = []
player = undefined
leveledge = -1
rooms = ["UNTITLED"]
curroom = 0
home = 0
widthless = 0
heightless = 0
roomnameedit = -1
prevroomnameedit = roomnameedit
choosehome = 0
rememberctrl = 0
version = 1
global.leveltosave = "custom"
global.customkilledbaddies = 10
global.custompoints = 1500
global.returneditor = []
global.returndoor = []
global.returnlevel = []
global.returnpoint = []
global.returnbaddie = []
