extends State
class_name StateDefault
const name: String = "Default"

var max_speed: float = 200
var speed: float = 2000

func enter():
	pass

func exit():
	pass

func process(delta: float):
	if not character.is_on_floor():
		character.velocity.y += gravity * delta
	var direction: int = int(Input.get_axis("ui_left","ui_right"))
	if direction:
		character.velocity.x = move_toward(
			character.velocity.x, max_speed * direction, speed * delta)
	else:
		character.velocity.x = move_toward(
			character.velocity.x, 0.0, speed * delta)

func input(event: InputEvent):
	if event is InputEventKey:
		if event.keycode == KEY_UP:
			switch(StateJump.name)
