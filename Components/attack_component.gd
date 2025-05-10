extends Node

# this is too tied up with the function of the player. NOT ANYMORE BITCH!!!

# @onready var sprite = $"../AnimatedSprite2D"
# @onready var player: CharacterBody2D = get_owner()
# @onready var hurtbox = $"../HurtboxComponent"
# @onready var movement_component = $"../MovementComponent"


@onready var attacking_entity = get_owner()
@onready var facing: Vector2 = attacking_entity.facing

@export var hurtbox_component_path: NodePath 
@onready var hurtbox = get_node(hurtbox_component_path)

@export var trigger_source_path: NodePath

@export var movement_component_path: NodePath
@onready var movement_component = get_node(movement_component_path)

@onready var timer = $Timer


# Think about whether these two should live in the entities or here
var is_attacking = false
var can_attack: bool = true

var attack_directions: Dictionary = {
	Vector2.LEFT: "attack_left",
	Vector2.RIGHT: "attack_right",
	Vector2.DOWN: "attack_down",
	Vector2.UP: "attack_up"
}

func is_ready_to_attack() -> bool:
	return can_attack

func _ready() -> void:
	var trigger_source = get_node_or_null(trigger_source_path)

	if trigger_source:
		trigger_source.basic_attack.connect(perform_attack)
	else:
		print("no trigger source has been attached to this component ;_;")
	
	

func _process(delta: float) -> void:
	pass

		


func perform_attack():
	if can_attack:
		can_attack = false
		is_attacking = true
		var attack_animation = attack_directions.get(attacking_entity.facing)
		attacking_entity.sprite.play(attack_animation)
		timer.wait_time = attacking_entity.attack_cooldown
		timer.start()
		for enemy in hurtbox.enemies_in_range:
			print("applying damage to enemies in range.")
			enemy.apply_damage(attacking_entity.damage, attacking_entity)
		
			print("attack hit ", enemy)
	else:
		print("I cannot attack right now ;_;")

func _on_timer_timeout() -> void:
	can_attack = true 
	is_attacking = false
	
