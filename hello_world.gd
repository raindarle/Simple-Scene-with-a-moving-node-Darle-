extends Label

@export var speed: float = 210.0
@export var shake_strength: float = 6.0
@export var shake_duration: float = 0.1
@export var right_limit: float = 600.0   # change based on window width
@export var left_limit: float = 0.0

var direction: int = 1
var base_position: Vector2
var shake_timer: float = 0.0

func _ready():
	base_position = position

func _process(delta):
	# --- Normal Movement ---
	position.x += speed * direction * delta

	# --- Edge Collision ---
	if position.x > right_limit:
		direction = -1
		start_shake()
	elif position.x < left_limit:
		direction = 1
		start_shake()

	# --- Shake Effect ---
	if shake_timer > 0.0:
		shake_timer -= delta
		var offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
		position = base_position + offset
	else:
		base_position = position  # update resting position

func start_shake():
	shake_timer = shake_duration
