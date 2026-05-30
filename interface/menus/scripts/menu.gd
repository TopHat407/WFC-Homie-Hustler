extends CanvasLayer

@onready var label: Label = $Label

func _ready() -> void:
	globals.playmusic.emit()
	fade_in_and_out()

func fade_in_and_out():
	var tween = create_tween().set_loops()
	
	# Fade in over 1 second (from 0 to 1)
	tween.tween_property(label, "modulate:a", 1.0, 3.0)

	# Wait for 1 second
	tween.tween_interval(0.2)
	
	# Fade out over 1 second (from 1 to 0)
	tween.tween_property(label, "modulate:a", 0.0, 3.0)
	
	# Wait for another 1 second before the loop restarts
	tween.tween_interval(0.2)

func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton:
		TransitionManager.anim.play("fade in")
		await TransitionManager.anim.animation_finished
		get_tree().call_deferred("change_scene_to_file", "res://interface/menus/scenes/game_menu.tscn")
