extends CanvasLayer

@onready var player_health: TextureProgressBar = %PlayerHealth
@onready var cpu_health: TextureProgressBar = %CPUHealth

func _ready() -> void:
	player_health.value = 100
	cpu_health.value = 100
