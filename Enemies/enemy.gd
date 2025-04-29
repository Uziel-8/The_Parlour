extends CharacterBody2D

var health: int = 100
var exp_drop = 150
var dead: bool = false
var damage = 20
var follow_range: int
var follow_speed: int
var wander_speed: int
var initial_state: String
var sprite = get_child(0)

@export var stats: orc_data

func _ready() -> void:
	if stats: 
		print("the orc_data attached to the enemy is: ", orc_data)
		health = stats.health
		damage = stats.damage
		follow_range = stats.follow_range
		follow_speed = stats.follow_speed
		wander_speed = stats.wander_speed
		initial_state = stats.initial_state
		exp_drop = stats.exp_drop



func _physics_process(delta: float) -> void:
	move_and_slide()


func _process(delta: float) -> void:
	die()

func die():
	if health <= 0:
		queue_free()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("someone entered me!!")
	if body.is_in_group("players"):
		var hit_box_component = body.get_node("HitBoxComponent")
		hit_box_component.apply_damage(damage, null)
