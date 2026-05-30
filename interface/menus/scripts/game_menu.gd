extends CanvasLayer

func _ready() -> void:
	TransitionManager.anim.play("fade out")
	%NETWORK.call_deferred("grab_focus")


func _on_network_pressed() -> void:
	pass # Replace with function body.


func _on_local_pressed() -> void:
	pass # Replace with function body.


func _on_dojo_pressed() -> void:
	TransitionManager.anim.play("fade in")
	await TransitionManager.anim.animation_finished
	get_tree().change_scene_to_file("res://interface/menus/scenes/character_select.tscn")


func _on_story_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	$ColorRect.visible = true
	$ColorRect/HBoxContainer/CONFIRM.call_deferred("grab_focus")


func _on_confirm_pressed() -> void:
	TransitionManager.anim.play("fade in")
	await TransitionManager.anim.animation_finished
	get_tree().call_deferred("quit")


func _on_cancel_pressed() -> void:
	$ColorRect.visible = false
	$HBoxContainer/QUIT.call_deferred("grab_focus")
