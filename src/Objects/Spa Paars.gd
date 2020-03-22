extends Area2D
# Script for the spa bottle

func _on_body_entered(body: Node) -> void:
	ScoreData.bottles += 1
	queue_free()
