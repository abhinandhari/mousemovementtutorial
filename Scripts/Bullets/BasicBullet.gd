class_name BasicBullet extends Bullet

# Called when the node enters the scene tree for the first time.
 # Replace with function body.
const damage :int = 10

func initialize(isFriendly:bool):
	self.isFriendly=isFriendly
	speed= 125.0
	lifetime= 1.0
	accel = 250.0
	cd=0.2
	
	
func get_obj_name() -> String:
	return GameUtils.bulletTypes[0]

# Replace with function body.
