extends Button
# Script for the button that quits the game

func _on_button_up() -> void:
	get_tree().quit()
