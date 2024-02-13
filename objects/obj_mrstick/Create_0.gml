text = "This is merely a demo one. What do you expect?\nMe to sell you stuff?"
active = 0
delay = 30
currentChar = 1
panicking = false
chachingbuffer = 60
intbuffer = 30
fundbuffer = 90
challenge = 0
if !ishubroom()
    challenge = 1
if challenge == 1
    text = "BUY AN HP UP?\nCOSTS 25 POINTS\n(PUNCH FOR YES  INTERACT FOR NO)"
idlespr = spr_mrstick_idle
talkspr = spr_mrstick_talk
panictext = "LOOK AT WHAT YOU'VE DONE!\nNOW THIS WHOLE TOWER'S GONNA BLOW UP!"
