extends State

class_name PlayerIdle

var player

func Enter():
	player = get_parent().get_parent()
	player.get_node("AnimatedSprite2D").play("Idle")

func Physics_Update(delta):
	var direction
	pass

func Update(delta):
	pass
