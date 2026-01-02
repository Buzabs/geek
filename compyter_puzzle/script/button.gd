extends Control

@export var target: NodePath
@export var textures: Array[Texture2D] = []

var index := 0

func _ready():
	_apply()
	process_mode = Node.PROCESS_MODE_ALWAYS

func set_next():
	index = (index + 1) % textures.size()
	_apply()

func set_prev():
	index = (index - 1 + textures.size()) % textures.size()
	_apply()

func _apply():
	var t = get_node_or_null(target)
	if t:
		t.texture = textures[index]
