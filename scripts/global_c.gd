extends Node



#dialogue
var loaded: int = 0
var click_count := 0
var first_puzzle_open := false
var pick_up_suus := 0
var first_item_dialog_shown := false

func next():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "podnoszenie2")
	await DialogueManager.dialogue_ended
	await get_tree().create_timer(0.5).timeout
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "komputer")



#game stats
var puzzle_states : Dictionary = {}
var collected_items := {}


func _ready():
	await get_tree().process_frame
	print(get_tree().current_scene)
