class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = %AnimationPlayer

@export var speed := 100.0
@export var gravity := 1000.0
@export var jump_impulse := 300.0

var win = false
var lose = false

signal hit_player
signal playerwin
signal playerlose


func _on_canvas_layer_lose() -> void:
	playerlose.emit()


func _on_canvas_layer_win() -> void:
	playerwin.emit()


func _on_hurtbox_area_entered(area: Area2D) -> void:
	hit_player.emit()
