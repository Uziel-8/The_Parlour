extends Node2D

# script attached to the orc_spawner scene for spawning orcs :0

@export var enemy_scene: PackedScene = preload("res://Enemies/enemy.tscn")

@export var spawn_radius := 100.0
@export var spawn_interval := 5.0
@export var draw_spawn := true

class orc_spawn_entry:
	var orc : orc_data
	var weight: int

	func _init(data: orc_data, w: int):
		orc = data
		weight = w

var spawn_table: Array[orc_spawn_entry] = []
var total_weight: int = 0
var max_active_orcs: int = 15
var active_orcs: int = 0


var orc_types: Array[orc_data] = [
	preload("res://Resources/OrcData/orc_grunt_data.tres"),
	preload("res://Resources/OrcData/orc_warrior_data.tres"),
	preload("res://Resources/OrcData/orc_chieftain_data.tres"),
]

func _ready() -> void:
	add_orc_type(preload("res://Resources/OrcData/orc_grunt_data.tres"), 50)
	add_orc_type(preload("res://Resources/OrcData/orc_warrior_data.tres"), 30)
	add_orc_type(preload("res://Resources/OrcData/orc_chieftain_data.tres"), 20)

	$Timer.wait_time = spawn_interval
	$Timer.start()

func add_orc_type(orc: orc_data, weight: int):
	spawn_table.append(orc_spawn_entry.new(orc, weight))
	total_weight += weight

func weighted_spawn():
	var roll = randi_range(0, total_weight - 1)
	var current_weight = 0

	var selected_orc_data: orc_data
	for entry in spawn_table:
		current_weight += entry.weight
		if current_weight > roll:
			selected_orc_data = entry.orc
			break
	
	if selected_orc_data:
		spawn_orc(selected_orc_data)

func spawn_orc(stats: orc_data):
	var spawn_point = global_position + Vector2(
		randf_range(-spawn_radius, spawn_radius),
		randf_range(-spawn_radius, spawn_radius)
	)

	var new_orc = enemy_scene.instantiate()
	new_orc.stats = stats
	new_orc.global_position = spawn_point
	new_orc.tree_exiting.connect(_on_orc_died)

	get_tree().current_scene.add_child(new_orc)
	active_orcs += 1

func _on_orc_died():
	active_orcs -= 1


func _draw():
	if draw_spawn:
		draw_circle(Vector2.ZERO, spawn_radius, Color(1, 0, 0, 0.2))


func _on_timer_timeout() -> void:
	if active_orcs <= max_active_orcs:
		weighted_spawn()
