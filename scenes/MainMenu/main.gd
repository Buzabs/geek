extends CanvasLayer

@export var audio_manager: AudioStreamPlayer2D

func _on_start_pressed() -> void:
	audio_manager.play()
	await audio_manager.finished
	get_tree().change_scene_to_file("res://scenes/tutorial/test_scene.tscn")


func _on_exit_pressed() -> void:
	audio_manager.play()
	await audio_manager.finished
	get_tree().quit()
