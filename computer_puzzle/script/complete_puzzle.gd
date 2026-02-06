extends Control

@export var finish: ColorRect

func _ready():
	GameSignals.solution_checked.connect(_on_solution_checked)
	if GameSignals.puzzle_solved:
		_lock_scene()

func _on_solution_checked(correct: bool):
	if correct:
		GameSignals.puzzle_solved = true
		await get_tree().create_timer(0.2).timeout
		_lock_scene()
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/tutorial.dialogue"), "komputer2")
	

func _lock_scene():
	GlobalC.open = true
	finish.visible = true
	finish.modulate = Color(0.102, 0.937, 0.0, 0.29)  

		
