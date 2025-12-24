extends Area2D

@export var wlaczony: Texture2D
@onready var sprite := $Portalwylaczony

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("KLIK DZIAŁA")
		if GlobalEq.selected_item != null:
			sprite.texture = wlaczony
