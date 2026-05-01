extends CharacterBody2D

@onready var health: TextureProgressBar = %CPUHealth
@onready var camera: Camera2D = $"../Camera2D"

var health_num = 100

func _ready() -> void:
	health.value = 100

func _physics_process(delta: float) -> void:
	#health.value += lerp(0, 100, 0.3 * delta)
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()

func hurt():
	camera.add_trauma(1)
	health.value -= 10

func _on_hurtbox_area_entered(_area: Area2D) -> void:
	hurt()
