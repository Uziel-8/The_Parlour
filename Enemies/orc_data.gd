class_name orc_data
extends Resource


@export var health: int = 100
@export var damage: int = 20
@export var attack_range: int = 30
@export var exp_drop: int = 50
@export var attack_cooldown: float = 1.0

@export var speed: float =   70.0
@export var acceleration_time: float = 2.5
@export var friction: float = 1.0
@export var follow_speed: int = 30
@export var wander_speed: int = 20

@export var follow_range: int = 100
@export var initial_state: String = "wander"

@export var sprite_frames: SpriteFrames
