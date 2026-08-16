extends CharacterBody2D

@export var states : Array[State] = []
var state_name_dict: Dictionary[String, State] = {}
var active_state: State = null

func _ready() -> void:
	for state in states:
		state.character = self
		state_name_dict[state.name] = state
	active_state = states[0]
	active_state.enter()

func switch_state(state_name: String):
	active_state = state_name_dict[state_name]

func _physics_process(delta: float) -> void:
	$Label.text = str(active_state.name)
	if active_state.has_method("process"):
		active_state.process(delta)
	move_and_slide()

func _input(event: InputEvent) -> void:
	if active_state.has_method("input"):
		active_state.input(event)
