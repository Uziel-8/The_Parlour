extends CharacterBody2D

class_name Enemy

var health: int = 100
var exp_drop = 150
var dead: bool = false
var damage = 20
var follow_range: int
var follow_speed: int
var wander_speed: int
var initial_state: String
var move_direction : Vector2
var facing: Vector2
var attack_cooldown: float

@onready var health_bar = $VBoxContainer/TextureProgressBar
@export var stats: orc_data
@onready var sprite = $AnimatedSprite2D
@onready var attack_component = $AttackComponent
@onready var hurtbox_component = $HurtboxComponent
@onready var hitbox_component = $HitBoxComponent

func _ready() -> void:
	# what is the point in doing this if in the state components we are just grabbing the whole stats property directly?
	# I will look to make all stats bundled into the resource and get rid of this.
	# Rename orc_stats resource to just be EnemyStats (or even just stats)
	if stats: 
		print("the orc_data attached to the enemy is: ", orc_data)
		health = stats.health
		damage = stats.damage
		follow_range = stats.follow_range
		follow_speed = stats.follow_speed
		wander_speed = stats.wander_speed
		initial_state = stats.initial_state
		exp_drop = stats.exp_drop
		attack_cooldown = stats.attack_cooldown

		if stats.sprite_frames != null:
			sprite.sprite_frames = stats.sprite_frames
			sprite.play("idle_front")
			facing = Vector2(0, 1)



func _physics_process(delta: float) -> void:
	move_and_slide()


func _process(delta: float) -> void:
	if stats:
		health_bar.max_value = stats.health
	health_bar.value = health
	# This is no good. The new regime demands that entities hold no logic. 
	die()

# At some point remove death logic from the enemy.
func die():
	if health <= 0:
		queue_free()
	

# Refector this into a hurtbox_component
func _on_area_2d_body_entered(body: Node2D) -> void:
	# print("someone entered me!!")
	# if body.is_in_group("players"):
	# 	var hit_box_component = body.get_node("HitBoxComponent")
	# 	hit_box_component.apply_damage(damage, null)
	pass	
