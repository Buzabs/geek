extends Area2D


@export var load_scenes: String
@export var wlaczony: Texture2D
@onready var sprite := $Portalwylaczony

var solution_ok: bool = false
var items: bool = false
var can_interact = false
var player_ref: Node = null

func _ready():
	solution_ok = GameSignals.solution_ok
	GameSignals.solution_checked.connect(_on_solution_checked)
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)	
	
func _on_enter(body):
	if body.is_in_group("player"):
		can_interact = true
		player_ref = body
		print("Gracz wszedł w obiekto")

func _on_exit(body):
	if body == player_ref: 
		can_interact = false
		player_ref = null
		print("Gracz wyszedł z obiektu")
		
func _on_solution_checked(is_correct: bool):
	solution_ok = is_correct


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and solution_ok and can_interact :
		if GlobalEq.selected_item_id == "suss":
				sprite.texture = wlaczony
				GlobalEq.remove_item("suss")
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/tutorial.dialogue"), "portal")	
				await get_tree().create_timer(2).timeout
				get_tree().change_scene_to_file(load_scenes)
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/tutorial.dialogue"), "portal2")	
