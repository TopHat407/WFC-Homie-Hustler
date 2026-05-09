extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("fall")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if Input.is_action_pressed("up"):
		if Input.is_action_just_pressed("B"):
			finished.emit(UP_SPECIAL)
	elif Input.is_action_just_pressed("B"):
		finished.emit(NEUTRAL_SPECIAL)
	elif player.is_on_floor():
		if is_equal_approx(input_direction_x, 0.0):
			finished.emit(IDLE)
		else:
			if Input.is_action_pressed("right"):
				finished.emit(FORWARD)
			elif Input.is_action_pressed("left"):
				finished.emit(BACKWARD)
	elif Input.is_action_pressed("right"):
		if Input.is_action_just_pressed("A"):
			finished.emit(FORWARD_AIR)
	elif Input.is_action_pressed("left"):
		if Input.is_action_just_pressed("A"):
			finished.emit(BACK_AIR)
	elif Input.is_action_pressed("up"):
		if Input.is_action_just_pressed("A"):
			finished.emit(UP_AIR)
	elif Input.is_action_pressed("down"):
		if Input.is_action_just_pressed("A"):
			finished.emit(DOWN_AIR)
	elif Input.is_action_just_pressed("A"):
			finished.emit(NEUTRAL_AIR)
