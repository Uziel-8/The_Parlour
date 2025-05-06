extends CanvasLayer

@onready var player = get_owner().find_child("Player")
@onready var health_bar = $BarContainer/HealthBar
@onready var mana_bar = $BarContainer/ManaBar
@onready var exp_bar = $BarContainer/ExpBar
@onready var level_label = $MarginContainer/Label


func _process(delta: float) -> void:
	health_bar.value = player.health
	health_bar.max_value = player.max_health
	
	mana_bar.value = player.mana
	
	exp_bar.value = player.exp
	exp_bar.max_value = player.level_threshold
	
	level_label.text = str(player.level)
