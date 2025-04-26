class_name Hitbox
extends Area2D

@onready var parent = get_owner()
signal damaged(attack: Attack)

func apply_damage(damage: int, source):
	parent.health -= damage
	print("took", damage, "damage. Health is now: ", parent.health)

	if parent.health <= 0 and source.exp != null:
		source.exp += parent.exp_drop
		print("source gained ", parent.exp_drop, " exp!!!")
