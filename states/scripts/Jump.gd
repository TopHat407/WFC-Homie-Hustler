extends State
class_name StateJump
const name: String = "Jump"

var max_speed: float = 300
var speed: float = 1600
var jump: float = -200

func enter():
	character.velocity.y = jump

func exit():
	pass

func process(delta: float):
	if character.is_on_floor() and character.velocity.y > jump:
		switch(StateDefault.name)
		return
	character.velocity.y += gravity * delta
	var direction: int = int(Input.get_axis("ui_left","ui_right"))
	if direction:
		character.velocity.x = move_toward(
			character.velocity.x, max_speed * direction, speed * delta)
	else:
		character.velocity.x = move_toward(
			character.velocity.x, 0.0, speed * delta)
