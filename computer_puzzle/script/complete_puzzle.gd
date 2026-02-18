extends Control

@export var finish: ColorRect
@export var button_icon: Texture2D

func _ready():
	GameSignals.solution_checked.connect(_on_solution_checked)
	if GameSignals.puzzle_solved:
		_lock_scene()

func _on_solution_checked():
		GameSignals.puzzle_solved = true
		_lock_scene()
		GlobalC.open = true
		await get_tree().create_timer(0.2).timeout
		
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "komputer2")
	

func _lock_scene():
	

	finish.visible = true
	finish.modulate = Color(0.102, 0.937, 0.0, 0.29)  

		
