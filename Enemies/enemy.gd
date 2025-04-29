extends CharacterBody2D

var health: int = 100
var exp_drop = 150
var dead: bool = false
var damage = 20
var sprite = get_child(0)

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
