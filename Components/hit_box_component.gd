class_name Hitbox
extends Area2D

@onready var parent = get_owner()
#signal damaged(attack: Attack)

func apply_damage(damage: int):
	parent.health -= damage
	print("took", damage, "damage. Health is now: ", parent.health)
