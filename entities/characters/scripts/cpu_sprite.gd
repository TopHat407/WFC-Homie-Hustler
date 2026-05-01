extends AnimatedSprite2D

@onready var anim: AnimationPlayer = %CPUAnim
@onready var timer: Timer = $"../Timer"

func _ready() -> void:
	anim.play("idle")

func _on_timer_timeout() -> void:
	anim.play("debug_attack")
	await anim.animation_finished
	anim.play("idle")
	timer.start()
