extends CharacterBody2D


@export var movement_speed = 300.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * movement_speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
