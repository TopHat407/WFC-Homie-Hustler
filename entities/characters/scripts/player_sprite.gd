extends Node

@onready var anim: AnimationPlayer = %Anim


func _ready() -> void:
	anim.play("idle")

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("X"):
		anim.play("debug_attack")
		await anim.animation_finished
		anim.play("idle")
