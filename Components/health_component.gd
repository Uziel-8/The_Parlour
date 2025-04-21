extends Node
@onready var parent = get_owner()


func apply_damage(damage: int):
	parent.health -= damage
