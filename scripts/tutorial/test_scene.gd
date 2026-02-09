extends Node

@export var pause_scene: PackedScene

var movement_cursor = load("res://sprites/Other/movement_cursor.png")
var interaction_cursor = load("res://sprites/Other/cog_cursor.png")
var door_cursor = load("res://sprites/Other/door_curor.png")
var dialogue_cursor = load("res://sprites/Other/dialogue_cursor.png")

#func _process(_delta):
	
#	if Input.is_action_just_pressed("pause"):
#		if get_tree().paused:
#			get_tree().paused = false
#			get_parent().queue_free()
#			return
#		Pausa.toggle_pause(pause_scene)


func _on_computer_click_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(interaction_cursor)

func _on_computer_click_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)

func _on_drzwi_area_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(door_cursor)

func _on_drzwi_area_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)

func _on_area_2d_3_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(interaction_cursor)

func _on_area_2d_3_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)

func _on_area_2d_2_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(interaction_cursor)

func _on_area_2d_2_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)

func _on_drzwi_mag_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(door_cursor)

func _on_drzwi_mag_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)
	
func _on_drzwi_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(door_cursor)

func _on_drzwi_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)
	
func _on_grandma_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(dialogue_cursor)

func _on_grandma_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)
