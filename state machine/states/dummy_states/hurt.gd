extends EnemyState

@onready var hurt_timer: Timer = $HurtTimer

func enter(previous_state_path: String, data := {}) -> void:
	enemy.anim.play("hurt")
	hurt_timer.start()

func physics_update(_delta: float) -> void:
	await hurt_timer.timeout
	finished.emit(IDLE)
