extends CanvasLayer


func _ready() -> void:
	globals.playmusic.emit()
	%StartButton.call_deferred("grab_focus")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://interface/menus/scenes/character_select.tscn")


func _on_settings_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
