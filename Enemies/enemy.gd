extends CharacterBody2D

var health: int = 100

func _process(delta: float) -> void:
	die()

func die():
	if health <= 0:
		queue_free()
	
