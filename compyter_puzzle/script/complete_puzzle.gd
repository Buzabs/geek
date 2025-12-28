extends Control

func _ready():
	# Podłącz sygnał
	GameSignals.solution_checked.connect(_on_solution_checked)

	# Jeśli zagadka była już rozwiązana → od razu blokuj
	if GameSignals.puzzle_solved:
		_lock_scene()

func _on_solution_checked(correct: bool):
	if correct:
		GameSignals.puzzle_solved = true
		_lock_scene()

func _lock_scene():
	# Pokazuje blokadę i przechwytuje wszystkie kliknięcia
	$ColorRect.visible = true
	$ColorRect.modulate = Color(0.102, 0.937, 0.0, 0.451)  # przyciemnienie opcjonalnie
