extends CanvasLayer

@onready var player_health: TextureProgressBar = %PlayerHealth
@onready var cpu_health: TextureProgressBar = %CPUHealth
@onready var winlosescreen: TextureRect = $Control/TextureRect
@onready var winlosetext: Label = $Control/TextureRect/Label

signal win
signal lose

func _ready() -> void:
	player_health.value = 100
	cpu_health.value = 100
	%Dummy.hit_enemy.connect(on_enemy_hit)
	%Player.hit_player.connect(on_player_hit)

func _physics_process(delta: float) -> void:
	if cpu_health.value <= 0:
		win.emit()
		winlosetext.text = "YOU WIN!"
		game_over()
	elif player_health.value <= 0:
		lose.emit()
		winlosetext.text = "YOU LOSE..."
		game_over()

func on_player_hit():
	player_health.value -= 10

func on_enemy_hit():
	cpu_health.value -= 10

func game_over():
	winlosescreen.visible = true
