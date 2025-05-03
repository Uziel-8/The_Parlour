extends State

class_name EnemyAttack

@export var enemy: CharacterBody2D
# @export var move_speed := 30
# @export var attack_range: int
var player: CharacterBody2D
@onready var stats = get_parent().get_parent().stats


func _ready() -> void:
	if stats:
		move_speed = stats.attack_move_speed
		attack_range = stats.attack_range



func Enter():
	player = get_tree().get_first_node_in_group("players")
	print("attacking state!")

func Physics_Update(delta: float):
	if player == null or enemy == null:
		return
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 20:
		enemy.velocity = direction.normalized() * move_speed
	if direction.length() > 20:
		Transitioned.emit(self, "follow")
	else:
		enemy.velocity = Vector2()
