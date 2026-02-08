extends Node2D

var movement_cursor = load("res://sprites/Other/movement_cursor.png")
var door_cursor = load("res://sprites/Other/door_curor.png")
var dialogue_cursor = load("res://sprites/Other/dialogue_cursor.png")

func _on_area_2d_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(door_cursor)

func _on_area_2d_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)

func _on_zielarka_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(dialogue_cursor)

func _on_zielarka_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)
