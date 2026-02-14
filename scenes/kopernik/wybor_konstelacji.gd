extends Button

@export var id_wyboru : String
@export var target_spawn_id: String = "kopernik"

func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
		if id_wyboru == "wielki_woz":
			get_tree().change_scene_to_file("res://scenes/kopernik/gra_skorpion.tscn")
			return
		if id_wyboru == "skorpion":
			get_tree().change_scene_to_file("res://scenes/kopernik/gra_orzel.tscn")
			return
		if id_wyboru == "orzel":
			GlobalC.spawn_id = target_spawn_id
			get_tree().change_scene_to_file("res://scenes/kopernik/obserwatorium.tscn")
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "planety")	
			return
		if id_wyboru != "orzel"  or id_wyboru != "skorpion"  or id_wyboru != "wielki_woz":
			GlobalC.spawn_id = target_spawn_id
			get_tree().change_scene_to_file("res://scenes/kopernik/obserwatorium.tscn")
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "konstelacje_nieudany")	
			return
		
		
