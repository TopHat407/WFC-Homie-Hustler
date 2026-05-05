class_name Player extends CharacterBody2D

@onready var animation_player: AnimatedSprite2D = %PlayerSprite

@export var speed := 100.0
@export var gravity := 1000.0
@export var jump_impulse := 300.0

var win = false
var lose = false

signal hit_player
signal playerwin
signal playerlose

func _on_area_2d_area_entered(area: Area2D) -> void:
	hit_player.emit()


func _on_canvas_layer_lose() -> void:
	playerwin.emit()


func _on_canvas_layer_win() -> void:
	playerlose.emit()
