extends CharacterBody2D

@onready var player_interaction_range: Area2D = $PlayerInteractionRange
@export var movement_speed = 300.0

enum FACINGS {UP, DOWN, LEFT, RIGHT}
enum STATES {IDLE, MOVING, TALKING}
var current_facing := FACINGS.DOWN
var current_state := STATES.IDLE

func _physics_process(delta: float) -> void:
	var direction : Vector2 = get_movement_input()
	update_facing(direction)
	
	if current_state != STATES.TALKING:
		player_interaction_range.look_at(position + direction)
		handle_movement(direction)
		
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func get_movement_input() -> Vector2:
	return Input.get_vector("left", "right", "up", "down")

func update_facing(input_direction : Vector2) -> void:
	if input_direction.y != 0:
		current_facing = FACINGS.UP if input_direction.y > 0 else FACINGS.DOWN
	elif input_direction.x != 0:
		current_facing = FACINGS.LEFT if input_direction.y > 0 else FACINGS.RIGHT

func handle_movement(input_direction : Vector2) -> void:
	if input_direction:
		velocity = input_direction * movement_speed
	else:
		velocity = Vector2.ZERO
