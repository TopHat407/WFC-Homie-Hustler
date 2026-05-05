class_name EnemyState extends State

const IDLE = "Idle"
const FALLING = "Falling"
const HURT = "Hurt"
const WIN = "Win"
const LOSE = "Lose"

var enemy: dummy
var dead = false

func _ready() -> void:
	await owner.ready
	enemy = owner as dummy
	assert(enemy != null, "The EnemyState state type must be used only in the enemy scene. It needs the 
	owner to be a Dummy node")
