extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("up_special")
	
	


func physics_update(_delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	await player.animation_player.animation_finished
	if Input.is_action_just_pressed("up") and player.is_on_floor_only():
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	elif Input.is_action_pressed("right"):
		finished.emit(FORWARD)
	elif Input.is_action_pressed("left"):
		finished.emit(BACKWARD)
	elif player.win == true:
		finished.emit(WIN)
	elif player.lose == true:
		finished.emit(LOSE)
