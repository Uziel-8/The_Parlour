extends Area2D

@export var is_open := false
@onready var sprite = $AnimatedSprite2D
@onready var player = get_node(".")
@onready var inventory: Inventory = player.find_child("inventory")
var coal = preload("res://Resources/Items/coal.tres")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		set_process(true)
		modulate = Color(0.863, 0.144, 0.473, 0.724)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		set_process(false)
		modulate = Color(1.0, 1.0, 1.0)


func _process(delta: float) -> void:
	print(inventory)
	if Input.is_action_just_pressed("interact") and not is_open:
		sprite.play("open")
		is_open = true
		#inventory.add_item(COAL)
		
