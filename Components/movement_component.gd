extends Node

# @export var facing_string: String = ""
# @onready var can_attack = parent_entity.can_attack
# @export var facing: Vector2 = parent_entity.facing 
# @onready var attack_component = parent_entity.attack_component

@onready var sprite = $"../AnimatedSprite2D"
@onready var attack_component = $"../AttackComponent"
@onready var parent_entity: CharacterBody2D = get_owner()
@export var input_component_path: NodePath
@onready var input_component = get_node(input_component_path)

var max_speed: float = 100
var acceleration_time: float = 0.1
var move_direction: Vector2 = Vector2.ZERO
var received_input_this_frame: bool = false

var directions_dict: Dictionary = {
	Vector2.LEFT: "left",
	Vector2.RIGHT: "right",
	Vector2.DOWN: "down",
	Vector2.UP: "up"
}

func _ready() -> void:
	if input_component:
		input_component.move_command.connect(move)

func move(direction):
	move_direction = direction
	received_input_this_frame = true

func get_cardinal_direction(direction: Vector2) -> Vector2:
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			parent_entity.facing = Vector2.RIGHT
			return Vector2.RIGHT
		else:
			parent_entity.facing = Vector2.LEFT
			return Vector2.LEFT

	else:
		if direction.y > 0:
			parent_entity.facing = Vector2.DOWN
			return Vector2.DOWN
		else: 
			parent_entity.facing = Vector2.UP
			return Vector2.UP

func _physics_process(delta: float) -> void:
	if received_input_this_frame:

		var velocity = parent_entity.velocity
		velocity = velocity.move_toward(move_direction*max_speed, (1.0 / acceleration_time) * delta * max_speed)
		
		if move_direction.y && sign(move_direction.y) != sign(velocity.y):
			velocity.y *= 0.75
		
		if move_direction.x && sign(move_direction.x) != sign(velocity.x): 
			velocity.x *= 0.75
		
		parent_entity.velocity = velocity

		var cardinal_direction = get_cardinal_direction(move_direction)
		var direction_string = "run_" + directions_dict.get(cardinal_direction)

		if parent_entity.sprite.animation != direction_string:
			print("changing move animation")
			parent_entity.sprite.play(direction_string)

		parent_entity.move_and_slide()
	elif attack_component.can_attack:
		var cardinal_direction = get_cardinal_direction(move_direction)
		var direction_string = "idle_" + directions_dict.get(cardinal_direction)		
		if parent_entity.sprite.animation != direction_string:
			parent_entity.sprite.play(direction_string)
		parent_entity.velocity = parent_entity.velocity.move_toward(Vector2.ZERO, (1.0 / acceleration_time) * delta)
	
	received_input_this_frame = false

	
# func _process(delta: float) -> void:
# 	if Input.is_action_pressed("left"):
# 		sprite.play("run_left")
# 		facing_string = "left"
# 		parent_entity.facing = Vector2(-1, 0)
# 	elif Input.is_action_pressed("right"):
# 		sprite.play("run_right")
# 		facing_string = "right"
# 		parent_entity.facing = Vector2(1, 0)
# 	elif Input.is_action_pressed("up"):
# 		sprite.play("run_up")
# 		facing_string = "up"
# 		parent_entity.facing = Vector2(0, -1)
# 	elif Input.is_action_pressed("down"):
# 		sprite.play("run_down")
# 		facing_string = "down"
# 		parent_entity.facing = Vector2(0, 1)
# 	elif !Input.is_anything_pressed() and attack_component.can_attack:
# 		match parent_entity.facing:
# 			Vector2(-1, 0):
# 				sprite.play("idle_left")
# 			Vector2(1, 0):
# 				sprite.play("idle_right")
# 			Vector2(0, -1):
# 				sprite.play("idle_up")
# 			Vector2(0, 1):
# 				sprite.play("idle_down")
# 			_:
# 				sprite.play("idle_down")
	
