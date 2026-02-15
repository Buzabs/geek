extends Control

@onready var buttons: VBoxContainer = $Buttons
@export var audio_manager: AudioStreamPlayer2D

var is_paused: bool

func _ready() -> void:
	is_paused = false
	hide()
	$Volume.visible=false
	
func toggle_pause():
	is_paused = !is_paused
	get_tree().paused = is_paused
	
	if is_paused:
		show()
	else:
		hide()

func _on_back_pressed() -> void:
	audio_manager.play()
	await audio_manager.finished
	toggle_pause()


func _on_exit_pressed() -> void:
	audio_manager.play()
	await audio_manager.finished
	get_tree().quit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle_pause()


func _on_volume_pressed() -> void:
	$Volume.visible= true
