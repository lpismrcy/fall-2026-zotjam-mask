extends CharacterBody2D

@onready var player_interaction_range: Area2D = $PlayerInteractionRange

@export var movement_speed = 300.0

enum STATES {IDLE, MOVING, TALKING}
var current_state := STATES.IDLE

func _physics_process(delta: float) -> void:
	var direction : Vector2 = get_movement_input()
	if current_state != STATES.TALKING:
		player_interaction_range.look_at(position + direction)
		if direction:
			velocity = direction * movement_speed
		else:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

	move_and_slide()
