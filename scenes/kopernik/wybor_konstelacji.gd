extends Button

@export var id_wyboru : String
@export var target_spawn_id: String = "kopernik"

func _ready():
	
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
		if id_wyboru == "wielki_woz":
			$"../WielkiMalyWozComplete".visible = true
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/kopernik/gra_skorpion.tscn")
			return
		if id_wyboru == "skorpion":
			$"../SkorpionSkorpion".visible = true
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/kopernik/gra_orzel.tscn")
			
			return
		if id_wyboru == "orzel":
			$"../OrzelComplete".visible = true
			await get_tree().create_timer(2.0).timeout
			GlobalC.spawn_id = target_spawn_id
			get_tree().change_scene_to_file("res://scenes/kopernik/obserwatorium.tscn")
			GlobalC.rzut = false
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "planety")	
			
			return
		
		GlobalC.spawn_id = target_spawn_id
		get_tree().change_scene_to_file("res://scenes/kopernik/obserwatorium.tscn")
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "konstelacje_nieudany")	
		return
		
		
