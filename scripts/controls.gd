extends TextureRect

@onready var controls_button = $"../ControlsButton"
@onready var controls_back = $ControlsBack
@onready var pause_bg = $"../PauseBg"

@export var audio_manager: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	controls_back.visible = false


func _on_controls_button_pressed() -> void:
	audio_manager.play()
	await audio_manager.finished
	visible = true
	controls_button.visible = false
	controls_back.visible = true
	pause_bg.visible = false
	

func _on_controls_back_pressed() -> void:
	audio_manager.play()
	await audio_manager.finished
	controls_button.visible = true
	pause_bg.visible = true
	visible = false
	controls_back.visible = false
