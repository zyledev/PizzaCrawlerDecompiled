image_speed = 1
ini_open("savedata.ini")
usepalette = true
paletteselect = ini_read_real("palette", "currentpalette", 1)
palarray = []
spr_pal = spr_gustavo_pal
palgenerated = false
prevpalselect = 0
ini_close()
