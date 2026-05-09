extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("crouch")

func physics_update(_delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	if Input.is_action_just_pressed("up"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0) and not Input.is_action_pressed("down"):
		finished.emit(IDLE)
	elif Input.is_action_pressed("right"):
		finished.emit(FORWARD)
	elif Input.is_action_pressed("left"):
		finished.emit(BACKWARD)
