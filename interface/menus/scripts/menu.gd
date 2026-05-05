extends CanvasLayer



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/test_scenes/2d_test_scene.tscn")


func _on_settings_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
