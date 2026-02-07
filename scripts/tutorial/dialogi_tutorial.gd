extends Node


var dialogue_resource = preload("res://Dialogi/Tutorial.dialogue")
var clicks_enabled := false




func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if not clicks_enabled:
			await DialogueManager.dialogue_ended
			clicks_enabled = true
			return 
		GlobalC.click_count += 1
		if GlobalC.click_count == 2:
			DialogueManager.show_example_dialogue_balloon(dialogue_resource, "podnoszenie")
			await DialogueManager.dialogue_ended
			GlobalEq.pick = true
	
		
		
		
func _init() -> void:
	GlobalC.loaded+=1
	if GlobalC.loaded == 1:
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, "chodzenie")		
		

	
