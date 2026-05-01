extends CharacterBody2D

@onready var health: TextureProgressBar = %PlayerHealth
@onready var camera: Camera2D = $"../Camera2D"
@onready var player_sprite: AnimatedSprite2D = %PlayerSprite

const SPEED = 100.0
const BACK_SPEED = 50.0
const JUMP_VELOCITY = -300.0

var health_num = 100

func _ready() -> void:
	health.value = 100

func _physics_process(delta: float) -> void:
	#health.value += lerp(0, health_num, 0.3 * delta)
	movement(delta)
	move_and_slide()

func movement(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("up"):
		velocity.y = JUMP_VELOCITY
	
	var direction := Input.get_axis("left", "right")
	if Input.is_action_pressed("right"):
		velocity.x = direction * SPEED
		#player_sprite.play("run")
	elif Input.is_action_pressed("left"):
		velocity.x = direction * BACK_SPEED
		#player_sprite.play("back_walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#player_sprite.play("idle")
	

func hurt():
	camera.add_trauma(1)
	health.value -= 10

func _on_hurtbox_area_entered(_area: Area2D) -> void:
	hurt()
