extends Node2D


func _ready():
	if GlobalC.first_look:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "geocentryzm")
				GlobalC.first_look = false
