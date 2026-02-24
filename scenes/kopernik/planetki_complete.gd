extends Node2D

var target_spawn_id: String ="planetki"
@export var pause_scene: PackedScene

var dialog
var balloon


func _ready():
	GameSignals.solution_checked.connect(_on_solution_checked)
	if GlobalC.first_puzzle_open:
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "ukladanie_planet")
		GlobalC.first_puzzle_open = false

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
		MusicManager.play_music("res://soundtracki/Magic Town.mp3")
		dialog = DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "teleportacja")
		await get_tree().process_frame  # poczekaj aż się zbuduje
		balloon = dialog.get_child(0)
		balloon.position = Vector2(90,25)
	

		
	
