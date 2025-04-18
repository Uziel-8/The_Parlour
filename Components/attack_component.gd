extends Node

@onready var sprite = $"../AnimatedSprite2D"
@onready var player: CharacterBody2D = get_owner()
@onready var timer = $Timer
@export var can_attack: bool = true
@onready var movement_component = $"../MovementComponent"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and can_attack:
		match movement_component.facing:
			"left":
				sprite.play("attack_left")
			"right":
				sprite.play("attack_right")
			"down":
				sprite.play("attack_down")
			"up":
				sprite.play("attack_up")
		can_attack = false
		timer.start()
		print("attacked")

func _on_timer_timeout() -> void:
	can_attack = true # Replace with function body.
	
