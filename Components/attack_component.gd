extends Node

# Is this eventually going to handle ranged attacks? Or we make a separate component?

# this is too tied up with the function of the player. NOT ANYMORE BITCH!!!

# @onready var sprite = $"../AnimatedSprite2D"
@onready var player: CharacterBody2D = get_owner()
# @onready var hurtbox_component = $"../HurtboxComponent"
@onready var timer = $Timer
# @onready var movement_component = $"../MovementComponent"

# Think about whether these two should live in the entities or here
@export var is_attacking = false
@export var can_attack: bool = true

@onready var attacking_entity: CharacterBody2D = get_owner()
@onready var facing: Vector2 = attacking_entity.facing
@onready var sprite = attacking_entity.sprite
@onready var hurtbox_component = attacking_entity.hurtbox_component


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and can_attack:
		match facing:
			Vector2(-1, 0):
				sprite.play("attack_left")
				is_attacking = true
			Vector2(1, 0):
				sprite.play("attack_right")
				is_attacking = true
			Vector2(0, 1):
				sprite.play("attack_down")
				is_attacking = true
			Vector2(0, -1):
				sprite.play("attack_up")
				is_attacking = true
		can_attack = false
		perform_attack()
		timer.start()
		print("attacked")

func perform_attack():
	print("perform_attack triggered")
	for enemy in hurtbox_component.enemies_in_range:
		enemy.apply_damage(player.damage, player)
		
		print("attack hit ", enemy)

func _on_timer_timeout() -> void:
	can_attack = true # Replace with function body.
	is_attacking = false
	
