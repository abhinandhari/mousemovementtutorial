# Speed of the character
extends CharacterBody2D 
@export var speed: float = 5.0
@export var min_x: float
@export var max_x: float
@export var min_y: float
@export var max_y: float
@export var bullet_scene : PackedScene = preload("res://Scenes/Bullet.tscn")
var cooldown_active: bool =false
var current_bullet : String = GameUtils.bulletTypes[0]
var bullet: Bullet
# Target position to move towards
var target_position: Vector2 = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"): 
		if(cooldown_active): # Custom input action for shooting
			print("Cannot Shoot!")
		else:
			shoot_bullet()
			cooldown_active=true
	pass

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
	
func shoot_bullet() -> void:
	match current_bullet:
		GameUtils.bulletTypes[0]:
			bullet_scene=load("res://Scenes/BasicBullet.tscn")
	bullet=bullet_scene.instantiate()
	bullet.initialize(true)
	bullet.position = self.global_position
	get_tree().root.add_child(bullet)
	await get_tree().create_timer(bullet.get_cd()).timeout
	cooldown_active=false
