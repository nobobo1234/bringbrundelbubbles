extends Button
# Script for the button that restarts the level

func _on_button_up() -> void:
	get_tree().paused = false
	ScoreData.tries += 1
	get_tree().reload_current_scene()
