extends EnemyState

var is_hit = false


func enter(previous_state_path: String, data := {}) -> void:
	enemy.velocity.x = 0.0
	enemy.anim.play("idle")

func _on_dummy_hit_enemy() -> void:
	is_hit = true

func _on_dummy_dummylose() -> void:
	dead = true

func physics_update(_delta: float) -> void:
	enemy.velocity.y += enemy.gravity * _delta
	enemy.move_and_slide()
	
	if not enemy.is_on_floor():
		finished.emit(FALLING)
	elif is_hit == true:
		finished.emit(HURT)
		is_hit = false
	elif dead == true:
		finished.emit(LOSE)
