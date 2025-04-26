extends CharacterBody2D

var level = 1
var damage = 50 + (level - 1) * 5
var health = 100 + (level - 1) * 10
var mana = 100 + (level - 1) * 10
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
