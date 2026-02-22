extends Control

@export var audio_player: AudioStreamPlayer2D

func _on_exit_pressed() -> void:
	audio_player.play()
	await audio_player.finished
	get_tree().quit()
