extends Node



#dialogue
var loaded: int = 0
var click_count := 0
var first_puzzle_open := false
var dialog := false
var open:= false
var first_play := true
var first_play_next  := true
var next_dialog := false
var rzut=true
var wake_up := true

#other
var isLocked: bool = true

func next():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "podnoszenie2")
	await DialogueManager.dialogue_ended
	await get_tree().create_timer(0.5).timeout
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "komputer")
	dialog= true    

func cos():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_zagadka")
	await DialogueManager.dialogue_ended
	await get_tree().create_timer(2).timeout
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "poczatek_proca")
	
	
#game stats
var puzzle_states : Dictionary = {}
var collected_items := {}

var spawn_id: String = ""

var textura_cyferki := {}
var textura_planetki := {} 


func _ready():
	await get_tree().process_frame
	print(get_tree().current_scene)
