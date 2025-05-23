extends State

class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed := 30
@export var follow_range: int
var player: CharacterBody2D
var attack_range: int
@onready var stats = get_parent().get_parent().stats

func _ready() -> void:
	if stats:
		move_speed = stats.follow_speed
		follow_range = stats.follow_range
		attack_range = stats.attack_range

	if !stats:
		follow_range = 100

func Enter():
	player = get_tree().get_first_node_in_group("players")

func Physics_Update(delta: float):
	if player != null:
		var direction = player.global_position - enemy.global_position
		
		if direction.length() > 25:
			enemy.velocity = direction.normalized() * move_speed
			enemy.move_direction = direction
		else:
			enemy.velocity = Vector2()
		
		if direction.length() > follow_range:
			Transitioned.emit(self, "wander")
		elif direction.length() < attack_range:
			Transitioned.emit(self, "attack")
