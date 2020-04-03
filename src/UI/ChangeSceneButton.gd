tool
extends Button
# Script for the button that changes a scene

export(String, FILE) var next_scene_path: = ""

func _get_configuration_warning() -> String:
	return "next_scene_path must be set for the button to work" if next_scene_path == "" else ""

func _on_button_up() -> void:
	ScoreData.levels = 1
	ScoreData.bottles = 0
	ScoreData.total_bottles = 0
	get_tree().paused = false
	get_tree().change_scene(next_scene_path)
