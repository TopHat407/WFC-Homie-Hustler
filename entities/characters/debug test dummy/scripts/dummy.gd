class_name dummy extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
signal hit_enemy
signal dummylose
signal dummywin

@export var speed := 100.0
@export var gravity := 1000.0
@export var jump_impulse := 300.0


func _on_area_2d_area_entered(area: Area2D) -> void:
	hit_enemy.emit()


func _on_canvas_layer_win() -> void:
	dummylose.emit()


func _on_canvas_layer_lose() -> void:
	pass # Replace with function body.
