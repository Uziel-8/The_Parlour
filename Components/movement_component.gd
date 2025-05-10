extends Node

var max_speed: float = 100
var acceleration_time: float = 0.1
@onready var sprite = $"../AnimatedSprite2D"
@onready var parent_entity: CharacterBody2D = get_owner()
@export var facing_string: String = ""
# @onready var can_attack = parent_entity.can_attack
# @export var facing: Vector2 = parent_entity.facing 
@onready var attack_component = $"../AttackComponent"
# @onready var attack_component = parent_entity.attack_component

func _physics_process(delta: float) -> void:
	var velocity = parent_entity.velocity
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = velocity.move_toward(input_direction*max_speed, (1.0 / acceleration_time) * delta * max_speed)
	
	if input_direction.y && sign(input_direction.y) != sign(velocity.y):
		velocity.y *= 0.75
	
	if input_direction.x && sign(input_direction.x) != sign(velocity.x): 
		velocity.x *= 0.75
	
	parent_entity.velocity = velocity
	parent_entity.move_and_slide()
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		sprite.play("run_left")
		facing_string = "left"
		parent_entity.facing = Vector2(-1, 0)
	elif Input.is_action_pressed("right"):
		sprite.play("run_right")
		facing_string = "right"
		parent_entity.facing = Vector2(1, 0)
	elif Input.is_action_pressed("up"):
		sprite.play("run_up")
		facing_string = "up"
		parent_entity.facing = Vector2(0, -1)
	elif Input.is_action_pressed("down"):
		sprite.play("run_down")
		facing_string = "down"
		parent_entity.facing = Vector2(0, 1)
	elif !Input.is_anything_pressed() and attack_component.can_attack:
		match parent_entity.facing:
			Vector2(-1, 0):
				sprite.play("idle_left")
			Vector2(1, 0):
				sprite.play("idle_right")
			Vector2(0, -1):
				sprite.play("idle_up")
			Vector2(0, 1):
				sprite.play("idle_down")
			_:
				sprite.play("idle_down")
	
func _ready() -> void:
	pass
