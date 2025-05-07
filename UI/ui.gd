extends CanvasLayer

@onready var player = get_owner().find_child("Player")
@onready var health_bar = $BarContainer/HealthBar
@onready var mana_bar = $BarContainer/ManaBar
@onready var exp_bar = $BarContainer/ExpBar
@onready var level_label = $MarginContainer/Label

func _process(delta: float) -> void:
	if health_bar.max_value != float(player.max_health):
		health_bar.max_value = float(player.max_health)
	
	if health_bar.value != float(player.health):
		health_bar.value = float(player.health)
	
	
	if mana_bar.value != float(player.mana):
		mana_bar.value = player.mana
	
	if exp_bar.value != float(player.exp):
		exp_bar.value = player.exp

	if exp_bar.max_value != float(player.level_threshold):
		exp_bar.max_value = player.level_threshold
	
	if level_label.text != str(player.level):
		level_label.text = str(player.level)
