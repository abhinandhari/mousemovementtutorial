class_name Bullet extends RigidBody2D

@export var speed: float = 2.0
@export var lifetime: float = 3.0
@export var accel: float = 5.0
@export var direction: Vector2 = Vector2.UP
@export var cd: float = 1.0

signal hit_registered
func get_speed() -> float:
	return speed
func get_lifetime() -> float:
	return lifetime
func get_accel() -> float: 
	return accel
func get_direction() -> Vector2:
	return direction
func get_cd() -> float:
	return cd
func get_damage() -> int:
	return 10
func _ready() -> void:
	# TImer which destroys bullet after lifetime
	linear_velocity = get_direction()*get_speed()
	# Start a lifetime timer using the SceneTree timer system
	await get_tree().create_timer(get_lifetime()).timeout  # Wait for 1 second
	queue_free()  # Destroy the bullet
	pass
		
func get_obj_name() -> String:
	return "AbstractBullet(Override Required)"
	
func _physics_process(delta: float) -> void:
	apply_central_force(get_direction()*get_accel())
	
