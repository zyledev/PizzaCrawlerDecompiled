if ok
    image_alpha = 1
else
    image_alpha = 0.25
ready += 0.8
if ready >= 100
    ok = true
else
    ok = false
if ready >= 101
    ready = 100
