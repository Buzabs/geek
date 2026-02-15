extends Node2D

@export var pause_scene: PackedScene
func _ready():
	GameSignals.solution_checked.connect(_on_solution_checked)


func _on_solution_checked():
		$AnimatedSprite2D.visible=true
		GameSignals.puzzle_solved = true
		GlobalC.dialog = false
		GlobalC.open= false
		GlobalC.first_play = true
		GlobalC.first_play_next = true
		GlobalC.next_dialog = false
		GlobalC.rzut=true
		
		
		
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "k_planety")
		await DialogueManager.dialogue_ended
		
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "teleportacja")
		$AnimatedSprite2D.play("koniec")
		await $AnimatedSprite2D.animation_finished
		get_tree().change_scene_to_file("res://scenes/level_1/anglia.tscn")
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "teleportacja")
	

		
	
