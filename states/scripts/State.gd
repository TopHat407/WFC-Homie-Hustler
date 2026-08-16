@abstract
extends Resource
class_name State


const gravity: float = 980

var character: CharacterBody2D = null

@abstract
func enter()

@abstract
func exit()

func switch(state_name: String):
	if character:
		character.active_state.exit()
		character.switch_state(state_name)
		character.active_state.enter()
