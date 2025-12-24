extends Button

@export var checker: NodePath
var checker_node

func _ready():
	checker_node = get_node_or_null(checker)

func _apply():
	# zmieniasz tekstury...
	if checker_node:
		checker_node.check_solution()
