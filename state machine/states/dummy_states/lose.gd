extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.anim.play("lose")
