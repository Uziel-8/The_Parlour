extends Node

class_name EnemyMovement

@onready var parent_entity = get_parent()
@export var attack_component_path: NodePath
@onready var attack_component = get_node(attack_component_path)



func _physics_process(delta: float) -> void:
	if parent_entity == null:
		print("null")
		return
	if attack_component.can_attack:
		if abs(parent_entity.move_direction.x) > abs(parent_entity.move_direction.y):
			# Horizontal movement
			if parent_entity.move_direction.x > 0:
				parent_entity.facing = Vector2(1, 0)
				parent_entity.sprite.play("run_right")
			else:
				parent_entity.facing = Vector2(-1, 0)
				parent_entity.sprite.play("run_left")
		else:
			# Vertical movement
			if parent_entity.move_direction.y > 0:
				parent_entity.facing = Vector2(0, 1)
				parent_entity.sprite.play("run_down")
			else:
				parent_entity.facing = Vector2(0, -1)
				parent_entity.sprite.play("run_up")
