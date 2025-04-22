extends Node

var max_speed: float = 100
var acceleration_time: float = 0.1
@onready var sprite = $"../AnimatedSprite2D"
@onready var player: CharacterBody2D = get_owner()
@export var facing: String = ""
@export var facing2: Vector2 = Vector2(0, -1)
@onready var attack_component = $"../AttackComponent"

func _physics_process(delta: float) -> void:
	var velocity = player.velocity
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = velocity.move_toward(input_direction*max_speed, (1.0 / acceleration_time) * delta * max_speed)
	
	if input_direction.y && sign(input_direction.y) != sign(velocity.y):
		velocity.y *= 0.75
	
	if input_direction.x && sign(input_direction.x) != sign(velocity.x): 
		velocity.x *= 0.75
	
	player.velocity = velocity
	player.move_and_slide()
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		sprite.play("run_left")
		facing = "left"
		facing2 = Vector2(-1, 0)
	elif Input.is_action_pressed("right"):
		sprite.play("run_right")
		facing = "right"
		facing2 = Vector2(1, 0)
	elif Input.is_action_pressed("up"):
		sprite.play("run_up")
		facing = "up"
		facing2 = Vector2(0, -1)
	elif Input.is_action_pressed("down"):
		sprite.play("run_down")
		facing = "down"
		facing2 = Vector2(0, 1)
	elif !Input.is_anything_pressed() and attack_component.can_attack:
		match facing:
			"left":
				sprite.play("idle_left")
			"right":
				sprite.play("idle_right")
			"up":
				sprite.play("idle_up")
			"down":
				sprite.play("idle_down")
			_:
				sprite.play("idle_down")
	
func _ready() -> void:
	pass
