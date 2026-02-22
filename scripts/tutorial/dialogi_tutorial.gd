extends Node


var dialogue_resource = preload("res://Dialogi/Tutorial.dialogue")
var clicks_enabled := false




func _input(event):
	if event is InputEventMouseButton and event.pressed and clicks_enabled:
		GlobalC.click_count += 1
		if GlobalC.click_count == 2:
			DialogueManager.show_example_dialogue_balloon(dialogue_resource, "podnoszenie")
			await DialogueManager.dialogue_ended
			GlobalEq.pick = true
		
			
		
func _init() -> void:
	GlobalC.loaded+=1
	if GlobalC.END:
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "powrot")
			await DialogueManager.dialogue_ended

			await get_tree().create_timer(2).timeout
			get_tree().change_scene_to_file("res://scenes/ending.tscn")
			
	if GlobalC.loaded == 1:
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, "chodzenie")		
		await DialogueManager.dialogue_ended
		clicks_enabled = true
	
