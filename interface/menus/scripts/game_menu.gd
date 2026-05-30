extends CanvasLayer

func _ready() -> void:
	SoundManager.stream = preload("res://assets/sounds and music/funk loop.mp3")
	SoundManager.play()
	TransitionManager.anim.play("fade out")
	%NETWORK.call_deferred("grab_focus")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("B") and $HBoxContainer/NETWORK/Panel.visible == true:
		SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
		SoundManager.ButtonPlayer.play()
		$HBoxContainer/NETWORK/Panel.visible = false
		%NETWORK.call_deferred("grab_focus")
	elif Input.is_action_just_pressed("B") and $HBoxContainer/NETWORK/Panel.visible == false:
		SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
		SoundManager.ButtonPlayer.play()
		TransitionManager.anim.play("fade in")
		await TransitionManager.anim.animation_finished
		get_tree().change_scene_to_file("res://interface/menus/scenes/menu.tscn")


func _on_network_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()
	$HBoxContainer/NETWORK/Panel.visible = true
	$HBoxContainer/NETWORK/Panel/VBoxContainer/ONLINE.call_deferred("grab_focus")


func _on_local_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()


func _on_dojo_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()
	TransitionManager.anim.play("fade in")
	await TransitionManager.anim.animation_finished
	get_tree().change_scene_to_file("res://interface/menus/scenes/character_select.tscn")


func _on_story_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()


func _on_quit_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()
	$ColorRect.visible = true
	$ColorRect/HBoxContainer/CONFIRM.call_deferred("grab_focus")


func _on_confirm_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()
	TransitionManager.anim.play("fade in")
	await TransitionManager.anim.animation_finished
	get_tree().call_deferred("quit")


func _on_cancel_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()
	$ColorRect.visible = false
	$HBoxContainer/QUIT.call_deferred("grab_focus")


func _on_online_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()


func _on_pong_3_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()


func _on_lobby_pressed() -> void:
	SoundManager.ButtonPlayer.stream = load("res://assets/sounds and music/833601__subquire__aggressive-button-tap-ui-tap-hit.wav")
	SoundManager.ButtonPlayer.play()
