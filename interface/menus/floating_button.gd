@tool
extends TextureRect

@onready var mouse_hovering_over: bool = false

@export var angle_x_max: float = 2.0
@export var angle_y_max: float = 2.0
@onready var angle_x_converted: float = 0.0
@onready var angle_y_converted: float = 0.0

@export var disable_sound: bool = false

const NORMAL_SCALE: Vector2 = Vector2.ONE
const HOVER_SCALE: Vector2 = Vector2(1.05,1.05)

@onready var hover_audio_player: AudioStreamPlayer = $Hover
@onready var pressed_audio_player: AudioStreamPlayer = $Pressed
@onready var released_audio_player: AudioStreamPlayer = $Released



signal button_up
signal activated


func _ready():
	if disable_sound:
		hover_audio_player.stream = null
		pressed_audio_player.stream = null
		released_audio_player.stream = null

	angle_x_converted = deg_to_rad(angle_x_max)
	angle_y_converted = deg_to_rad(angle_y_max)

	if texture:
		material["shader_parameter/rect_size"] = self.texture.size
	pivot_offset_ratio = Vector2(0.5,0.5)
	#self.pivot_offset = Vector2(self.texture.size.x/2, self.texture.size.y/2)

	button_up.connect(_on_button_up)

	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)
	self.gui_input.connect(_on_gui_input)



func _on_button_up():
	send_activated_signal()




func activate():
	var activate_tween = create_tween()
	activate_tween.parallel().tween_property(material, "shader_parameter/modulate", Color.hex(0x7eff68ff), 0.05)
	await activate_tween.finished
	activated.emit()


func deactivate():
	var deactivate_tween = create_tween()
	deactivate_tween.tween_property(material, "shader_parameter/modulate", Color.hex(0xffffffff), 0.05)


func send_activated_signal():
	var pressed_tween = create_tween()
	pressed_tween.tween_property(material, "shader_parameter/modulate", Color.hex(0xabababff), 0.05)
	activated.emit()




func _on_mouse_entered():
	mouse_hovering_over = true
	hover_audio_player.play()
	var scale_tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN_OUT)
	scale_tween.tween_property(self,"scale",HOVER_SCALE,0.12)
	_update_mouse_position_rotation()


func _on_mouse_exited():
	mouse_hovering_over = false
	var scale_tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN_OUT)
	scale_tween.tween_property(self,"scale",NORMAL_SCALE,0.2)
	deactivate()


func _on_gui_input(event):
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			pressed_audio_player.play()
			var scale_tween = create_tween()
			scale_tween.tween_property(self,"scale",HOVER_SCALE*0.90,0.05)
			scale_tween.parallel().tween_property(material, "shader_parameter/modulate", Color.hex(0x7eff68ff), 0.05)
		elif mouse_hovering_over:
			released_audio_player.play()
			var scale_tween = create_tween()
			scale_tween.tween_property(self,"scale",NORMAL_SCALE,0.05)
			button_up.emit()
			deactivate()


func _physics_process(delta):
	if mouse_hovering_over:
		_update_mouse_position_rotation()
	else:
		material["shader_parameter/x_rot"] = lerpf(material["shader_parameter/x_rot"], 0.0, delta*10)
		material["shader_parameter/y_rot"] = lerpf(material["shader_parameter/y_rot"], 0.0, delta*10)


func _update_mouse_position_rotation():
	var mouse_pos: Vector2 = get_local_mouse_position()


	var lerp_val_x: float = remap(mouse_pos.x, 0.0, size.x, 0, 1)
	var lerp_val_y: float = remap(mouse_pos.y, 0.0, size.y, 0, 1)



	var rot_x: float = rad_to_deg(lerp_angle(-angle_x_converted, angle_x_converted, lerp_val_x))
	var rot_y: float = rad_to_deg(lerp_angle(angle_y_converted, -angle_y_converted, lerp_val_y))


	material.set_shader_parameter("x_rot", rot_y)
	material.set_shader_parameter("y_rot", rot_x)
