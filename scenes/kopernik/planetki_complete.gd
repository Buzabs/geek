extends Node2D

var target_spawn_id: String ="planetki"
@export var pause_scene: PackedScene




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
		MusicManager.play_music("res://soundtracki/magical_theme.wav")
		get_tree().change_scene_to_file("res://scenes/level_1/anglia.tscn")
		var dialog = DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "teleportacja")
		
		
		
	
