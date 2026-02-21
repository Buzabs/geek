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
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "komputer2")
		await DialogueManager.dialogue_ended
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _lock_scene():
	

	finish.visible = true
	finish.modulate = Color(0.102, 0.937, 0.0, 0.29)  

		
