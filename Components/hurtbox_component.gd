extends Area2D

@onready var hurtbox_parent: CharacterBody2D = get_owner()
@onready var movement_component = $"../MovementComponent"
@onready var attack_component = $"../AttackComponent"

func _process(delta: float) -> void:
	print(position)
	print("update attack direction called")
	position = movement_component.facing2
	print(position)

func _ready() -> void:
	print("hello from hurtbox_component")



func _on_body_entered(body: Node2D) -> void:
	if attack_component.is_attacking:
		print("attack hit")
	elif !attack_component.is_attacking:
		print("I come in peace")

func update_attack_direction():
	pass
	
	
	
	
