extends CanvasLayer

@onready var player = get_owner().get_child(1)
@onready var health_bar = $BarContainer/HealthBar
@onready var mana_bar = $BarContainer/ManaBar
@onready var exp_bar = $BarContainer/ExpBar


func _process(delta: float) -> void:
	health_bar.value = player.health
	mana_bar.value = player.mana
	exp_bar.value = player.exp
	
