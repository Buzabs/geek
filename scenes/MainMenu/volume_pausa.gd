extends CanvasLayer

@export var audio_manager: AudioStreamPlayer2D


func _on_texture_button_pressed() -> void:
	audio_manager.play()
	await audio_manager.finished
	visible = false
	GlobalC.volumeOff.emit()


@onready var master_slider = $MasterSlider


func _ready():
	# ustaw wartości startowe (1 = 100%)
	master_slider.value = GlobalC.volume_state	
	master_slider.value_changed.connect(_on_master_changed)
	



func _on_master_changed(value):
	set_volume("Master", value)
	GlobalC.volume_state = value




func set_volume(bus_name: String, value: float):
	var bus_index = AudioServer.get_bus_index(bus_name)

	var linear = value / 100.0
	
	if linear <= 0.0:
		AudioServer.set_bus_volume_db(bus_index, -80) # praktyczna cisza
	else:
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(linear))
