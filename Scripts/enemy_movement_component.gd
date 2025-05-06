extends Node

class_name EnemyMovement

@onready var enemy: Enemy = get_parent()


func _physics_process(delta: float) -> void:
	if enemy == null:
		print("null")
		return
	if abs(enemy.move_direction.x) > abs(enemy.move_direction.y):
		# Horizontal movement
		if enemy.move_direction.x > 0:
			enemy.sprite.play("run_right")
		else:
			enemy.sprite.play("run_left")
	else:
		# Vertical movement
		if enemy.move_direction.y > 0:
			enemy.sprite.play("run_down")
		else:
			enemy.sprite.play("run_up")
