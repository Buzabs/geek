extends Node

signal solution_checked(bool)
var solution_ok := false
# Flaga stanu zagadki
var puzzle_solved: bool = false

signal item_used(bool)
