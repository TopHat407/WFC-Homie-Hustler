class_name characterselect extends CanvasLayer

signal character1

func _ready() -> void:
	%Character1.call_deferred("grab_focus")

func _physics_process(delta: float) -> void:
	if %Character1.has_focus():
		$Player1.scale.x = 3.0
		$Player1.scale.y = 3.0
		
		$Player1.texture = load("res://interface/menus/assets/Prototype Character Select.png")
	else:
		$Player1.scale.x = 3.0
		$Player1.scale.y = 3.0
		$Player1.texture = load("res://interface/menus/assets/Locked Character Select.png")

func _on_character_1_pressed() -> void:
	character1.emit()
	get_tree().change_scene_to_file("res://interface/menus/scenes/stage_select.tscn")
