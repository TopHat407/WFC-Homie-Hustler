extends Node2D

@onready var reset_timer: Timer = $"Reset Timer"
var gameover = false

func _ready() -> void:
	TransitionManager.anim.play("fade out")
	await TransitionManager.anim.animation_finished
	globals.ACTIVE = true

func _on_reset_timer_timeout() -> void:
	TransitionManager.anim.play("fade in")
	await TransitionManager.anim.animation_finished
	get_tree().change_scene_to_file("res://interface/menus/scenes/menu.tscn")
