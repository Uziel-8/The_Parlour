extends CharacterBody2D

var level = 1
var damage = 50
var attack_cooldown: float = 0.33

var health = 100
var max_health: int = 100

var mana = 100
var max_mana: int = 100

var exp = 0
var level_threshold = 100

var facing: Vector2 = Vector2.DOWN

# Doing this is trash and leads to bugs. If a component needs another component it should always get it directly.
@onready var attack_component = $AttackComponent
@onready var movement_component = $MovementComponent
@onready var hurtbox_component = $HurtboxComponent
@onready var hitbox_component = $HitBoxComponent
@onready var input_component = $InputComponent
@onready var sprite = $AnimatedSprite2D



func _process(delta: float) -> void:
	if health <= 0:
		die()
	if exp >= level_threshold:
		level_up()
		exp = 0
		level_threshold = level_threshold * 1.2
	#print(inventory, "Inventory!")

func die():
	#queue_free()
	get_tree().reload_current_scene()

func level_up():
	level += 1
	damage = 50 + (level - 1) * 5
	max_health = 100 + (level - 1) * 10
	health = max_health

	mana = 100 + (level - 1) * 10
	exp = 0
	level_threshold = level_threshold * 2
