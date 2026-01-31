extends Label

var fade_speed = 0.5
var glitch_strength = 10
var glitch_start_alpha = 0.85

func _process(delta):
	
	if  modulate.a < 1:
		modulate.a += fade_speed * delta
		modulate.a = clamp(modulate.a, 0, 1)
	else:
		position.x += randf_range(-glitch_strength, glitch_strength)
		position.y += randf_range(-glitch_strength, glitch_strength)
