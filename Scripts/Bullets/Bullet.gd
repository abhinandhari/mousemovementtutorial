class_name Bullet extends RigidBody2D

@export var speed: float = 2.0
@export var lifetime: float = 3.0
@export var accel: float = 5.0
@export var direction: Vector2 = Vector2.UP
@export var cd: float = 1.0
@export var isFriendly:bool = true
func get_speed() -> float:
	return speed
func get_lifetime() -> float:
	return lifetime
func get_accel() -> float: 
	return accel
func get_direction() -> Vector2:
	if(isFriendly):
		return direction
	else:
		return -1 * direction
func get_cd() -> float:
	return cd
	
func _ready() -> void:
	linear_velocity = get_direction()*get_speed()
	# Start a lifetime timer using the SceneTree timer system
	await get_tree().create_timer(get_lifetime()).timeout  # Wait for lifetime second
	print($DmgComponent.dmg)
	queue_free()  # Destroy the bullet
	pass
		
func initialize(x:bool):
	isFriendly=x
	
func _physics_process(delta: float) -> void:
	apply_central_force(get_direction()*get_accel())
	pass # Replace with function body.

func get_obj_name() -> String:
	return "AbstractBullet(Override Required)"
	
