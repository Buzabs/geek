extends Control

@export var target: NodePath
@export var textures: Array[Texture2D] = []

var index := 0
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func set_next():
	index += 1
	if index >= textures.size():
		index = 0
	_apply()

func set_prev():
	index -= 1
	if index < 0:
		index = textures.size() - 1
	_apply()

func _apply():
	var t = get_node_or_null(target)
	if t == null or textures.size() == 0:
		return

	if t is TextureRect:
		t.texture = textures[index]
	elif t is Sprite2D:
		t.texture = textures[index]
	elif t is Button:
		t.icon = textures[index]
