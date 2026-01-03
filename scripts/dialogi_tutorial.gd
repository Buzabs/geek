extends Node

func _init() -> void:
	GlobalC.loaded+=1
	if GlobalC.loaded == 1:
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/tutorial.dialogue"), "chodzenie")
