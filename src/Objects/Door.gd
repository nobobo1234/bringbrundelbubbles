extends StaticBody2D

onready var total_bottles: = get_tree().get_nodes_in_group("flessen").size()

func _ready() -> void:
	ScoreData.connect("bottles_updated", self, "update_door")
	
func update_door() -> void:
	if ScoreData.bottles == total_bottles:
		queue_free()
