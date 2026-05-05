class_name PlayerState extends State

const IDLE = "Idle"
const FORWARD = "Forward"
const BACKWARD = "Backward"
const JUMPING = "Jumping"
const FALLING = "Falling"
const ATTACKING = "Attacking"
const NEUTRAL_SPECIAL = "Neutral_Special"
const FORWARD_SPECIAL = "Forward_Special"
const WIN = "Win"
const LOSE = "Lose"

var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the 
	owner to be a Player node")
