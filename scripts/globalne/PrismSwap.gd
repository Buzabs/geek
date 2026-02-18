extends Node

var ciiii := false

func pryzmat() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1/pryzmat_gra.tscn")
	GlobalC.dialog= true


func konstelacje() -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "konstelacje_tlumaczenie")	
	get_tree().change_scene_to_file("res://scenes/kopernik/gra_wielki_maly_woz.tscn")

func ciii() -> void:
	ciiii = true
