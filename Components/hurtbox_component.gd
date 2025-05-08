extends Area2D

@onready var hurtbox_parent: CharacterBody2D = get_owner()
# change this to take the facing property strate from parent. 
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
	# we could think about making HitboxComponent a class. Could we then specify that area is a HitboxComponent?
	print("area entered", area)
	# will have to change the target group to 'damageable' or something
	if area.is_in_group("enemies"):
		print("found an enemy")
		if not enemies_in_range.has(area):
			# we are assuming here that the area we have detected is a hitbox. 
			# if we have set up our layers properly then it will be, but should also check for a take_damage function.
			# I haven't decided whether this check should be in the attack_component or here. 
			enemies_in_range.append(area)
	else:
		print("I come in peace")


func _on_area_exited(area: Area2D) -> void:
	enemies_in_range.erase(area)
