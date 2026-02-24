extends Sprite2D


func _ready():
		var dialog = DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "teleportacja")
		await get_tree().process_frame  # poczekaj aż się zbuduje
		var  balloon = dialog.get_child(0)
		balloon.position = Vector2(50, 25)
