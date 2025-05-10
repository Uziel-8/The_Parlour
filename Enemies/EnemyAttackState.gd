extends State

class_name EnemyAttack

signal basic_attack

@export var enemy: CharacterBody2D
@export var move_speed := 30 
@export var attack_range: int
var player: CharacterBody2D
@onready var stats = get_parent().get_parent().stats
@export var attack_component_path: NodePath
@onready var attack_component = get_node(attack_component_path)


func _ready() -> void:
	if stats:
		move_speed = stats.follow_speed
		attack_range = stats.attack_range
		

func Enter():
	player = get_tree().get_first_node_in_group("players")
	print("attacking state!")
	print("my attack range is: ", attack_range)

func Physics_Update(delta: float):
	if player == null or enemy == null:
		# print("player == ", player)
		# print("enemy.global_position == ", enemy.global_position)
		return

	var direction = player.global_position - enemy.global_position
	if direction.length() < attack_range and attack_component.is_ready_to_attack():
		print("player in attack range!!! Die fool!!!!")
		basic_attack.emit()
		enemy.velocity = Vector2()
	elif direction.length() > attack_range:
		print("The player has left my attack range ;_;")
		Transitioned.emit(self, "follow")
	# else:
	# 	print("I am attacking the player!!!!!!")
	# 	enemy.velocity = direction.normalized() * move_speed
