extends CharacterBody2D

var health: int = 100
var exp_drop = 20
var dead: bool = false



func _process(delta: float) -> void:
	die()

func die():
	if health <= 0:
		queue_free()
	
