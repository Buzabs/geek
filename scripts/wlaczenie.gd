extends Area2D

signal used
@export var wlaczony: Texture2D
@onready var sprite := $Portalwylaczony
var solution_ok: bool = false
var items: bool = false


func _ready():
	solution_ok = GameSignals.solution_ok
	GameSignals.solution_checked.connect(_on_solution_checked)

func _on_solution_checked(is_correct: bool):
	solution_ok = is_correct

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and solution_ok:
		if GlobalEq.selected_item_id == "sus":
				sprite.texture = wlaczony
				GlobalEq.remove_item("sus")
				
