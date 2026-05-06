class_name audio extends AudioStreamPlayer

@onready var sound_manager: audio = $"."


func _ready() -> void:
	globals.stage1.connect(pause)
	globals.playmusic.connect(startmusic)

func startmusic():
	sound_manager.play()

func pause():
	sound_manager.stop()
