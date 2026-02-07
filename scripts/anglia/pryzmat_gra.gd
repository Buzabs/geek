extends Area2D

@onready var sprite := $Pryzmat
@export var textures: Array[Texture2D]

var index := 0

func _ready():
	input_event.connect(_on_input_event)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:

		index = (index + 1) % textures.size()
		sprite.texture = textures[index]
