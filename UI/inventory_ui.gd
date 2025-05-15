extends CanvasLayer

@onready var player = get_owner().find_child("Player")

@onready var sprite1 = $VBoxContainer/HSplitContainer/TextureRect
@onready var sprite2 = $VBoxContainer/HSplitContainer2/TextureRect2
@onready var sprite3 = $VBoxContainer/HSplitContainer3/TextureRect3
@onready var label1 = $VBoxContainer/HSplitContainer/Label
@onready var label2 = $VBoxContainer/HSplitContainer2/Label2
@onready var label3 = $VBoxContainer/HSplitContainer3/Label3


func ready():
	pass

func _process(delta: float) -> void:
	var inventory = player.find_child("inventory")
	print(inventory)
	label1.text = str(inventory.COAL)
