extends CanvasLayer

@onready var label: Label = $Label

func _ready() -> void:
	SoundManager.stream = preload("res://assets/sounds and music/Homie Hustler Title Screen.mp3")
	SoundManager.play()
	TransitionManager.anim.play("fade out")
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
		SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
		SoundManager.ButtonPlayer.play()
		TransitionManager.anim.play("fade in")
		await TransitionManager.anim.animation_finished
		
		get_tree().call_deferred("change_scene_to_file", "res://interface/menus/scenes/game_menu.tscn")
