extends Area2D

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
	if event is InputEventMouseButton and event.pressed:
		if GlobalEq.selected_item_id == "sus" and solution_ok :
				sprite.texture = wlaczony
