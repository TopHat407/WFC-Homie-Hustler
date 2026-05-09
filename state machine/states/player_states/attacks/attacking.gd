extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	player.animation_player.play("attack")

func physics_update(_delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	await player.animation_player.animation_finished
	if Input.is_action_just_pressed("up"):
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




func _on_player_playerlose() -> void:
	player.lose = true


func _on_player_playerwin() -> void:
	player.win = true
