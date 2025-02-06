class_name GameUtils extends Node
#BulletTypes are only for personal preference, would like to avoid coupling this.
const bulletTypes : Array[String] = ["BASICBULLET"]
const player: String = "PLAYER"
const enemy: String = "ENEMY"

static func hit(body,bullet:Bullet):
	match body.get_obj_name:
		player:
			print("Player Hit")
		enemy:
			print("Enemy Hit")
	pass
