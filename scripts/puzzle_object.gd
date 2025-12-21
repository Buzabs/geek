extends Area2D

@export var target_scene: String

var is_clicked: bool = false

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		is_clicked = true


func _on_computer_check_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and is_clicked:
		get_tree().change_scene_to_file.call_deferred(target_scene)
