class_name stageselect extends CanvasLayer



func _ready() -> void:
	%Stage1.call_deferred("grab_focus")

func _on_stage_1_pressed() -> void:
	globals.stage1.emit()
	get_tree().change_scene_to_file("res://levels/test_scenes/2d_test_scene.tscn")
