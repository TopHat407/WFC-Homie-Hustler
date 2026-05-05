extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("back_walk")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.is_action_pressed("left")
	player.velocity.x = -player.speed * 0.4
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("up"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	elif Input.is_action_just_pressed("X"):
		finished.emit(ATTACKING)
	elif Input.is_action_just_pressed("B"):
		finished.emit(FORWARD_SPECIAL)
	elif player.win == true:
		finished.emit(WIN)
	elif player.lose == true:
		finished.emit(LOSE)




func _on_player_playerlose() -> void:
	player.win = true


func _on_player_playerwin() -> void:
	player.lose = true
