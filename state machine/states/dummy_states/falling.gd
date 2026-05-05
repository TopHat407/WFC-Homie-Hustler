extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.anim.play("fall")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	enemy.velocity.x = enemy.speed * input_direction_x
	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()

	if enemy.is_on_floor():
		if is_equal_approx(input_direction_x, 0.0):
			finished.emit(IDLE)
