extends Area2D

@export var id_planety : String
@export var planeta: Array[Texture2D]= []
@export var target:NodePath
@export var index : int
@export var default: Texture2D

@export var item_icon: Texture2D

func _ready():
	

	if GlobalC.textura_planetki.has(id_planety):
		var t = get_node_or_null(target)
		t.texture = GlobalC.textura_planetki[id_planety]

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if id_planety == GlobalEq.selected_item_id:
			
			var t = get_node_or_null(target)
		
			print("TARGET:", t)
			GlobalEq.remove_item(id_planety)
			
			t.texture = planeta[index]
			GlobalC.textura_planetki[id_planety] = t.texture
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed  :
		if get_node_or_null(target).texture ==planeta[index]:
			var t = get_node_or_null(target)
			GlobalEq.add_item(item_icon,id_planety)
			t.texture = default
			GlobalC.textura_planetki[id_planety] = t.texture
