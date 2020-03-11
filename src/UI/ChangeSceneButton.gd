tool
extends Button

export(String, FILE) var next_scene_path: = ""

func _on_button_up() -> void:
	ScoreData.levels = 0
	ScoreData.bottles = 0
	ScoreData.total_bottles = 0

	get_tree().change_scene(next_scene_path)
	
func _get_configuration_warning() -> String:
	return "next_scene_path must be set for the button to work" if next_scene_path == "" else ""
