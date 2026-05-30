class_name characterselect extends CanvasLayer

signal character1

func _ready() -> void:
	TransitionManager.anim.play("fade out")
	%Character1.call_deferred("grab_focus")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("B"):
		SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
		SoundManager.ButtonPlayer.play()
		TransitionManager.anim.play("fade in")
		await TransitionManager.anim.animation_finished
		get_tree().change_scene_to_file("res://interface/menus/scenes/game_menu.tscn")
	if %Character1.has_focus():
		$Player1.scale.x = 3.0
		$Player1.scale.y = 3.0
		
		$Player1.texture = load("res://interface/menus/assets/buttons/character select/Prototype Character Select.png")
	else:
		$Player1.scale.x = 3.0
		$Player1.scale.y = 3.0
		$Player1.texture = load("res://interface/menus/assets/buttons/character select/Locked Character UI Hover.png")

func _on_character_1_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()
	character1.emit()
	TransitionManager.anim.play("fade in")
	await TransitionManager.anim.animation_finished
	get_tree().change_scene_to_file("res://interface/menus/scenes/stage_select.tscn")
