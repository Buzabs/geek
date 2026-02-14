extends Area2D

@export var id_planety : Array[String]
@export var planeta: Array[Texture2D]= []
@export var item_icon: Array[Texture2D]
@export var target:NodePath
var index : int = -1
@export var default: Texture2D



func _ready():
	if index >= 0  and  GlobalC.textura_planetki.has(id_planety[index]):
		var saved_index = GlobalC.textura_planetki[id_planety[index]]
		var t = get_node_or_null(target)
		t.texture = planeta[saved_index]
		self.index = saved_index

func ustaw_planetke(index):
	var t = get_node_or_null(target)
	GlobalEq.remove_item(GlobalEq.selected_item_id)
	t.texture = planeta[index]
	self.index = index
	GlobalC.textura_planetki[id_planety[index]] = index

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if get_node_or_null(target).texture == default:
			if  GlobalEq.selected_item_id == "slonce":
				index = 0
				ustaw_planetke(index)
			if  GlobalEq.selected_item_id == "merkury":
				index = 1
				ustaw_planetke(index)
			if  GlobalEq.selected_item_id == "venus":
				index = 2
				ustaw_planetke(index)
			if  GlobalEq.selected_item_id == "ziemia":
				index = 3
				ustaw_planetke(index)
			if  GlobalEq.selected_item_id == "mars":
				index = 4
				ustaw_planetke(index)
			if  GlobalEq.selected_item_id == "jowisz":
				index = 5
				ustaw_planetke(index)
			if  GlobalEq.selected_item_id == "saturn":
				index = 6
				ustaw_planetke(index)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed  :
		if get_node_or_null(target).texture == planeta[index]:
			var t = get_node_or_null(target)
			GlobalEq.add_item(item_icon[index],id_planety[index])
			
			t.texture = default
			GlobalC.textura_planetki[id_planety[index]] = index
