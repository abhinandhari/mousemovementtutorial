extends Bullet

# Called when the node enters the scene tree for the first time.
 # Replace with function body.
const damage :int = 10

func _init():
	speed= 125.0
	lifetime= 30.0
	accel = 250.0
	cd=0.2
	
func get_obj_name() -> String:
	return "BASICBULLET"
