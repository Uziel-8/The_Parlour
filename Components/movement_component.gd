extends Node

var max_speed: float = 100
var acceleration_time: float = 0.1
@onready var sprite = $"../AnimatedSprite2D"
@onready var player: CharacterBody2D = get_owner()

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
	else:
		sprite.play("idle_left")
	
func _ready() -> void:
	pass
