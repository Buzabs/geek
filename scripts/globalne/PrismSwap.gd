extends Node
var ciiii := false

func pryzmat() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1/pryzmat_gra.tscn")
	GlobalC.dialog= true


func konstelacje() -> void:
	get_tree().change_scene_to_file("res://scenes/kopernik/gra_wielki_maly_woz.tscn")

func ciii() -> void:
	ciiii = true
