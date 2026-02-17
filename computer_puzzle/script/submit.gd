extends TextureButton

@export var required_id: Array[int]
@export var slots: Array[Node]


@export var ok_button: TextureButton
@export var ok_icon_correct: CompressedTexture2D



func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	
func _pressed():
		if slots.size() != required_id.size():
		
			return
		for i in range(slots.size()):
			
			var selector = slots[i]
		
			if selector.index != required_id[i]:
		
				return
		
		ok_button.texture_normal = ok_icon_correct
		ok_button.disabled = true
		GameSignals.solution_ok = true
		GameSignals.solution_checked.emit()
					
					
					
