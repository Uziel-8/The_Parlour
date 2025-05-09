extends Node

class_name Inventory

var items: Array[Item]

const IRON_ORE : Item = preload("res://Resources/Items/iron_ore.tres")
const IRON_BAR : Item = preload("res://Resources/Items/iron_bar.tres")
const COAL : Item = preload("res://Resources/Items/coal.tres")

func _ready() -> void:
	#print(items[0])
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed("inventory"):
		print(items[0])
		print(items[1])
		print(items[2])

func add_item(item: Item):
	items.append(item)
	print("added item:", item.item_name)
