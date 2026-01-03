extends Area2D

@export var open = Texture2D
@export var sprite = Sprite2D
@export var item: Area2D

func _ready():
	if item != null:
		item.visible = false


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		sprite.texture = open
		if item != null:
			item.visible = true
