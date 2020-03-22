extends Button
# Script for the button that continues the game

func _on_button_up() -> void:
	get_parent().get_parent().get_parent().paused = false
