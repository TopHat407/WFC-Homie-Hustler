class_name stageselect extends CanvasLayer

@onready var texture_rect: TextureRect = %TextureRect



func _ready() -> void:
	TransitionManager.anim.play("fade out")
	%Stage1.call_deferred("grab_focus")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("B"):
		TransitionManager.anim.play("fade in")
		await TransitionManager.anim.animation_finished
		get_tree().change_scene_to_file("res://interface/menus/scenes/character_select.tscn")
	if %Stage1.has_focus():
		texture_rect.texture = load("res://levels/test_scenes/assets/debug_level.png")
	else:
		texture_rect.texture = load("res://interface/menus/assets/buttons/stage select/Locked Stage Background.png")

func _on_stage_1_pressed() -> void:
	globals.stage1.emit()
	get_tree().change_scene_to_file("res://levels/test_scenes/2d_test_scene.tscn")
