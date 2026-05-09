extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("neutral_air")

func physics_update(_delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	await player.animation_player.animation_finished
	finished.emit(FALLING)
