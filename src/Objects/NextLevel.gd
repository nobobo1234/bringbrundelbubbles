tool
extends Area2D
# Portal that sends you to the next level

export var next_scene: PackedScene

func _on_body_entered(body: Node) -> void:
	teleport()
	
func _get_configuration_warning() -> String:
	return "The next_scene property can't be empty" if not next_scene else ""

func teleport():
	ScoreData.total_bottles_collected += ScoreData.total_bottles
	ScoreData.levels += 1
	get_tree().change_scene_to(next_scene)
