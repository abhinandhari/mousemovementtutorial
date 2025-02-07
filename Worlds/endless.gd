extends Node2D
@export var enemy_scene: PackedScene = preload("res://Scenes/BaloonEnemy.tscn")
@export var enemy : Array[EnemyCharacter]
# Called when the node enters the scene tree for the first time.
func _ready():
	enemy.append(enemy_scene.instantiate())
	for ele in enemy:
		add_child(ele)
	enemy[0].position = get_viewport().size / 2
	#print(enemy[0].position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
