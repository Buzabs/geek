extends Area2D

@export var load_scenes: String
@export var drzwiSFX: AudioStreamPlayer2D

var can_open: bool = false
var player_ref: Node = null
@export var target_spawn_id: String 


 # scene_path : Vector2

func _ready():
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)

func _on_enter(body):
	if get_tree().current_scene.get_name() == "TestScene":
		if body.is_in_group("player") && !GlobalC.isLocked:
			can_open = true
			player_ref = body
	else:
		if body.is_in_group("player"):
			can_open = true
			player_ref = body
		

func _on_exit(body):
	if body == player_ref:
		can_open = false
		player_ref = null
	






func _input_event(_viewport, event, _shape_idx):
	if GlobalC.open:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and can_open:
			can_open = false
			if self.is_in_group("doors"):
				drzwiSFX.play()
				await drzwiSFX.finished
			GlobalC.spawn_id = target_spawn_id
			get_tree().change_scene_to_file(load_scenes)
			GlobalC.loaded+=1

			if load_scenes == "res://scenes/tutorial/magazyn.tscn" and GlobalC.loaded == 2:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "sus")			
			if load_scenes == "res://scenes/tutorial/test_scene.tscn" and GlobalEq.dialogue:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "uzycie")			
