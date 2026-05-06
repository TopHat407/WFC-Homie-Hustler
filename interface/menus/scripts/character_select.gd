extends CanvasLayer

signal character1

func _ready() -> void:
	%Character1.call_deferred("grab_focus")

func _on_character_1_pressed() -> void:
	character1.emit()
	get_tree().change_scene_to_file("res://interface/menus/scenes/stage_select.tscn")
