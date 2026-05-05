extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	player.animation_player.play("idle")


func physics_update(_delta: float) -> void:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()
	
	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("up"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("right"):
		finished.emit(FORWARD)
	elif Input.is_action_pressed("left"):
		finished.emit(BACKWARD)
	elif Input.is_action_just_pressed("X"):
		finished.emit(ATTACKING)
	elif Input.is_action_just_pressed("B"):
		finished.emit(NEUTRAL_SPECIAL)
	elif player.win == true:
		finished.emit(WIN)
	elif player.lose == true:
		finished.emit(LOSE)




func _on_player_playerlose() -> void:
	player.lose = true


func _on_player_playerwin() -> void:
	player.win = true
