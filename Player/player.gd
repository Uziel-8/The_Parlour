extends CharacterBody2D

var level = 1
var damage = 50

var health = 100
var max_health: int

var mana = 100
var max_mana: int

var exp = 0
var level_threshold = 100




func _process(delta: float) -> void:
	if health <= 0:
		die()
	if exp >= level_threshold:
		level_up()
		exp = 0
		level_threshold = level_threshold * 1.2

func die():
	#queue_free()
	get_tree().reload_current_scene()

func level_up():
	level += 1
	damage = 50 + (level - 1) * 5
	health = 100 + (level - 1) * 10
	mana = 100 + (level - 1) * 10
	exp = 0
	level_threshold = level_threshold * 20
