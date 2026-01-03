extends Control

@export var finish: ColorRect

func _ready():
	GameSignals.solution_checked.connect(_on_solution_checked)
	if GameSignals.puzzle_solved:
		_lock_scene()

func _on_solution_checked(correct: bool):
	if correct:
		GameSignals.puzzle_solved = true
		_lock_scene()

func _lock_scene():
	finish.visible = true
	finish.modulate = Color(0.102, 0.937, 0.0, 0.29)  

var puzzle_states : Dictionary = {}
