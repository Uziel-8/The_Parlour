extends Node

signal move_command(direction)
signal basic_attack



func _process(delta: float) -> void:
    handle_move_input()

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("left_click"):
        basic_attack.emit()

func handle_move_input():
    var direction = Input.get_vector("left", "right", "up", "down")
    # if direction != Vector2.ZERO:
    #     move_command.emit(direction)


