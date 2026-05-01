#virtual base class for all states
#extend this class and override its methods to implement a state
class_name State extends Node

#emitted when the state finishes and wants to transition to another state
signal finished(next_state_path: String, data: Dictionary)

#called by the state machine when receiving unhandled input events
func handle_input(_event: InputEvent) -> void:
	pass

#called by the state machine on the engine's main loop tick
func update(_delta: float) -> void:
	pass

#called by the state machine on the engine's physics update tick
func physics_update(_delta: float) -> void:
	pass

#called by the state machine upon changing the active state. The 'data' parameter
#is a dictionary with arbitrary data the state can use to initialise itself
func enter(previous_state_path: String, data := {}) -> void:
	pass

#called by the state machine before changing the active state. use this function
#to clean up the state
func exit() -> void:
	pass
