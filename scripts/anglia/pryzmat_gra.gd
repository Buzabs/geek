extends Area2D

@export var promien: Array[Texture2D]
@onready var sprite := $Pryzmat
@export var textures: Array[Texture2D]
@export var id: int
var index := 0

func _ready():
	if id == 2:
		$"../promien".texture = promien[0]
	input_event.connect(_on_input_event)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:

		index = (index + 1) % textures.size()
		sprite.texture = textures[index]
		if id == 2:
			$"../promien".texture = promien[0]
			if index == 2  :
				
					$"../promien".texture = promien[1]
