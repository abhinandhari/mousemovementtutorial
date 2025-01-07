# Speed of the character
extends CharacterBody2D
@export var speed: float = 5.0
@export var min_x: float
@export var max_x: float
@export var min_y: float
@export var max_y: float
# Target position to move towards
var target_position: Vector2 = Vector2.ZERO

func _ready():
	pass
	# Initialize the target position to the character's current position
func _process(delta):
	position.x = clamp(position.x, min_x, max_x)
	position.y = clamp(position.y, min_y, max_y)
	target_position=get_viewport().get_mouse_position()
	# Smoothly interpolate position towards the target
	if global_position.distance_to(target_position) > 1.0:  # Avoid jittering near the target
		global_position = global_position.lerp(target_position, speed * delta)
	
	
