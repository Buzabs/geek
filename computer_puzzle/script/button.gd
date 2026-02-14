extends Control

@export var target: NodePath
@export var textures: Array[Texture2D] = []
@export var slot_id : String
var index := 0

func _ready():
	if GlobalC.textura_cyferki.has(slot_id):
		index = GlobalC.textura_cyferki[slot_id]
		if index >= 0 and index < textures.size():
			get_node(target).texture = textures[index]
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
		GlobalC.textura_cyferki[slot_id] = index
