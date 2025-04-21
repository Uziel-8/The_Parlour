extends Area2D

@onready var hurtbox_parent: CharacterBody2D = get_owner()
@onready var movement_component = $"../MovementComponent"
var enemies_in_range = []

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	var offset = 34.0
	position = movement_component.facing2 * offset
	rotation = movement_component.facing2.angle()
	
	


func _ready() -> void:
	print("hello from hurtbox_component")
	connect("area_exited", Callable(self, "_on_area_exited"))
	if not is_connected("area_entered", Callable(self, "_on_area_entered")):
		print("Connecting area_entered signal")
		connect("area_entered", Callable(self, "_on_area_entered"))
	else: 
		print("already connected")
	connect("body_entered", Callable(self, "on_body_entered"))
	



func _on_body_entered(body) -> void:
	pass



func update_attack_direction():
	pass
	



func _on_area_entered(area: Area2D) -> void:
	print("area entered", area)
	if area.is_in_group("enemies"):
		print("found an enemy")
		if not enemies_in_range.has(area):
			enemies_in_range.append(area)
	else:
		print("I come in peace")


func _on_area_exited(area: Area2D) -> void:
	enemies_in_range.erase(area)
